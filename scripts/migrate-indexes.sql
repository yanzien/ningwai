-- v1.6 D1 读取优化：索引（2026-10-18）
-- 背景：D1 免费层 500 万行/日读中午被打爆；热点查询（tree 全量、班级页学生、首页 COUNT）
-- 全是无索引全表扫描。索引让过滤查询只读匹配行。
CREATE INDEX IF NOT EXISTS idx_wiki_pages_org ON wiki_pages(org_id);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_parent ON wiki_pages(parent_id);
CREATE INDEX IF NOT EXISTS idx_wiki_pages_class_kind ON wiki_pages(class_name, kind);
CREATE INDEX IF NOT EXISTS idx_wiki_revisions_page ON wiki_revisions(page_id, status);
CREATE INDEX IF NOT EXISTS idx_wiki_files_page ON wiki_files(page_id);
CREATE INDEX IF NOT EXISTS idx_sessions_token ON sessions(token);
-- org_members 的 user_id 索引（idx_members_user）在 database_init.sql 已建，无需重复
