// 站内通知 API（v2.3）
import { Hono } from 'hono';
import { auth, jsonErr, ok } from './common.js';

const r = new Hono();

// 我的通知（未读数 + 最近 20 条）
r.get('/', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const items = (await c.env.db.prepare(
    'SELECT id, type, title, body, link, is_read, created_at FROM notifications WHERE user_id = ? ORDER BY id DESC LIMIT 20'
  ).bind(user.id).all()).results || [];
  const unreadRow = await c.env.db.prepare(
    'SELECT COUNT(*) AS n FROM notifications WHERE user_id = ? AND is_read = 0'
  ).bind(user.id).first();
  return ok(c, { unread: unreadRow?.n || 0, items });
});

// 标记已读（单条或全部）
r.post('/read', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const body = await c.req.json().catch(() => ({}));
  if (body.all) {
    await c.env.db.prepare('UPDATE notifications SET is_read = 1 WHERE user_id = ? AND is_read = 0').bind(user.id).run();
  } else {
    const id = parseInt(body.id);
    if (!id) return jsonErr(c, '参数错误');
    await c.env.db.prepare('UPDATE notifications SET is_read = 1 WHERE id = ? AND user_id = ?').bind(id, user.id).run();
  }
  return ok(c, { ok: true });
});

export default r;
