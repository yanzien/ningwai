-- 验证：计数器值 + 热点查询执行计划
SELECT key, value FROM site_settings WHERE key = 'wiki_page_count';
EXPLAIN QUERY PLAN SELECT * FROM wiki_pages WHERE slug = 'wabc12345';
EXPLAIN QUERY PLAN SELECT id, parent_id, kind, grade, class_name, slug, title FROM wiki_pages WHERE org_id = 1 AND kind != 'student' ORDER BY id;
EXPLAIN QUERY PLAN SELECT id, kind, grade, class_name, parent_id, slug, title, current_rev_id, updated_at FROM wiki_pages WHERE org_id = 1 ORDER BY updated_at DESC LIMIT 31 OFFSET 0;
EXPLAIN QUERY PLAN SELECT p.slug, p.title, p.grade, p.class_name, p.updated_at FROM wiki_pages p WHERE p.current_rev_id IS NOT NULL ORDER BY p.updated_at DESC LIMIT 6;
EXPLAIN QUERY PLAN SELECT COUNT(*) AS n FROM wiki_revisions WHERE status = 'pending';
