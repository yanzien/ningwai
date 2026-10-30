// 管理员路由：用户管理、组织管理、站点设置、首页聚合、隐私数据
import { Hono } from 'hono';
import {
  audit, auth, bumpCat, bustCache, getOwnerId, isOrgAdminOf, isWebsiteAdmin, jsonErr, ok, pwGuard, randomToken, validUsername,
} from './common.js';

const r = new Hono();

// ===== 首页聚合（KV 缓存 5 分钟；COUNT(*) 全表扫描是 D1 读额度最大消耗点）=====
r.get('/home', async (c) => {
  const KEY = 'cache:home';
  const TTL = 300;
  try {
    const hit = await c.env?.KV?.get(KEY, 'json');
    if (hit) return ok(c, hit);
  } catch {}
  const news = (await c.env.db.prepare(`
    SELECT id, slug, title, summary, pinned, published_at FROM news
    WHERE status = "published" ORDER BY pinned DESC, published_at DESC LIMIT 4`).all()).results || [];
  const recent = (await c.env.db.prepare(`
    SELECT p.slug, p.title, p.grade, p.class_name, p.updated_at FROM wiki_pages p
    WHERE p.current_rev_id IS NOT NULL ORDER BY p.updated_at DESC LIMIT 6`).all()).results || [];
  const org = await c.env.db.prepare('SELECT COUNT(*) AS n FROM orgs WHERE type = "public"').first();
  const users = await c.env.db.prepare('SELECT COUNT(*) AS n FROM users').first();
  // v2.0：wiki 页面数读冗余计数器（COUNT(*) 全表扫 3699 行/次，曾是第二大读额度消耗点）
  const pages = await c.env.db.prepare('SELECT value AS n FROM site_settings WHERE key = "wiki_page_count"').first();
  let hot = [];
  try {
    hot = (await c.env.db.prepare(`
      SELECT t.id, t.title, t.reply_count, t.views, t.featured, fc.name AS category
      FROM forum_topics t JOIN forum_categories fc ON fc.id = t.category_id
      WHERE t.status = 'published'
      ORDER BY t.pinned DESC, COALESCE(t.last_post_at, t.created_at) DESC LIMIT 5`).all()).results || [];
  } catch { /* 论坛表未迁移时不拖垮首页 */ }
  const data = { news, recent, hot, org_count: org?.n || 0, user_count: users?.n || 0, page_count: parseInt(pages?.n) || 0 };
  try { await c.env?.KV?.put(KEY, JSON.stringify(data), { expirationTtl: TTL }); } catch {}
  return ok(c, data);
});

// ===== 站点设置 =====
r.get('/settings', async (c) => {
  const rows = (await c.env.db.prepare('SELECT key, value FROM site_settings').all()).results || [];
  const out = {};
  for (const row of rows) out[row.key] = row.value;
  return ok(c, { settings: out });
});

r.post('/settings', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => ({}));
  for (const k of ['site_name', 'announcement', 'forum_review']) {
    if (typeof body[k] === 'string') {
      const v = (k === 'forum_review' ? (body[k] === '1' ? '1' : '0') : body[k]).slice(0, 500);
      await c.env.db.prepare('INSERT INTO site_settings (key, value) VALUES (?,?) ON CONFLICT(key) DO UPDATE SET value = ?').bind(k, v, v).run();
    }
  }
  await audit(c, user.id, 'settings_update', 'site', 0, '');
  await bustCache(c, ['cache:home']);
  return ok(c, { ok: true });
});

// ===== 用户管理（website_admin）=====
r.get('/users', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const q = (c.req.query('q') || '').trim().slice(0, 50);
  const page = Math.max(parseInt(c.req.query('page')) || 1, 1);
  const size = 20;
  let where = '1 = 1';
  const binds = [];
  if (q) { where += ' AND (username LIKE ? OR display_name LIKE ?)'; binds.push(`%${q}%`, `%${q}%`); }
  const total = await c.env.db.prepare(`SELECT COUNT(*) AS n FROM users WHERE ${where}`).bind(...binds).first();
  const rows = await c.env.db.prepare(`
    SELECT id, username, display_name, role, status, must_change_pw, created_at FROM users
    WHERE ${where} ORDER BY id LIMIT ? OFFSET ?`).bind(...binds, size, (page - 1) * size).all();
  return ok(c, { users: rows.results || [], total: total?.n || 0, page, size, owner_id: await getOwnerId(c) });
});

r.post('/users/:id/:action', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const target = await c.env.db.prepare('SELECT * FROM users WHERE id = ?').bind(c.req.param('id')).first();
  if (!target) return jsonErr(c, '用户不存在', 404);
  const action = c.req.param('action');
  // v2.1 权限修复：站点创始人（owner_user_id）不可被封禁/降级；
  // 普通 website_admin 只能封禁普通用户，任免 website_admin 仅创始人可做。
  const ownerId = await getOwnerId(c);
  const isOwner = ownerId > 0 && target.id === ownerId;
  if (action === 'ban' || action === 'unban') {
    if (target.id === user.id) return jsonErr(c, '不能封禁自己');
    if (isOwner) return jsonErr(c, '不能封禁站点创始人', 403);
    if (target.role !== 'user') return jsonErr(c, '站点管理员只能封禁普通用户', 403);
    const banned = action === 'ban';
    await c.env.db.prepare('UPDATE users SET status = ? WHERE id = ?').bind(banned ? 'banned' : 'active', target.id).run();
    await audit(c, user.id, banned ? 'user_ban' : 'user_unban', 'user', target.id, '');
    return ok(c, { ok: true });
  }
  if (action === 'role') {
    const body = await c.req.json().catch(() => ({}));
    const role = body.role === 'website_admin' ? 'website_admin' : 'user';
    if (isOwner) return jsonErr(c, '不能修改站点创始人的角色', 403);
    if (user.id !== ownerId) return jsonErr(c, '只有站点创始人可以任免管理员', 403);
    await c.env.db.prepare('UPDATE users SET role = ? WHERE id = ?').bind(role, target.id).run();
    await audit(c, user.id, 'user_role', 'user', target.id, role);
    return ok(c, { ok: true });
  }
  return jsonErr(c, '未知操作');
});

// ===== 组织管理（website_admin）=====
r.get('/orgs', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const rows = await c.env.db.prepare(`
    SELECT o.*, (SELECT COUNT(*) FROM org_members m WHERE m.org_id = o.id AND m.status = "approved") AS member_count
    FROM orgs o ORDER BY o.id`).all();
  return ok(c, { orgs: rows.results || [] });
});

r.post('/orgs', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => null);
  if (!body || !body.name || !body.slug) return jsonErr(c, '名称与 slug 不能为空');
  if (!/^[a-z0-9-]{3,40}$/.test(body.slug)) return jsonErr(c, 'slug 需 3-40 位小写字母/数字/连字符');
  const dup = await c.env.db.prepare('SELECT id FROM orgs WHERE slug = ?').bind(body.slug).first();
  if (dup) return jsonErr(c, 'slug 已被占用');
  await c.env.db.prepare('INSERT INTO orgs (name, slug, type, join_mode, description, created_by) VALUES (?,?,?,?,?,?)')
    .bind(String(body.name).slice(0, 60), body.slug, body.type === 'private' ? 'private' : 'public',
      body.join_mode === 'approval' ? 'approval' : 'open', String(body.description || '').slice(0, 500), user.id).run();
  await audit(c, user.id, 'org_create', 'org', 0, body.slug);
  await bustCache(c, ['cache:home']);
  return ok(c, { ok: true });
});

// ===== 资讯发布 / 删除（website_admin，路径 /api/admin/news）=====
function slugify(title, id) {
  const base = String(title).trim().toLowerCase().replace(/[^\p{L}\p{N}]+/gu, '-').replace(/^-+|-+$/g, '').slice(0, 40);
  return `${base || 'news'}-${id}`;
}

r.post('/news', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => null);
  if (!body || !body.title || !body.content) return jsonErr(c, '标题和正文不能为空');
  const title = String(body.title).slice(0, 100);
  const summary = String(body.summary || '').slice(0, 200);
  const content = String(body.content).slice(0, 50000);
  const pinned = body.pinned ? 1 : 0;
  const res = await c.env.db.prepare('INSERT INTO news (title, slug, summary, content, author_id, status, pinned, published_at) VALUES (?,?,?,?,?,"published",?,datetime("now"))')
    .bind(title, '', summary, content, user.id, pinned).run();
  const id = res.meta.last_row_id;
  const slug = slugify(title, id);
  await c.env.db.prepare('UPDATE news SET slug = ? WHERE id = ?').bind(slug, id).run();
  await audit(c, user.id, 'news_publish', 'news', id, title);
  await bustCache(c, ['cache:home']);
  return ok(c, { id, slug });
});

r.post('/news/:id/delete', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  await c.env.db.prepare('DELETE FROM news WHERE id = ?').bind(c.req.param('id')).run();
  await audit(c, user.id, 'news_delete', 'news', parseInt(c.req.param('id')), '');
  await bustCache(c, ['cache:home']);
  return ok(c, { ok: true });
});

// ===== 统计看板 =====
r.get('/stats', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const users = await c.env.db.prepare('SELECT COUNT(*) AS n FROM users').first();
  const orgs = await c.env.db.prepare('SELECT COUNT(*) AS n FROM orgs').first();
  // v2.0：页面数读冗余计数器（替代 COUNT(*) 全表扫描）
  const pages = await c.env.db.prepare('SELECT value AS n FROM site_settings WHERE key = "wiki_page_count"').first();
  const pending = await c.env.db.prepare('SELECT COUNT(*) AS n FROM wiki_revisions WHERE status = "pending"').first();
  const news = await c.env.db.prepare('SELECT COUNT(*) AS n FROM news WHERE status = "published"').first();
  return ok(c, {
    users: users?.n || 0, orgs: orgs?.n || 0, pages: parseInt(pages?.n) || 0,
    pending: pending?.n || 0, news: news?.n || 0,
  });
});

// ===== 论坛管理（website_admin 全站；org_admin 限本组织板块）=====
async function forumCatWritable(c, user, cat) {
  if (await isWebsiteAdmin(user)) return true;
  if (cat?.org_id) return isOrgAdminOf(c, user, cat.org_id);
  return false;
}

r.get('/forum/pending', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const rows = (await c.env.db.prepare(`
    SELECT t.id, t.title, t.created_at, u.username AS author, fc.name AS category
    FROM forum_topics t JOIN users u ON u.id = t.author_id JOIN forum_categories fc ON fc.id = t.category_id
    WHERE t.status = 'pending' ORDER BY t.created_at DESC LIMIT 50`).all()).results || [];
  // org_admin 只看本组织板块（website_admin 看全部）
  const list = (await isWebsiteAdmin(user)) ? rows : [];
  if (!list.length && !(await isWebsiteAdmin(user))) {
    for (const t of rows) {
      const cat = await c.env.db.prepare('SELECT org_id FROM forum_categories WHERE name = ?').bind(t.category).first();
      if (cat?.org_id && (await isOrgAdminOf(c, user, cat.org_id))) list.push(t);
    }
  }
  return ok(c, { pending: list });
});

r.post('/forum/categories', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const body = await c.req.json().catch(() => ({}));
  const name = String(body.name || '').trim();
  if (name.length < 2 || name.length > 30) return jsonErr(c, '板块名 2–30 字');
  let orgId = null;
  if (body.org_id) {
    if (!(await isOrgAdminOf(c, user, parseInt(body.org_id)))) return jsonErr(c, '无权限', 403);
    orgId = parseInt(body.org_id);
  } else if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const res = await c.env.db.prepare('INSERT INTO forum_categories (org_id, name, slug, description, sort) VALUES (?,?,?,?,?)')
    .bind(orgId, name, String(body.slug || '').replace(/[^a-z0-9-]/g, '') || null, String(body.description || '').slice(0, 200), parseInt(body.sort) || 0).run();
  await audit(c, user.id, 'forum_cat_create', 'category', res.meta.last_row_id, name);
  return ok(c, { id: res.meta.last_row_id });
});

r.post('/forum/categories/:id/delete', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const cat = await c.env.db.prepare('SELECT * FROM forum_categories WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!cat) return jsonErr(c, '板块不存在', 404);
  if (!(await forumCatWritable(c, user, cat))) return jsonErr(c, '无权限', 403);
  if (cat.topic_count > 0) return jsonErr(c, '板块内还有主题，不能删除');
  await c.env.db.prepare('DELETE FROM forum_categories WHERE id = ?').bind(cat.id).run();
  await audit(c, user.id, 'forum_cat_delete', 'category', cat.id, cat.name);
  return ok(c, { ok: true });
});

// 主题管理动作：pin / unpin / feature / unfeature / lock / unlock / approve / reject / delete
r.post('/forum/topics/:id/:action', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const action = c.req.param('action');
  const t = await c.env.db.prepare('SELECT * FROM forum_topics WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  const cat = await c.env.db.prepare('SELECT * FROM forum_categories WHERE id = ?').bind(t.category_id).first();
  if (!(await forumCatWritable(c, user, cat))) return jsonErr(c, '无权限', 403);
  const MAP = {
    pin: 'pinned = 1', unpin: 'pinned = 0', feature: 'featured = 1', unfeature: 'featured = 0',
    lock: "status = 'closed'", unlock: "status = 'published'",
    approve: "status = 'published'", reject: "status = 'pending'",
  };
  if (MAP[action]) {
    await c.env.db.prepare(`UPDATE forum_topics SET ${MAP[action]} WHERE id = ?`).bind(t.id).run();
    if (action === 'approve' || action === 'reject') await bumpCat(c, t.category_id, 0, 0);
  } else if (action === 'delete') {
    await c.env.db.prepare('DELETE FROM forum_posts WHERE topic_id = ?').bind(t.id).run();
    await c.env.db.prepare('DELETE FROM forum_topics WHERE id = ?').bind(t.id).run();
    // reply_count 现为「总帖数」（含 1 楼）：删主题时帖子数扣 reply_count（兼容旧数据 0 按 1 计）
    await bumpCat(c, t.category_id, -1, -(t.reply_count || 1));
  } else return jsonErr(c, '未知操作');
  await audit(c, user.id, 'forum_topic_' + action, 'topic', t.id, t.title);
  return ok(c, { ok: true });
});

export default r;
