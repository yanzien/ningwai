// 全站统一搜索 API（v2.3）
// GET /api/search?q=关键词 → { wiki, news, forum } 三组结果，各 5 条
// 行读控制：LIKE 前缀 + LIMIT 早停；wiki 3700 行单次扫描可接受（有 updated_at 索引，ORDER BY 走索引）
import { Hono } from 'hono';
import { jsonErr, ok } from './common.js';

const r = new Hono();

r.get('/', async (c) => {
  const q = String(c.req.query('q') || '').trim();
  if (q.length < 1 || q.length > 50) return jsonErr(c, '关键词 1–50 字');
  const like = `%${q.replace(/[%_\\]/g, (ch) => '\\' + ch)}%`;
  const [wiki, news, forum] = await Promise.all([
    // 词条：标题/学号匹配，已发布优先
    c.env.db.prepare(`
      SELECT id, slug, title, kind, grade, class_name, updated_at FROM wiki_pages
      WHERE (title LIKE ? ESCAPE '\\' OR slug LIKE ? ESCAPE '\\') AND kind != 'student'
      ORDER BY (kind = 'page') DESC, updated_at DESC LIMIT 5`).bind(like, like).all(),
    // 资讯：标题/摘要/正文匹配
    c.env.db.prepare(`
      SELECT id, title, slug, summary, published_at FROM news
      WHERE status = 'published' AND (title LIKE ? ESCAPE '\\' OR summary LIKE ? ESCAPE '\\' OR content LIKE ? ESCAPE '\\')
      ORDER BY published_at DESC LIMIT 5`).bind(like, like, like).all(),
    // 论坛：主题标题匹配
    c.env.db.prepare(`
      SELECT id, title, category_id, reply_count, created_at FROM forum_topics
      WHERE status = 'published' AND title LIKE ? ESCAPE '\\'
      ORDER BY last_post_at DESC LIMIT 5`).bind(like).all(),
  ]);
  return ok(c, {
    q,
    wiki: wiki.results || [],
    news: news.results || [],
    forum: forum.results || [],
  });
});

export default r;
