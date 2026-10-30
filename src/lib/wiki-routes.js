// Wiki 路由：文件树、词条（folder/page/student/teacher）、修订提交与审核、附件
import { Hono } from 'hono';
import {
  GRADES, audit, auth, b64d, bumpPageCount, bustCache, isOrgAdminOf, isWebsiteAdmin, jsonErr, notify, ok, pwGuard, randomToken, validClass,
  WIKI_PERMS, DEFAULT_WIKI_PERM,
} from './common.js';

const r = new Hono();
const MAX_CONTENT = 50000;
const MAX_FILE = 1024 * 1024; // 附件单文件上限 1MB（D1 BLOB）
const KIND_LABEL = { folder: '文件夹', page: '词条', grade: '年级页', class: '班级页', student: '学生页', teacher: '老师页' };

// 默认组织 id（单组织站点，取第一个组织）
async function defaultOrgId(c) {
  const org = await c.env.db.prepare('SELECT id FROM orgs ORDER BY id LIMIT 1').first();
  return org?.id || null;
}
// 组织的档案库权限（普通用户能做什么）
async function orgPerm(c, orgId) {
  const row = await c.env.db.prepare('SELECT wiki_perm FROM orgs WHERE id = ?').bind(orgId).first();
  return WIKI_PERMS[row?.wiki_perm] ? row.wiki_perm : DEFAULT_WIKI_PERM;
}
async function getPage(c, slug) {
  return c.env.db.prepare('SELECT * FROM wiki_pages WHERE slug = ?').bind(slug).first();
}
// 面包屑：从当前页沿 parent_id 向上走
async function ancestorsOf(c, page) {
  const chain = [];
  let cur = page;
  while (cur.parent_id && chain.length < 12) {
    const p = await c.env.db.prepare('SELECT id, parent_id, slug, title, kind FROM wiki_pages WHERE id = ?').bind(cur.parent_id).first();
    if (!p) break;
    chain.unshift(p);
    cur = p;
  }
  return chain;
}

// ===== 折叠树数据（扁平节点，前端自建树）=====
r.get('/tree', async (c) => {
  const orgId = c.req.query('org_id') ? parseInt(c.req.query('org_id')) : await defaultOrgId(c);
  if (!orgId) return ok(c, { nodes: [] });
  // 默认不含学生节点（学生散在各班级下、占全表 95% 行数）；班级展开时前端按需拉取。
  // 显式 ?students=1 时返回全量（兼容旧行为）。
  // v2.0：INDEXED BY 强制走 (org_id, kind) 复合索引——planner 为满足 ORDER BY id 会退化为
  // org_id 单索引全 org 扫描（3698 行/次）；强控后读 ~209 行（实测）。
  const withStudents = c.req.query('students') === '1';
  const rows = withStudents
    ? await c.env.db.prepare(`
        SELECT id, parent_id, kind, grade, class_name, slug, title FROM wiki_pages
        WHERE org_id = ? ORDER BY id`).bind(orgId).all()
    : await c.env.db.prepare(`
        SELECT id, parent_id, kind, grade, class_name, slug, title FROM wiki_pages INDEXED BY idx_wiki_pages_org_kind
        WHERE org_id = ? AND kind IN ('folder','grade','class','page','teacher') ORDER BY id`).bind(orgId).all();
  return ok(c, { nodes: rows.results || [], perm: await orgPerm(c, orgId) });
});

// ===== 页面索引（分页 + 过滤）=====
r.get('/pages', async (c) => {
  const orgId = c.req.query('org_id') ? parseInt(c.req.query('org_id')) : await defaultOrgId(c);
  const grade = c.req.query('grade') || '';
  const cls = c.req.query('class') || '';
  const kind = c.req.query('kind') || '';
  const parent = c.req.query('parent') || '';
  const q = (c.req.query('q') || '').trim().slice(0, 50);
  const page = Math.max(parseInt(c.req.query('page')) || 1, 1);
  // size=all 表示不分页全量返回（班级页学生名单等场景）；其余按 1..200 截断
  const sizeRaw = (c.req.query('size') || '30').trim();
  const size = sizeRaw === 'all' ? 1000000 : Math.min(Math.max(parseInt(sizeRaw) || 30, 1), 200);
  let where = 'org_id = ?';
  const binds = [orgId];
  if (grade) { where += ' AND grade = ?'; binds.push(grade); }
  if (cls) { where += ' AND class_name = ?'; binds.push(cls); }
  if (kind) { where += ' AND kind = ?'; binds.push(kind); }
  if (parent === 'root') { where += ' AND parent_id IS NULL'; }
  else if (parent) { where += ' AND parent_id = ?'; binds.push(parseInt(parent)); }
  if (q) { where += ' AND title LIKE ?'; binds.push(`%${q}%`); }
  // COUNT(*) 是全表扫描，免费层按行计费下是主要开销：
  // size=all 场景（班级页学生名单）跳过 COUNT，直接全量返回；分页场景用 limit+1 判断有无下一页。
  const wantAll = sizeRaw === 'all';
  const rows = await c.env.db.prepare(`
    SELECT id, kind, grade, class_name, parent_id, slug, title, current_rev_id, updated_at
    FROM wiki_pages WHERE ${where} ORDER BY updated_at DESC LIMIT ? OFFSET ?`)
    .bind(...binds, wantAll ? 1000000 : size + 1, (page - 1) * (wantAll ? 0 : size)).all();
  const list = rows.results || [];
  if (wantAll) {
    return ok(c, { pages: list, total: list.length, page, size: 'all', has_more: false });
  }
  const hasMore = list.length > size;
  return ok(c, { pages: hasMore ? list.slice(0, size) : list, total: -1, page, size, has_more: hasMore });
});

// ===== 页面详情（含子节点、附件、面包屑）=====
r.get('/pages/:slug', async (c) => {
  const page = await getPage(c, c.req.param('slug'));
  if (!page) return jsonErr(c, '页面不存在', 404);
  let content = '';
  let rev = null;
  if (page.current_rev_id) {
    rev = await c.env.db.prepare(`
      SELECT r.id, r.message, r.created_at, u.username FROM wiki_revisions r JOIN users u ON u.id = r.author_id WHERE r.id = ?`)
      .bind(page.current_rev_id).first();
    if (rev) {
      const full = await c.env.db.prepare('SELECT content FROM wiki_revisions WHERE id = ?').bind(page.current_rev_id).first();
      content = full?.content || '';
    }
  }
  // 直接子节点（文件夹/年级页/班级页展示用）
  const children = (await c.env.db.prepare(`
    SELECT id, kind, grade, class_name, slug, title, updated_at FROM wiki_pages
    WHERE parent_id = ? ORDER BY kind, title`).bind(page.id).all()).results || [];
  // 附件列表（不含数据体）
  const files = (await c.env.db.prepare(`
    SELECT f.id, f.filename, f.mime, f.size, f.created_at, f.uploader_id, u.username AS uploader
    FROM wiki_files f JOIN users u ON u.id = f.uploader_id WHERE f.page_id = ? ORDER BY f.id DESC`).bind(page.id).all()).results || [];
  let teachers = [];
  if (page.kind === 'class') {
    teachers = (await c.env.db.prepare(`
      SELECT tp.slug, tp.title FROM class_teachers ct JOIN wiki_pages tp ON tp.id = ct.teacher_page_id
      WHERE ct.class_page_id = ?`).bind(page.id).all()).results || [];
  }
  const ancestors = await ancestorsOf(c, page);
  const user = await auth(c);
  let canEdit = !!user;
  let isAdmin = false;
  if (user) {
    if (await isWebsiteAdmin(user)) { isAdmin = true; }
    else {
      const m = await c.env.db.prepare('SELECT role FROM org_members WHERE user_id = ? AND org_id = ? AND status = "approved"').bind(user.id, page.org_id).first();
      if (m && m.role === 'org_admin') isAdmin = true;
    }
  }
  const pending = await c.env.db.prepare('SELECT COUNT(*) AS n FROM wiki_revisions WHERE page_id = ? AND status = "pending"').bind(page.id).first();
  return ok(c, {
    page: { ...page, teachers, children, files, has_pending: (pending?.n || 0) > 0 },
    content, current_rev: rev || null, ancestors, can_edit: canEdit, is_admin: isAdmin,
  });
});

// ===== 创建词条（全员；类型：词条/学生页/老师页）=====
r.post('/pages', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/wiki/pages');
  if (g) return g;
  const body = await c.req.json().catch(() => ({}));
  const title = String(body.title || '').trim().slice(0, 60);
  let kind = String(body.kind || 'page');
  if (!['page', 'student', 'teacher'].includes(kind)) kind = 'page';
  if (!title) return jsonErr(c, '标题不能为空');
  const orgId = await defaultOrgId(c);
  if (!orgId) return jsonErr(c, '站点尚未初始化组织', 500);
  const perm = await orgPerm(c, orgId);
  const isAdmin = await isOrgAdminOf(c, user, orgId);
  // 全部需审核：普通用户不能直接新建词条（仅管理员可建）
  if (perm === 'all_review' && !isAdmin) {
    return jsonErr(c, '当前组织权限为「全部需审核」，新建词条需由组织管理员操作', 403);
  }
  // 父节点校验
  let parentId = body.parent_id ? parseInt(body.parent_id) : null;
  if (parentId) {
    const parent = await c.env.db.prepare('SELECT id, org_id FROM wiki_pages WHERE id = ?').bind(parentId).first();
    if (!parent || parent.org_id !== orgId) return jsonErr(c, '上级目录不存在');
  }
  // 学生页必须带合法班级
  let grade = '';
  let cls = '';
  if (kind === 'student') {
    cls = String(body.class_name || '').trim().toUpperCase();
    if (!validClass(cls)) return jsonErr(c, '班级格式不正确，应如 J2801');
    grade = cls.slice(0, 3);
    if (!GRADES.includes(grade)) return jsonErr(c, '年级不在站点范围内');
  }
  const slug = 'w' + randomToken(8);
  const res = await c.env.db.prepare('INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title, created_at) VALUES (?,?,?,?,?,?,?,datetime("now"))')
    .bind(orgId, kind, grade, cls, parentId, slug, title).run();
  const pageId = res.meta.last_row_id;
  // 初始内容：管理员或免审权限（all/create_edit）直接发布，其余走待审修订
  const content = String(body.content || '').slice(0, MAX_CONTENT);
  if (content.trim()) {
    if (isAdmin || perm === 'all' || perm === 'create_edit') {
      const rr = await c.env.db.prepare('INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at) VALUES (?,?,?,?,"approved",?,datetime("now"))')
        .bind(pageId, user.id, content, '创建词条', user.id).run();
      await c.env.db.prepare('UPDATE wiki_pages SET current_rev_id = ?, updated_at = datetime("now") WHERE id = ?').bind(rr.meta.last_row_id, pageId).run();
    } else {
      await c.env.db.prepare('INSERT INTO wiki_revisions (page_id, author_id, content, message, status) VALUES (?,?,?,?,"pending")')
        .bind(pageId, user.id, content, '创建词条').run();
    }
  }
  await audit(c, user.id, 'wiki_page_create', 'wiki_page', pageId, `${kind}:${title}`);
  await bumpPageCount(c, 1);
  await bustCache(c, ['cache:home']);
  return ok(c, { slug, id: pageId });
});

// ===== 创建文件夹（组织管理员；权限为「所有」时普通用户也可建）=====
r.post('/folders', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const body = await c.req.json().catch(() => ({}));
  const title = String(body.title || '').trim().slice(0, 60);
  if (!title) return jsonErr(c, '标题不能为空');
  const orgId = await defaultOrgId(c);
  if (!orgId) return jsonErr(c, '站点尚未初始化组织', 500);
  const perm = await orgPerm(c, orgId);
  if (!(await isOrgAdminOf(c, user, orgId)) && perm !== 'all') return jsonErr(c, '无权限', 403);
  let parentId = body.parent_id ? parseInt(body.parent_id) : null;
  if (parentId) {
    const parent = await c.env.db.prepare('SELECT id, org_id FROM wiki_pages WHERE id = ?').bind(parentId).first();
    if (!parent || parent.org_id !== orgId) return jsonErr(c, '上级目录不存在');
  }
  const slug = 'f' + randomToken(8);
  const res = await c.env.db.prepare('INSERT INTO wiki_pages (org_id, kind, slug, title, parent_id, created_at) VALUES (?,?,?,?,?,datetime("now"))')
    .bind(orgId, 'folder', slug, title, parentId).run();
  await bumpPageCount(c, 1);
  await bustCache(c, ['cache:home']);
  await audit(c, user.id, 'wiki_folder_create', 'wiki_page', res.meta.last_row_id, title);
  return ok(c, { slug, id: res.meta.last_row_id });
});

// ===== 移动页面（组织管理员；禁止移入自身后代）=====
r.post('/pages/:slug/move', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const page = await getPage(c, c.req.param('slug'));
  if (!page) return jsonErr(c, '页面不存在', 404);
  if (!(await isOrgAdminOf(c, user, page.org_id))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => ({}));
  let parentId = body.parent_id ? parseInt(body.parent_id) : null;
  if (parentId === page.id) return jsonErr(c, '不能移动到自身');
  if (parentId) {
    // 沿目标父链上走，确认存在、同组织、且不是 page 的后代
    let cur = parentId;
    for (let i = 0; cur && i < 60; i++) {
      const p = await c.env.db.prepare('SELECT id, parent_id, org_id FROM wiki_pages WHERE id = ?').bind(cur).first();
      if (!p) return jsonErr(c, '目标目录不存在');
      if (p.id === page.id) return jsonErr(c, '不能移动到自己的子目录下');
      if (p.org_id !== page.org_id) return jsonErr(c, '目标目录不存在');
      cur = p.parent_id;
    }
  }
  await c.env.db.prepare('UPDATE wiki_pages SET parent_id = ?, updated_at = datetime("now") WHERE id = ?').bind(parentId, page.id).run();
  await audit(c, user.id, 'wiki_move', 'wiki_page', page.id, `parent:${parentId}`);
  return ok(c, { ok: true });
});

// ===== 回滚到历史修订（组织管理员；把旧版本内容作为新已通过修订写入）=====
r.post('/revisions/:id/rollback', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const rev = await c.env.db.prepare(`
    SELECT r.*, p.org_id, p.slug FROM wiki_revisions r JOIN wiki_pages p ON p.id = r.page_id WHERE r.id = ?`).bind(c.req.param('id')).first();
  if (!rev) return jsonErr(c, '修订不存在', 404);
  if (!(await isOrgAdminOf(c, user, rev.org_id))) return jsonErr(c, '无权限', 403);
  if (rev.status !== 'approved') return jsonErr(c, '只能回滚到已通过的版本');
  const rr = await c.env.db.prepare('INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at) VALUES (?,?,?,?,"approved",?,datetime("now"))')
    .bind(rev.page_id, user.id, rev.content, `回滚到版本 #${rev.id}`, user.id).run();
  await c.env.db.prepare('UPDATE wiki_pages SET current_rev_id = ?, updated_at = datetime("now") WHERE id = ?').bind(rr.meta.last_row_id, rev.page_id).run();
  await audit(c, user.id, 'wiki_rollback', 'wiki_page', rev.page_id, `rev:${rev.id}`);
  return ok(c, { ok: true, rev_id: rr.meta.last_row_id });
});

// ===== 删除页面（组织管理员；文件夹需先清空）=====
r.delete('/pages/:slug', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const page = await getPage(c, c.req.param('slug'));
  if (!page) return jsonErr(c, '页面不存在', 404);
  if (!(await isOrgAdminOf(c, user, page.org_id))) return jsonErr(c, '无权限', 403);
  if (page.kind === 'folder') {
    const child = await c.env.db.prepare('SELECT id FROM wiki_pages WHERE parent_id = ? LIMIT 1').bind(page.id).first();
    if (child) return jsonErr(c, '文件夹下还有内容，请先移走或删除');
  }
  await c.env.db.prepare('DELETE FROM wiki_revisions WHERE page_id = ?').bind(page.id).run();
  await c.env.db.prepare('DELETE FROM wiki_files WHERE page_id = ?').bind(page.id).run();
  await c.env.db.prepare('DELETE FROM class_teachers WHERE class_page_id = ? OR teacher_page_id = ?').bind(page.id, page.id).run();
  await c.env.db.prepare('DELETE FROM wiki_pages WHERE id = ?').bind(page.id).run();
  await bumpPageCount(c, -1);
  await bustCache(c, ['cache:home']);
  await audit(c, user.id, 'wiki_page_delete', 'wiki_page', page.id, page.title);
  return ok(c, { ok: true });
});

// ===== 提交修订（全员可改，待审）=====
r.post('/pages/:slug/revisions', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/wiki/revisions');
  if (g) return g;
  const page = await getPage(c, c.req.param('slug'));
  if (!page) return jsonErr(c, '页面不存在', 404);
  if (page.kind === 'folder') return jsonErr(c, '文件夹没有内容可编辑');
  const body = await c.req.json().catch(() => null);
  const content = String(body?.content ?? '').slice(0, MAX_CONTENT);
  if (!content.trim()) return jsonErr(c, '内容不能为空');
  if (content.length > MAX_CONTENT) return jsonErr(c, `内容过长（上限 ${MAX_CONTENT} 字符）`);
  const msg = String(body?.message || '').slice(0, 100);
  // 权限为「所有」或「可新建可编辑」时，普通用户编辑免审直接生效；否则走待审队列
  const perm = await orgPerm(c, page.org_id);
  const direct = (await isOrgAdminOf(c, user, page.org_id)) || perm === 'all' || perm === 'create_edit';
  if (direct) {
    const rr = await c.env.db.prepare('INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at) VALUES (?,?,?,?,"approved",?,datetime("now"))')
      .bind(page.id, user.id, content, msg || '编辑词条', user.id).run();
    await c.env.db.prepare('UPDATE wiki_pages SET current_rev_id = ?, updated_at = datetime("now") WHERE id = ?').bind(rr.meta.last_row_id, page.id).run();
    await audit(c, user.id, 'wiki_save', 'wiki_page', page.id, msg);
    return ok(c, { ok: true, direct: true });
  }
  const dup = await c.env.db.prepare('SELECT id FROM wiki_revisions WHERE page_id = ? AND author_id = ? AND status = "pending"').bind(page.id, user.id).first();
  if (dup) return jsonErr(c, '你已有一个待审修改，请等待审核结果');
  await c.env.db.prepare('INSERT INTO wiki_revisions (page_id, author_id, content, message, status) VALUES (?,?,?,?,"pending")')
    .bind(page.id, user.id, content, msg).run();
  await audit(c, user.id, 'wiki_submit', 'wiki_page', page.id, msg);
  return ok(c, { ok: true, direct: false });
});

// ===== 管理员免审直接保存 =====
r.post('/pages/:slug/save', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const page = await getPage(c, c.req.param('slug'));
  if (!page) return jsonErr(c, '页面不存在', 404);
  if (page.kind === 'folder') return jsonErr(c, '文件夹没有内容可编辑');
  if (!(await isOrgAdminOf(c, user, page.org_id))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => null);
  const content = String(body?.content ?? '').slice(0, MAX_CONTENT);
  if (!content.trim()) return jsonErr(c, '内容不能为空');
  const msg = String(body?.message || '管理员直接保存').slice(0, 100);
  const res = await c.env.db.prepare('INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at) VALUES (?,?,?,?,"approved",?,datetime("now"))')
    .bind(page.id, user.id, content, msg, user.id).run();
  await c.env.db.prepare('UPDATE wiki_pages SET current_rev_id = ?, updated_at = datetime("now") WHERE id = ?')
    .bind(res.meta.last_row_id, page.id).run();
  await audit(c, user.id, 'wiki_save', 'wiki_page', page.id, '');
  return ok(c, { ok: true });
});

// ===== 创建老师页面（org_admin，挂入「教师档案」文件夹）=====
r.post('/teachers', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const body = await c.req.json().catch(() => ({}));
  const title = String(body.title || '').trim().slice(0, 30);
  const orgId = parseInt(body.org_id);
  if (!title || !orgId) return jsonErr(c, '参数不完整');
  if (!(await isOrgAdminOf(c, user, orgId))) return jsonErr(c, '无权限', 403);
  const folder = await c.env.db.prepare('SELECT id FROM wiki_pages WHERE org_id = ? AND slug = "folder-teachers"').bind(orgId).first();
  const slug = 'teacher-' + title.replace(/[^\p{L}\p{N}]/gu, '') + '-' + randomToken(3);
  await c.env.db.prepare('INSERT INTO wiki_pages (org_id, kind, slug, title, parent_id, created_at) VALUES (?,?,?,?,?,datetime("now"))')
    .bind(orgId, 'teacher', slug, title, folder?.id || null).run();
  await bumpPageCount(c, 1);
  await bustCache(c, ['cache:home']);
  await audit(c, user.id, 'teacher_create', 'wiki_page', 0, title);
  return ok(c, { slug });
});

// ===== 修订历史 =====
r.get('/pages/:slug/history', async (c) => {
  const page = await c.env.db.prepare('SELECT id, slug, title FROM wiki_pages WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!page) return jsonErr(c, '页面不存在', 404);
  const rows = await c.env.db.prepare(`
    SELECT r.id, r.message, r.status, r.created_at, r.reviewed_at, u.username AS author
    FROM wiki_revisions r JOIN users u ON u.id = r.author_id
    WHERE r.page_id = ? ORDER BY r.id DESC LIMIT 50`).bind(page.id).all();
  return ok(c, { page, revisions: rows.results || [] });
});

// ===== 附件上传（登录用户；base64 JSON，≤1MB）=====
r.post('/pages/:slug/files', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/wiki/files');
  if (g) return g;
  const page = await getPage(c, c.req.param('slug'));
  if (!page) return jsonErr(c, '页面不存在', 404);
  const body = await c.req.json().catch(() => null);
  const filename = String(body?.filename || '').trim().slice(0, 120);
  const mime = String(body?.mime || '').slice(0, 80);
  const raw = String(body?.data || '');
  if (!filename || !raw) return jsonErr(c, '参数不完整');
  if (raw.length * 3 / 4 > MAX_FILE) return jsonErr(c, '文件超过 1MB 上限');
  let data;
  try { data = b64d(raw); } catch { return jsonErr(c, '文件数据解析失败'); }
  if (data.byteLength > MAX_FILE) return jsonErr(c, '文件超过 1MB 上限');
  const res = await c.env.db.prepare('INSERT INTO wiki_files (page_id, filename, mime, size, data, uploader_id) VALUES (?,?,?,?,?,?)')
    .bind(page.id, filename, mime, data.byteLength, data, user.id).run();
  await audit(c, user.id, 'wiki_file_upload', 'wiki_page', page.id, filename);
  return ok(c, { id: res.meta.last_row_id, size: data.byteLength });
});

// ===== 附件下载（公开）=====
r.get('/files/:id', async (c) => {
  const f = await c.env.db.prepare('SELECT f.*, u.username AS uploader FROM wiki_files f JOIN users u ON u.id = f.uploader_id WHERE f.id = ?')
    .bind(parseInt(c.req.param('id'))).first();
  if (!f) return jsonErr(c, '文件不存在', 404);
  // D1 返回的 BLOB 可能是 ArrayBuffer / Uint8Array / 数字数组，统一归一化
  let bin;
  if (f.data instanceof ArrayBuffer) bin = new Uint8Array(f.data);
  else if (f.data instanceof Uint8Array) bin = f.data;
  else if (Array.isArray(f.data)) bin = new Uint8Array(f.data);
  else bin = new Uint8Array(0);
  const name = f.filename.replace(/["\r\n]/g, '_');
  c.header('Content-Type', f.mime || 'application/octet-stream');
  c.header('Content-Disposition', `attachment; filename="${name}"; filename*=UTF-8''${encodeURIComponent(f.filename)}`);
  return c.body(bin.buffer.slice(bin.byteOffset, bin.byteOffset + bin.byteLength));
});

// ===== 删除附件（上传者本人或组织管理员）=====
r.delete('/files/:id', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const f = await c.env.db.prepare('SELECT * FROM wiki_files WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!f) return jsonErr(c, '文件不存在', 404);
  const page = await c.env.db.prepare('SELECT org_id FROM wiki_pages WHERE id = ?').bind(f.page_id).first();
  if (f.uploader_id !== user.id && !(await isOrgAdminOf(c, user, page?.org_id))) return jsonErr(c, '无权限', 403);
  await c.env.db.prepare('DELETE FROM wiki_files WHERE id = ?').bind(f.id).run();
  await audit(c, user.id, 'wiki_file_delete', 'wiki_page', f.page_id, f.filename);
  return ok(c, { ok: true });
});

// ===== 审核队列 =====
r.get('/revisions', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const status = c.req.query('status') || 'pending';
  const page = Math.max(parseInt(c.req.query('page')) || 1, 1);
  const size = 20;
  let where = 'r.status = ?';
  const binds = [status];
  if (!(await isWebsiteAdmin(user))) {
    // org_admin 仅看本组织
    const orgs = (await c.env.db.prepare('SELECT org_id FROM org_members WHERE user_id = ? AND role = "org_admin" AND status = "approved"').bind(user.id).all()).results || [];
    if (!orgs.length) return ok(c, { revisions: [], total: 0, page, size });
    where += ` AND p.org_id IN (${orgs.map(() => '?').join(',')})`;
    binds.push(...orgs.map((o) => o.org_id));
  }
  const total = await c.env.db.prepare(`SELECT COUNT(*) AS n FROM wiki_revisions r JOIN wiki_pages p ON p.id = r.page_id WHERE ${where}`).bind(...binds).first();
  const rows = await c.env.db.prepare(`
    SELECT r.id, r.message, r.status, r.created_at, p.slug, p.title AS page_title, p.grade, p.class_name, u.username AS author
    FROM wiki_revisions r JOIN wiki_pages p ON p.id = r.page_id JOIN users u ON u.id = r.author_id
    WHERE ${where} ORDER BY r.id DESC LIMIT ? OFFSET ?`).bind(...binds, size, (page - 1) * size).all();
  return ok(c, { revisions: rows.results || [], total: total?.n || 0, page, size });
});

// ===== 修订对比（待审修订 vs 当前发布版，供审核弹窗）=====
r.get('/revisions/:id/diff', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const rev = await c.env.db.prepare(`
    SELECT r.*, p.org_id, p.slug, p.title AS page_title, p.current_rev_id, u.username AS author
    FROM wiki_revisions r JOIN wiki_pages p ON p.id = r.page_id JOIN users u ON u.id = r.author_id
    WHERE r.id = ?`).bind(c.req.param('id')).first();
  if (!rev) return jsonErr(c, '修订不存在', 404);
  if (!(await isOrgAdminOf(c, user, rev.org_id))) return jsonErr(c, '无权限', 403);
  // 当前发布版：优先 current_rev_id，其次该页最新 approved 修订；都没有则为新页面
  let current = '';
  if (rev.current_rev_id) {
    const cur = await c.env.db.prepare('SELECT content FROM wiki_revisions WHERE id = ?').bind(rev.current_rev_id).first();
    current = cur?.content || '';
  }
  if (!current) {
    const cur = await c.env.db.prepare('SELECT content FROM wiki_revisions WHERE page_id = ? AND status = "approved" ORDER BY id DESC LIMIT 1').bind(rev.page_id).first();
    current = cur?.content || '';
  }
  return ok(c, {
    revision: { id: rev.id, message: rev.message, author: rev.author, created_at: rev.created_at, page_title: rev.page_title, slug: rev.slug, content: rev.content },
    current,
  });
});

// ===== 通过 / 驳回 =====
r.post('/revisions/:id/:action', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const rev = await c.env.db.prepare(`
    SELECT r.*, p.org_id, p.slug FROM wiki_revisions r JOIN wiki_pages p ON p.id = r.page_id WHERE r.id = ?`).bind(c.req.param('id')).first();
  if (!rev) return jsonErr(c, '修订不存在', 404);
  if (!(await isOrgAdminOf(c, user, rev.org_id))) return jsonErr(c, '无权限', 403);
  const action = c.req.param('action');
  if (action === 'approve') {
    if (rev.status !== 'pending') return jsonErr(c, '该修订已处理');
    await c.env.db.prepare('UPDATE wiki_revisions SET status = "approved", reviewer_id = ?, reviewed_at = datetime("now") WHERE id = ?').bind(user.id, rev.id).run();
    await c.env.db.prepare('UPDATE wiki_pages SET current_rev_id = ?, updated_at = datetime("now") WHERE id = ?').bind(rev.id, rev.page_id).run();
    await audit(c, user.id, 'wiki_approve', 'wiki_page', rev.page_id, `rev:${rev.id}`);
    if (rev.author_id !== user.id) {
      await notify(c, rev.author_id, 'wiki_approved', '你对词条的修订已通过审核', '', `#/wiki/${rev.slug}`);
    }
    return ok(c, { ok: true });
  }
  if (action === 'reject') {
    if (rev.status !== 'pending') return jsonErr(c, '该修订已处理');
    const body = await c.req.json().catch(() => ({}));
    await c.env.db.prepare('UPDATE wiki_revisions SET status = "rejected", reviewer_id = ?, reviewed_at = datetime("now"), message = ? WHERE id = ?')
      .bind(user.id, String(body.reason || '审核未通过').slice(0, 100), rev.id).run();
    await audit(c, user.id, 'wiki_reject', 'wiki_page', rev.page_id, `rev:${rev.id}`);
    if (rev.author_id !== user.id) {
      await notify(c, rev.author_id, 'wiki_rejected', '你对词条的修订未通过审核', String(body.reason || '审核未通过').slice(0, 100), `#/wiki/${rev.slug}`);
    }
    return ok(c, { ok: true });
  }
  return jsonErr(c, '未知操作');
});

export default r;
