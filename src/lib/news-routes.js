// 资讯路由：列表/详情（发布/删除在 admin-routes，路径 /api/admin/news）
import { Hono } from 'hono';
import { auth, isWebsiteAdmin, jsonErr, ok } from './common.js';

const r = new Hono();

// ===== 资讯列表（已发布）=====
r.get('/', async (c) => {
  const page = Math.max(parseInt(c.req.query('page')) || 1, 1);
  const size = 10;
  const total = await c.env.db.prepare('SELECT COUNT(*) AS n FROM news WHERE status = "published"').first();
  const rows = await c.env.db.prepare(`
    SELECT n.id, n.slug, n.title, n.summary, n.pinned, n.published_at, u.username AS author
    FROM news n JOIN users u ON u.id = n.author_id
    WHERE n.status = "published" ORDER BY n.pinned DESC, n.published_at DESC LIMIT ? OFFSET ?`)
    .bind(size, (page - 1) * size).all();
  return ok(c, { news: rows.results || [], total: total?.n || 0, page, size });
});

// ===== 资讯详情（按 ID，供 #/news/<id> 简洁链接使用）=====
r.get('/id/:id', async (c) => {
  const row = await c.env.db.prepare(`
    SELECT n.*, u.username AS author FROM news n JOIN users u ON u.id = n.author_id WHERE n.id = ?`)
    .bind(parseInt(c.req.param('id'))).first();
  if (!row) return jsonErr(c, '资讯不存在', 404);
  const user = await auth(c);
  if (row.status !== 'published' && !(user && await isWebsiteAdmin(user))) return jsonErr(c, '资讯不存在', 404);
  return ok(c, { news: row });
});

// ===== 资讯详情（按 slug，兼容旧链接）=====
r.get('/:slug', async (c) => {
  const row = await c.env.db.prepare(`
    SELECT n.*, u.username AS author FROM news n JOIN users u ON u.id = n.author_id WHERE n.slug = ?`)
    .bind(c.req.param('slug')).first();
  if (!row) return jsonErr(c, '资讯不存在', 404);
  const user = await auth(c);
  if (row.status !== 'published' && !(user && await isWebsiteAdmin(user))) return jsonErr(c, '资讯不存在', 404);
  return ok(c, { news: row });
});

export default r;
