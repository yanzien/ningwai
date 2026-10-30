// 组织路由：列表/搜索、加入、邀请码、组织管理（成员/老师关联）
import { Hono } from 'hono';
import {
  audit, auth, bustCache, getMembership, isOrgAdminOf, isWebsiteAdmin,
  jsonErr, ok, pubUser, randomToken, validClass, validStudentNo, pwGuard,
  WIKI_PERMS,
} from './common.js';

const r = new Hono();

// ===== 公开组织列表 + 搜索 =====
r.get('/', async (c) => {
  const q = (c.req.query('q') || '').trim().slice(0, 50);
  let sql = 'SELECT id, name, slug, type, join_mode, description, created_at FROM orgs WHERE type = "public"';
  const binds = [];
  if (q) { sql += ' AND (name LIKE ? OR description LIKE ?)'; binds.push(`%${q}%`, `%${q}%`); }
  sql += ' ORDER BY created_at LIMIT 100';
  const list = await c.env.db.prepare(sql).bind(...binds).all();
  return ok(c, { orgs: list.results || [] });
});

// ===== 组织详情 =====
r.get('/:slug', async (c) => {
  const org = await c.env.db.prepare('SELECT id, name, slug, type, join_mode, wiki_perm, description, created_at FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  const cnt = await c.env.db.prepare('SELECT COUNT(*) AS n FROM org_members WHERE org_id = ? AND status = "approved"').bind(org.id).first();
  const user = await auth(c);
  let my = null;
  if (user) {
    my = await c.env.db.prepare('SELECT role, status, class_name, real_name, student_no FROM org_members WHERE user_id = ? AND org_id = ?').bind(user.id, org.id).first() || null;
  }
  return ok(c, { org: { ...org, member_count: cnt?.n || 0 }, my });
});

// ===== 加入公开组织 =====
r.post('/:slug/join', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/orgs/join');
  if (g) return g;
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (org.type !== 'public') return jsonErr(c, '非公开组织请使用邀请码加入');
  const body = await c.req.json().catch(() => ({}));
  const { class_name, real_name, student_no } = body;
  if (!validClass(class_name) || !real_name || !validStudentNo(String(student_no || ''))) {
    return jsonErr(c, '请填写正确的班级、姓名、学号（如 J2804 / 张三 / 01）');
  }
  const exist = await getMembership(c, user.id, org.id);
  const pend = await c.env.db.prepare('SELECT id FROM org_members WHERE user_id = ? AND org_id = ? AND status = "pending"').bind(user.id, org.id).first();
  if (exist) return jsonErr(c, '你已是该组织成员');
  if (pend) return jsonErr(c, '加入申请审核中，请耐心等待');
  const status = org.join_mode === 'approval' ? 'pending' : 'approved';
  await c.env.db.prepare('INSERT INTO org_members (org_id, user_id, role, class_name, real_name, student_no, status) VALUES (?,?,?,?,?,?,?)')
    .bind(org.id, user.id, 'member', class_name, String(real_name).slice(0, 30), String(student_no).padStart(2, '0'), status).run();
  await audit(c, user.id, 'org_join', 'org', org.id, status);
  await bustCache(c, ['cache:home']);
  return ok(c, { status });
});

// ===== 邀请码加入 =====
r.post('/join-invite', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/orgs/join-invite');
  if (g) return g;
  const body = await c.req.json().catch(() => ({}));
  const code = String(body.code || '').trim();
  if (!code) return jsonErr(c, '请输入邀请码');
  const inv = await c.env.db.prepare('SELECT * FROM org_invites WHERE code = ?').bind(code).first();
  if (!inv) return jsonErr(c, '邀请码无效', 404);
  if (inv.expires_at && new Date(inv.expires_at) < new Date()) return jsonErr(c, '邀请码已过期');
  if (inv.used_count >= inv.max_uses) return jsonErr(c, '邀请码已被用完');
  const exist = await getMembership(c, user.id, inv.org_id);
  if (exist) return jsonErr(c, '你已是该组织成员');
  await c.env.db.prepare('INSERT INTO org_members (org_id, user_id, role, class_name, real_name, student_no, status) VALUES (?,?,?,?,?,?,?)')
    .bind(inv.org_id, user.id, 'member', body.class_name || '', String(body.real_name || '').slice(0, 30), body.student_no ? String(body.student_no).padStart(2, '0') : '', 'approved').run();
  await c.env.db.prepare('UPDATE org_invites SET used_count = used_count + 1 WHERE id = ?').bind(inv.id).run();
  await audit(c, user.id, 'org_join_invite', 'org', inv.org_id, `invite:${inv.id}`);
  await bustCache(c, ['cache:home']);
  return ok(c, { ok: true });
});

// ===== 生成邀请码（org_admin / website_admin）=====
r.post('/:slug/invites', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => ({}));
  const maxUses = Math.min(Math.max(parseInt(body.max_uses) || 1, 1), 100);
  const days = Math.min(Math.max(parseInt(body.days) || 7, 1), 365);
  const code = randomToken(9); // 12 位 base64url
  const expires = new Date(Date.now() + days * 86400000).toISOString();
  await c.env.db.prepare('INSERT INTO org_invites (org_id, code, created_by, expires_at, max_uses) VALUES (?,?,?,?,?)')
    .bind(org.id, code, user.id, expires, maxUses).run();
  await audit(c, user.id, 'invite_create', 'org', org.id, code);
  return ok(c, { code, expires_at: expires, max_uses: maxUses });
});

// ===== 组织管理：成员列表 =====
r.get('/:slug/manage/members', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  const status = c.req.query('status') || '';
  let sql = `SELECT m.id, m.role, m.class_name, m.real_name, m.student_no, m.status, m.joined_at, u.id AS user_id, u.username, u.display_name
             FROM org_members m JOIN users u ON u.id = m.user_id WHERE m.org_id = ?`;
  const binds = [org.id];
  if (status) { sql += ' AND m.status = ?'; binds.push(status); }
  sql += ' ORDER BY m.joined_at DESC LIMIT 500';
  const list = await c.env.db.prepare(sql).bind(...binds).all();
  return ok(c, { org, members: list.results || [] });
});

// ===== 组织管理：审批/移除成员 =====
r.post('/:slug/manage/members/:id/:action', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  const mem = await c.env.db.prepare('SELECT * FROM org_members WHERE id = ? AND org_id = ?').bind(c.req.param('id'), org.id).first();
  if (!mem) return jsonErr(c, '成员不存在', 404);
  const action = c.req.param('action');
  if (action === 'approve') {
    await c.env.db.prepare('UPDATE org_members SET status = "approved" WHERE id = ?').bind(mem.id).run();
    await audit(c, user.id, 'member_approve', 'org', org.id, `member:${mem.id}`);
    return ok(c, { ok: true });
  }
  if (action === 'remove') {
    if (mem.user_id === user.id && user.role !== 'website_admin') return jsonErr(c, '不能移除自己');
    await c.env.db.prepare('DELETE FROM org_members WHERE id = ?').bind(mem.id).run();
    await audit(c, user.id, 'member_remove', 'org', org.id, `member:${mem.id}`);
    return ok(c, { ok: true });
  }
  if (action === 'role') {
    const body = await c.req.json().catch(() => ({}));
    const role = body.role === 'org_admin' ? 'org_admin' : 'member';
    await c.env.db.prepare('UPDATE org_members SET role = ? WHERE id = ?').bind(role, mem.id).run();
    await audit(c, user.id, 'member_role', 'org', org.id, `member:${mem.id}->${role}`);
    return ok(c, { ok: true });
  }
  return jsonErr(c, '未知操作');
});

// ===== 组织管理：档案库权限设置（org_admin / website_admin）=====
r.post('/:slug/manage/perm', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => ({}));
  const perm = String(body.perm || '');
  if (!WIKI_PERMS[perm]) return jsonErr(c, '无效的权限选项');
  await c.env.db.prepare('UPDATE orgs SET wiki_perm = ? WHERE id = ?').bind(perm, org.id).run();
  await audit(c, user.id, 'org_perm', 'org', org.id, perm);
  return ok(c, { ok: true });
});

// ===== 组织管理：老师-班级关联 =====
r.get('/:slug/manage/teachers', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  const teachers = await c.env.db.prepare('SELECT id, slug, title FROM wiki_pages WHERE org_id = ? AND kind = "teacher" ORDER BY title LIMIT 500').bind(org.id).all();
  const classes = await c.env.db.prepare('SELECT id, slug, title, class_name, grade FROM wiki_pages WHERE org_id = ? AND kind = "class" ORDER BY grade, class_name').bind(org.id).all();
  const links = await c.env.db.prepare(`
    SELECT ct.id, ct.class_page_id, ct.teacher_page_id, cp.slug AS class_slug, cp.title AS class_title, tp.slug AS teacher_slug, tp.title AS teacher_title
    FROM class_teachers ct
    JOIN wiki_pages cp ON cp.id = ct.class_page_id
    JOIN wiki_pages tp ON tp.id = ct.teacher_page_id
    WHERE cp.org_id = ? ORDER BY cp.grade, cp.class_name`).bind(org.id).all();
  return ok(c, { teachers: teachers.results || [], classes: classes.results || [], links: links.results || [] });
});

r.post('/:slug/manage/teachers', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => ({}));
  const { class_page_id, teacher_page_id } = body;
  if (!class_page_id || !teacher_page_id) return jsonErr(c, '参数不完整');
  const [cp, tp] = await Promise.all([
    c.env.db.prepare('SELECT id FROM wiki_pages WHERE id = ? AND org_id = ? AND kind = "class"').bind(class_page_id, org.id).first(),
    c.env.db.prepare('SELECT id FROM wiki_pages WHERE id = ? AND org_id = ? AND kind = "teacher"').bind(teacher_page_id, org.id).first(),
  ]);
  if (!cp || !tp) return jsonErr(c, '班级或老师页面不存在');
  const dup = await c.env.db.prepare('SELECT id FROM class_teachers WHERE class_page_id = ? AND teacher_page_id = ?').bind(class_page_id, teacher_page_id).first();
  if (dup) return jsonErr(c, '已存在该关联');
  await c.env.db.prepare('INSERT INTO class_teachers (class_page_id, teacher_page_id) VALUES (?,?)').bind(class_page_id, teacher_page_id).run();
  await audit(c, user.id, 'teacher_link', 'org', org.id, `${class_page_id}->${teacher_page_id}`);
  return ok(c, { ok: true });
});

r.post('/:slug/manage/teachers/:id/delete', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(c.req.param('slug')).first();
  if (!org) return jsonErr(c, '组织不存在', 404);
  if (!(await isOrgAdminOf(c, user, org.id))) return jsonErr(c, '无权限', 403);
  await c.env.db.prepare('DELETE FROM class_teachers WHERE id = ?').bind(c.req.param('id')).run();
  return ok(c, { ok: true });
});

export default r;
