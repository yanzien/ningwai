-- 论坛（P2 自研轻量论坛）：板块 / 主题 / 回复
-- 设计约束（宁外八一-D1-KV额度解决方案书 §10.2 永久免费层宪章）：
--   · 列表一律分页 limit+1，禁 COUNT(*)（每板块主题数/回复数用冗余列，零 COUNT）
--   · 索引随表建（本次迁移一次性吃额度， UTC 0 点后执行）
--   · org_id 为 NULL = 全站板块；非 NULL = 组织板块（org_admin 可管）
CREATE TABLE IF NOT EXISTS forum_categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  org_id INTEGER,
  name TEXT NOT NULL,
  slug TEXT UNIQUE,
  description TEXT DEFAULT '',
  sort INTEGER DEFAULT 0,
  topic_count INTEGER DEFAULT 0,
  post_count INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS forum_topics (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  status TEXT DEFAULT 'published',        -- published | pending | closed(锁定)
  pinned INTEGER DEFAULT 0,
  featured INTEGER DEFAULT 0,
  views INTEGER DEFAULT 0,
  reply_count INTEGER DEFAULT 0,
  last_post_at TEXT,
  created_at TEXT DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS forum_posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  topic_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  floor INTEGER DEFAULT 1,
  status TEXT DEFAULT 'published',
  created_at TEXT DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_topics_cat ON forum_topics(category_id, pinned, last_post_at);
CREATE INDEX IF NOT EXISTS idx_topics_author ON forum_topics(author_id);
CREATE INDEX IF NOT EXISTS idx_topics_status ON forum_topics(status);
CREATE INDEX IF NOT EXISTS idx_posts_topic ON forum_posts(topic_id);
CREATE INDEX IF NOT EXISTS idx_cats_org ON forum_categories(org_id);

-- 预置板块（全站）
INSERT OR IGNORE INTO forum_categories (id, name, slug, description, sort) VALUES
  (1, '校园闲聊', 'chat', '什么都能聊，注意言论边界', 10),
  (2, '学习交流', 'study', '题目、竞赛、考试经验', 20),
  (3, '活动组织', 'activity', '社团、比赛、班级活动', 30),
  (4, '站务反馈', 'meta', '对网站本身的建议与问题反馈', 40);

-- 默认开启发帖审核（校园站点默认从严；管理员可在后台「论坛管理」一键关闭）
INSERT OR IGNORE INTO site_settings (key, value) VALUES ('forum_review', '1');
