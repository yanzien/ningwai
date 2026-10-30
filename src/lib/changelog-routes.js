// 更新日志路由：公开列表 + 管理员发布
import { Hono } from 'hono';
import { audit, auth, isWebsiteAdmin, jsonErr, ok } from './common.js';

const r = new Hono();

// ===== 更新日志列表（公开）=====
r.get('/', async (c) => {
  const rows = await c.env.db.prepare(
    'SELECT id, version, title, content, preview_url, published_at FROM changelog ORDER BY id DESC LIMIT 100',
  ).all();
  return ok(c, { entries: rows.results || [] });
});

// ===== 发布更新日志（website_admin）=====
r.post('/', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => null);
  if (!body || !body.version || !body.title) return jsonErr(c, '版本号和标题不能为空');
  const version = String(body.version).slice(0, 20);
  const title = String(body.title).slice(0, 100);
  const content = String(body.content || '').slice(0, 20000);
  let preview = String(body.preview_url || '').slice(0, 200);
  if (preview && !/^https:\/\/[a-z0-9.-]+\.ningwai\.pages\.dev\/?$/i.test(preview)) {
    return jsonErr(c, '预览链接须为 https://<哈希>.ningwai.pages.dev/ 格式');
  }
  const res = await c.env.db.prepare(
    'INSERT INTO changelog (version, title, content, preview_url) VALUES (?,?,?,?)',
  ).bind(version, title, content, preview).run();
  await audit(c, user.id, 'changelog_publish', 'changelog', res.meta.last_row_id, `${version} ${title}`);
  return ok(c, { id: res.meta.last_row_id });
});

// ===== 删除更新日志（website_admin）=====
r.post('/:id/delete', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  if (!(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const id = parseInt(c.req.param('id'));
  await c.env.db.prepare('DELETE FROM changelog WHERE id = ?').bind(id).run();
  await audit(c, user.id, 'changelog_delete', 'changelog', id, '');
  return ok(c, { ok: true });
});

export default r;
