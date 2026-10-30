-- 宁外八一 · D1 初始化 schema（ningwai-db）
PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL UNIQUE,
  pass_hash TEXT NOT NULL,
  salt TEXT NOT NULL,
  display_name TEXT NOT NULL DEFAULT '',
  bio TEXT NOT NULL DEFAULT '',
  role TEXT NOT NULL DEFAULT 'user',              -- user | org_admin | website_admin
  must_change_pw INTEGER NOT NULL DEFAULT 0,
  disclaimer_ok INTEGER NOT NULL DEFAULT 0,       -- 是否已阅读并签署《加入说明》（老用户刷新后强制补签）
  status TEXT NOT NULL DEFAULT 'active',          -- active | banned
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE orgs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  type TEXT NOT NULL DEFAULT 'public',            -- public | private
  join_mode TEXT NOT NULL DEFAULT 'open',         -- open | approval
  wiki_perm TEXT NOT NULL DEFAULT 'create_edit_review', -- all | create_edit | create_edit_review | all_review（普通用户档案库权限）
  description TEXT NOT NULL DEFAULT '',
  created_by INTEGER,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE org_members (
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
CREATE INDEX idx_members_user ON org_members(user_id);
CREATE INDEX idx_members_org ON org_members(org_id, status);

CREATE TABLE org_invites (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  org_id INTEGER NOT NULL,
  code TEXT NOT NULL UNIQUE,
  created_by INTEGER NOT NULL,
  expires_at TEXT,
  max_uses INTEGER NOT NULL DEFAULT 1,
  used_count INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE wiki_pages (
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
CREATE INDEX idx_pages_grade ON wiki_pages(org_id, kind, grade, class_name);
CREATE INDEX idx_pages_parent ON wiki_pages(org_id, parent_id);

CREATE TABLE wiki_revisions (
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
CREATE INDEX idx_revs_page ON wiki_revisions(page_id, status);

CREATE TABLE class_teachers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  class_page_id INTEGER NOT NULL,
  teacher_page_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (class_page_id, teacher_page_id)
);

-- 词条附件（文件存 D1 BLOB，单文件上限 1MB）
CREATE TABLE wiki_files (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  page_id INTEGER NOT NULL,
  filename TEXT NOT NULL,
  mime TEXT NOT NULL DEFAULT '',
  size INTEGER NOT NULL DEFAULT 0,
  data BLOB NOT NULL,
  uploader_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_files_page ON wiki_files(page_id);

CREATE TABLE news (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  summary TEXT NOT NULL DEFAULT '',
  content TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft',           -- published
  pinned INTEGER NOT NULL DEFAULT 0,
  published_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE audit_logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_id INTEGER NOT NULL DEFAULT 0,
  action TEXT NOT NULL,
  target_type TEXT NOT NULL DEFAULT '',
  target_id INTEGER NOT NULL DEFAULT 0,
  detail TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_audit_time ON audit_logs(created_at);

CREATE TABLE device_registrations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fingerprint_hash TEXT NOT NULL DEFAULT '',
  ip_ua_hash TEXT NOT NULL DEFAULT '',
  user_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE site_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL DEFAULT ''
);

-- 会话（D1 承载；KV 写额度账号级 1000/天已满，不用 KV）
CREATE TABLE sessions (
  token TEXT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ua TEXT NOT NULL DEFAULT '',
  expires_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_sessions_user ON sessions(user_id);
