-- A/B 实测：tree 查询两种写法的真实 rows_read
SELECT id, parent_id, kind, grade, class_name, slug, title FROM wiki_pages WHERE org_id = 1 AND kind != 'student' ORDER BY id;
SELECT id, parent_id, kind, grade, class_name, slug, title FROM wiki_pages WHERE org_id = 1 AND kind IN ('folder','grade','class','page','teacher') ORDER BY id;
SELECT COUNT(*) AS n FROM wiki_pages WHERE org_id = 1 AND kind IN ('folder','grade','class','page','teacher');
