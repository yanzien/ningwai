// 论坛路由：板块 / 主题 / 回复（P2 自研轻量论坛）
// 额度约束见《宁外八一-D1-KV额度解决方案书》：分页 limit+1、无 COUNT(*)、计数用冗余列
import { Hono } from 'hono';
import { audit, auth, bumpCat, isOrgAdminOf, isWebsiteAdmin, jsonErr, notify, ok, pwGuard } from './common.js';

const r = new Hono();
const PAGE = 15;          // 主题列表每页（读预算：15 主题 + 15 作者 JOIN ≈ 30 行）
const POST_PAGE = 15;     // 楼层每页

// ---------- 工具 ----------
async function forumReviewOn(c) {
  const row = await c.env.db.prepare("SELECT value FROM site_settings WHERE key = 'forum_review'").first();
  return row?.value === '1';
}
async function canModerate(c, user, cat) {
  if (!user) return false;
  if (await isWebsiteAdmin(user)) return true;
  return cat?.org_id ? isOrgAdminOf(c, user, cat.org_id) : false;
}

// ---------- 板块列表 ----------
r.get('/categories', async (c) => {
  const cats = (await c.env.db.prepare(`
    SELECT id, org_id, name, slug, description, topic_count, post_count
    FROM forum_categories ORDER BY sort, id`).all()).results || [];
  return ok(c, { categories: cats });
});

// ---------- 主题列表（某板块，分页） ----------
r.get('/categories/:id/topics', async (c) => {
  const cat = await c.env.db.prepare('SELECT * FROM forum_categories WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!cat) return jsonErr(c, '板块不存在', 404);
  const page = Math.max(parseInt(c.req.query('page')) || 1, 1);
  const user = await auth(c);
  const showPending = user && await canModerate(c, user, cat);
  const rows = (await c.env.db.prepare(`
    SELECT t.id, t.title, t.status, t.pinned, t.featured, t.views, t.reply_count, t.last_post_at, t.created_at,
           u.id AS author_id, u.username AS author, u.display_name AS author_name
    FROM forum_topics t JOIN users u ON u.id = t.author_id
    WHERE t.category_id = ? ${showPending ? '' : "AND t.status = 'published'"}
    ORDER BY t.pinned DESC, COALESCE(t.last_post_at, t.created_at) DESC LIMIT ? OFFSET ?`)
    .bind(cat.id, PAGE + 1, (page - 1) * PAGE).all()).results || [];
  const has_more = rows.length > PAGE;
  if (has_more) rows.pop();
  return ok(c, { category: cat, topics: rows, page, has_more });
});

// ---------- 主题详情 + 楼层（分页） ----------
r.get('/topics/:id', async (c) => {
  const id = parseInt(c.req.param('id'));
  const page = Math.max(parseInt(c.req.query('page')) || 1, 1);
  const t = await c.env.db.prepare(`
    SELECT t.*, u.username AS author, u.display_name AS author_name
    FROM forum_topics t JOIN users u ON u.id = t.author_id WHERE t.id = ?`).bind(id).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  const user = await auth(c);
  const cat = await c.env.db.prepare('SELECT * FROM forum_categories WHERE id = ?').bind(t.category_id).first();
  if (t.status === 'pending' && !(await canModerate(c, user, cat))) return jsonErr(c, '主题不存在', 404);
  const posts = (await c.env.db.prepare(`
    SELECT p.id, p.floor, p.content, p.created_at, u.id AS author_id, u.username AS author, u.display_name AS author_name
    FROM forum_posts p JOIN users u ON u.id = p.author_id
    WHERE p.topic_id = ? AND p.status = 'published'
    ORDER BY p.floor LIMIT ? OFFSET ?`)
    .bind(id, POST_PAGE + 1, (page - 1) * POST_PAGE).all()).results || [];
  const has_more = posts.length > POST_PAGE;
  if (has_more) posts.pop();
  // 浏览量 +1（1 行写；量级小可接受，量大了改批量 flush）
  await c.env.db.prepare('UPDATE forum_topics SET views = views + 1 WHERE id = ?').bind(id).run();
  return ok(c, {
    topic: t, category: cat, posts, page, has_more,
    can_moderate: !!(await canModerate(c, user, cat)),
    can_reply: !!user && t.status === 'published',
  });
});

// ---------- 发主题 ----------
r.post('/categories/:id/topics', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '请先登录', 401);
  const g = pwGuard(c, user, '/api/forum/topics');
  if (g) return g;
  const cat = await c.env.db.prepare('SELECT * FROM forum_categories WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!cat) return jsonErr(c, '板块不存在', 404);
  const body = await c.req.json().catch(() => ({}));
  const title = String(body.title || '').trim();
  const content = String(body.content || '').trim();
  if (title.length < 2 || title.length > 80) return jsonErr(c, '标题 2–80 字');
  if (content.length < 1 || content.length > 20000) return jsonErr(c, '内容 1–20000 字');
  const status = (await forumReviewOn(c)) ? 'pending' : 'published';
  const now = new Date().toISOString();
  // reply_count 初始为 1：发主题即插入 1 楼，后续回复楼层从 2 起（曾因初始为 0 导致第一回复也是 1 楼）
  const res = await c.env.db.prepare(`
    INSERT INTO forum_topics (category_id, title, author_id, status, last_post_at, reply_count)
    VALUES (?,?,?,?,?,1)`).bind(cat.id, title, user.id, status, now).run();
  const tid = res.meta.last_row_id;
  await c.env.db.prepare('INSERT INTO forum_posts (topic_id, author_id, content, floor) VALUES (?,?,?,1)')
    .bind(tid, user.id, content).run();
  await bumpCat(c, cat.id, 1, 1);
  await audit(c, user.id, 'forum_topic_create', 'topic', tid, title);
  return ok(c, { id: tid, status });
});

// ---------- 回复 ----------
r.post('/topics/:id/posts', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '请先登录', 401);
  const g = pwGuard(c, user, '/api/forum/posts');
  if (g) return g;
  const t = await c.env.db.prepare('SELECT * FROM forum_topics WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  if (t.status === 'pending') return jsonErr(c, '主题审核中，暂不能回复', 403);
  if (t.status === 'closed') return jsonErr(c, '主题已锁定，不能回复');
  const body = await c.req.json().catch(() => ({}));
  const content = String(body.content || '').trim();
  if (content.length < 1 || content.length > 20000) return jsonErr(c, '内容 1–20000 字');
  const floor = (t.reply_count || 0) + 1;
  await c.env.db.prepare('INSERT INTO forum_posts (topic_id, author_id, content, floor) VALUES (?,?,?,?)')
    .bind(t.id, user.id, content, floor).run();
  const now = new Date().toISOString();
  await c.env.db.prepare("UPDATE forum_topics SET reply_count = ?, last_post_at = ? WHERE id = ?").bind(floor, now, t.id).run();
  await bumpCat(c, t.category_id, 0, 1);
  // 通知主题作者（不通知自己；v2.3）
  if (t.author_id !== user.id) {
    await notify(c, t.author_id, 'forum_reply',
      `${user.display_name || user.username} 回复了你的主题《${t.title}》`, '', `#/forum/t/${t.id}`);
  }
  return ok(c, { floor });
});

// ---------- 删主题（作者本人或板块管理者） ----------
r.post('/topics/:id/delete', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '请先登录', 401);
  const t = await c.env.db.prepare('SELECT * FROM forum_topics WHERE id = ?').bind(parseInt(c.req.param('id'))).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  const cat = await c.env.db.prepare('SELECT * FROM forum_categories WHERE id = ?').bind(t.category_id).first();
  if (t.author_id !== user.id && !(await canModerate(c, user, cat))) return jsonErr(c, '无权限', 403);
  await c.env.db.prepare('DELETE FROM forum_posts WHERE topic_id = ?').bind(t.id).run();
  await c.env.db.prepare('DELETE FROM forum_topics WHERE id = ?').bind(t.id).run();
  // reply_count 现为「总帖数」（含 1 楼）：删主题时帖子数扣 reply_count（兼容旧数据 0 按 1 计）
  await bumpCat(c, t.category_id, -1, -(t.reply_count || 1));
  await audit(c, user.id, 'forum_topic_delete', 'topic', t.id, t.title);
  return ok(c, { ok: true });
});

export default r;
