-- ============================================================
-- 宁外八一 · 完整建库脚本
-- 用法：wrangler d1 execute ningwai-db --remote --file=schema.sql
-- 说明：本文件已合并 database_init.sql 与 scripts/migrate-*.sql 的全部变更，
--       所有语句均为幂等（IF NOT EXISTS），可重复执行，无需再单独跑迁移脚本。
-- ============================================================
PRAGMA foreign_keys = ON;

-- ---------- 用户 ----------
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL UNIQUE,
  pass_hash TEXT NOT NULL,
  salt TEXT NOT NULL,
  display_name TEXT NOT NULL DEFAULT '',
  bio TEXT NOT NULL DEFAULT '',
  role TEXT NOT NULL DEFAULT 'user',              -- user | org_admin | website_admin
  must_change_pw INTEGER NOT NULL DEFAULT 0,
  disclaimer_ok INTEGER NOT NULL DEFAULT 0,       -- 是否已签署《加入说明》
  status TEXT NOT NULL DEFAULT 'active',          -- active | banned
  active_theme_id INTEGER,                        -- 当前应用的主题（NULL = 站点默认）
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ---------- 组织 ----------
CREATE TABLE IF NOT EXISTS orgs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  type TEXT NOT NULL DEFAULT 'public',            -- public | private
  join_mode TEXT NOT NULL DEFAULT 'open',         -- open | approval
  wiki_perm TEXT NOT NULL DEFAULT 'create_edit_review', -- all | create_edit | create_edit_review | all_review
  description TEXT NOT NULL DEFAULT '',
  created_by INTEGER,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS org_members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  org_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  role TEXT NOT NULL DEFAULT 'member',            -- member | org_admin
  class_name TEXT NOT NULL DEFAULT '',
  real_name TEXT NOT NULL DEFAULT '',
  student_no TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'pending',         -- pending | approved
  joined_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (org_id, user_id)
);
CREATE INDEX IF NOT EXISTS idx_members_user ON org_members(user_id);
CREATE INDEX IF NOT EXISTS idx_members_org ON org_members(org_id, status);

CREATE TABLE IF NOT EXISTS org_invites (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  org_id INTEGER NOT NULL,
  code TEXT NOT NULL UNIQUE,
  created_by INTEGER NOT NULL,
  expires_at TEXT,
  max_uses INTEGER NOT NULL DEFAULT 1,
  used_count INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ---------- 档案库（文件树 + 词条 + 修订审核）----------
CREATE TABLE IF NOT EXISTS wiki_pages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  org_id INTEGER NOT NULL,
  kind TEXT NOT NULL,                             -- folder | page | grade | class | student | teacher
  grade TEXT NOT NULL DEFAULT '',
  class_name TEXT NOT NULL DEFAULT '',
  parent_id INTEGER DEFAULT NULL,                 -- 文件树父节点（NULL = 根级）
  slug TEXT NOT NULL,
  title TEXT NOT NULL,
  current_rev_id INTEGER,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (org_id, slug)
);

CREATE TABLE IF NOT EXISTS wiki_revisions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  page_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  message TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'pending',         -- pending | approved | rejected
  reviewer_id INTEGER,
  reviewed_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS class_teachers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  class_page_id INTEGER NOT NULL,
  teacher_page_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (class_page_id, teacher_page_id)
);

CREATE TABLE IF NOT EXISTS wiki_files (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  page_id INTEGER NOT NULL,
  filename TEXT NOT NULL,
  mime TEXT NOT NULL DEFAULT '',
  size INTEGER NOT NULL DEFAULT 0,
  data BLOB NOT NULL,
  uploader_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ---------- 公告 ----------
CREATE TABLE IF NOT EXISTS news (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  summary TEXT NOT NULL DEFAULT '',
  content TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft',           -- draft | published
  pinned INTEGER NOT NULL DEFAULT 0,
  published_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ---------- 论坛 ----------
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
  status TEXT DEFAULT 'published',                -- published | pending | closed
  pinned INTEGER DEFAULT 0,
  featured INTEGER DEFAULT 0,                     -- 精华
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

-- ---------- 主题 ----------
CREATE TABLE IF NOT EXISTS themes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  config TEXT NOT NULL,                           -- JSON：导航色 / 背景 / 中景图等
  share_code TEXT UNIQUE,
  shared INTEGER NOT NULL DEFAULT 0,              -- 是否公开到主题商店
  use_count INTEGER NOT NULL DEFAULT 0,           -- 被采用次数
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ---------- 通知 ----------
CREATE TABLE IF NOT EXISTS notifications (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  type TEXT NOT NULL,
  title TEXT NOT NULL,
  body TEXT DEFAULT '',
  link TEXT DEFAULT '',
  is_read INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now'))
);

-- ---------- 审计与限流 ----------
CREATE TABLE IF NOT EXISTS audit_logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_id INTEGER NOT NULL DEFAULT 0,
  action TEXT NOT NULL,
  target_type TEXT NOT NULL DEFAULT '',
  target_id INTEGER NOT NULL DEFAULT 0,
  detail TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS device_registrations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fingerprint_hash TEXT NOT NULL DEFAULT '',
  ip_ua_hash TEXT NOT NULL DEFAULT '',
  user_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ---------- 站点设置 / 会话 ----------
CREATE TABLE IF NOT EXISTS site_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL DEFAULT ''
);

-- 会话落在 D1：KV 免费版写入额度为账号级 1000 次/天，扛不住登录态刷新
CREATE TABLE IF NOT EXISTS sessions (
  token TEXT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ua TEXT NOT NULL DEFAULT '',
  expires_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ============================================================
-- 索引
-- D1 免费层每日 500 万行读，缺索引会全表扫描直接把额度打爆，
-- 下面每一组都对应一条热点查询，删之前先看 scripts/migrate-*.sql 的注释。
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_pages_grade ON wiki_pages(org_id, kind, grade, class_name);
CREATE INDEX IF NOT EXISTS idx_pages_parent ON wiki_pages(org_id, parent_id);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_org ON wiki_pages(org_id);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_class_kind ON wiki_pages(class_name, kind);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_slug ON wiki_pages(slug);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_org_kind ON wiki_pages(org_id, kind);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_org_updated ON wiki_pages(org_id, updated_at);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_updated ON wiki_pages(updated_at);
CREATE INDEX IF NOT EXISTS idx_revs_page ON wiki_revisions(page_id, status);
CREATE INDEX IF NOT EXISTS idx_wiki_revisions_status ON wiki_revisions(status);
CREATE INDEX IF NOT EXISTS idx_files_page ON wiki_files(page_id);
CREATE INDEX IF NOT EXISTS idx_cats_org ON forum_categories(org_id);
CREATE INDEX IF NOT EXISTS idx_topics_cat ON forum_topics(category_id, pinned, last_post_at);
CREATE INDEX IF NOT EXISTS idx_topics_author ON forum_topics(author_id);
CREATE INDEX IF NOT EXISTS idx_topics_status ON forum_topics(status);
CREATE INDEX IF NOT EXISTS idx_posts_topic ON forum_posts(topic_id);
CREATE INDEX IF NOT EXISTS idx_themes_user ON themes(user_id);
CREATE INDEX IF NOT EXISTS idx_themes_shared ON themes(shared, use_count);
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id, is_read, id DESC);
CREATE INDEX IF NOT EXISTS idx_audit_time ON audit_logs(created_at);
CREATE INDEX IF NOT EXISTS idx_sessions_user ON sessions(user_id);

-- 统计信息：不更新的话 planner 会选错驱动表（class_teachers join 实测）
ANALYZE;
