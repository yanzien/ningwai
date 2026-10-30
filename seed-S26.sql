-- S26 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'S26', 's26', 'S26 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# S26 级

本页为 S26 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 's26';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's26')), updated_at = datetime('now') WHERE slug = 's26';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2601', 'S2601 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2601 班

本页为 S2601 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2601';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2601')), updated_at = datetime('now') WHERE slug = 's2601';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-01', 'S2601 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-02', 'S2601 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-03', 'S2601 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-04', 'S2601 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-05', 'S2601 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-06', 'S2601 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-07', 'S2601 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-08', 'S2601 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-09', 'S2601 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-10', 'S2601 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-11', 'S2601 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-12', 'S2601 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-13', 'S2601 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-14', 'S2601 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-15', 'S2601 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-16', 'S2601 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-17', 'S2601 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-18', 'S2601 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-19', 'S2601 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-20', 'S2601 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-21', 'S2601 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-22', 'S2601 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-23', 'S2601 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-24', 'S2601 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-25', 'S2601 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-26', 'S2601 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-27', 'S2601 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-28', 'S2601 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-29', 'S2601 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-30', 'S2601 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-31', 'S2601 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-32', 'S2601 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-33', 'S2601 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-34', 'S2601 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-35', 'S2601 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-36', 'S2601 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-37', 'S2601 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-38', 'S2601 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-39', 'S2601 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-40', 'S2601 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-41', 'S2601 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-42', 'S2601 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-43', 'S2601 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-44', 'S2601 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2601', (SELECT id FROM wiki_pages WHERE slug = 's2601'), 's2601-45', 'S2601 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2602', 'S2602 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2602 班

本页为 S2602 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2602';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2602')), updated_at = datetime('now') WHERE slug = 's2602';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-01', 'S2602 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-02', 'S2602 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-03', 'S2602 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-04', 'S2602 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-05', 'S2602 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-06', 'S2602 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-07', 'S2602 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-08', 'S2602 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-09', 'S2602 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-10', 'S2602 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-11', 'S2602 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-12', 'S2602 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-13', 'S2602 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-14', 'S2602 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-15', 'S2602 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-16', 'S2602 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-17', 'S2602 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-18', 'S2602 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-19', 'S2602 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-20', 'S2602 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-21', 'S2602 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-22', 'S2602 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-23', 'S2602 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-24', 'S2602 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-25', 'S2602 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-26', 'S2602 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-27', 'S2602 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-28', 'S2602 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-29', 'S2602 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-30', 'S2602 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-31', 'S2602 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-32', 'S2602 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-33', 'S2602 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-34', 'S2602 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-35', 'S2602 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-36', 'S2602 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-37', 'S2602 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-38', 'S2602 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-39', 'S2602 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-40', 'S2602 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-41', 'S2602 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-42', 'S2602 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-43', 'S2602 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-44', 'S2602 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2602', (SELECT id FROM wiki_pages WHERE slug = 's2602'), 's2602-45', 'S2602 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2603', 'S2603 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2603 班

本页为 S2603 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2603';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2603')), updated_at = datetime('now') WHERE slug = 's2603';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-01', 'S2603 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-02', 'S2603 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-03', 'S2603 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-04', 'S2603 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-05', 'S2603 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-06', 'S2603 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-07', 'S2603 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-08', 'S2603 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-09', 'S2603 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-10', 'S2603 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-11', 'S2603 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-12', 'S2603 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-13', 'S2603 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-14', 'S2603 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-15', 'S2603 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-16', 'S2603 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-17', 'S2603 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-18', 'S2603 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-19', 'S2603 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-20', 'S2603 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-21', 'S2603 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-22', 'S2603 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-23', 'S2603 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-24', 'S2603 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-25', 'S2603 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-26', 'S2603 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-27', 'S2603 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-28', 'S2603 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-29', 'S2603 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-30', 'S2603 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-31', 'S2603 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-32', 'S2603 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-33', 'S2603 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-34', 'S2603 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-35', 'S2603 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-36', 'S2603 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-37', 'S2603 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-38', 'S2603 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-39', 'S2603 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-40', 'S2603 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-41', 'S2603 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-42', 'S2603 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-43', 'S2603 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-44', 'S2603 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2603', (SELECT id FROM wiki_pages WHERE slug = 's2603'), 's2603-45', 'S2603 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2604', 'S2604 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2604 班

本页为 S2604 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2604';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2604')), updated_at = datetime('now') WHERE slug = 's2604';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-01', 'S2604 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-02', 'S2604 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-03', 'S2604 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-04', 'S2604 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-05', 'S2604 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-06', 'S2604 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-07', 'S2604 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-08', 'S2604 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-09', 'S2604 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-10', 'S2604 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-11', 'S2604 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-12', 'S2604 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-13', 'S2604 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-14', 'S2604 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-15', 'S2604 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-16', 'S2604 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-17', 'S2604 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-18', 'S2604 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-19', 'S2604 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-20', 'S2604 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-21', 'S2604 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-22', 'S2604 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-23', 'S2604 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-24', 'S2604 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-25', 'S2604 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-26', 'S2604 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-27', 'S2604 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-28', 'S2604 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-29', 'S2604 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-30', 'S2604 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-31', 'S2604 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-32', 'S2604 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-33', 'S2604 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-34', 'S2604 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-35', 'S2604 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-36', 'S2604 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-37', 'S2604 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-38', 'S2604 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-39', 'S2604 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-40', 'S2604 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-41', 'S2604 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-42', 'S2604 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-43', 'S2604 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-44', 'S2604 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2604', (SELECT id FROM wiki_pages WHERE slug = 's2604'), 's2604-45', 'S2604 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2605', 'S2605 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2605 班

本页为 S2605 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2605';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2605')), updated_at = datetime('now') WHERE slug = 's2605';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-01', 'S2605 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-02', 'S2605 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-03', 'S2605 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-04', 'S2605 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-05', 'S2605 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-06', 'S2605 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-07', 'S2605 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-08', 'S2605 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-09', 'S2605 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-10', 'S2605 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-11', 'S2605 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-12', 'S2605 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-13', 'S2605 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-14', 'S2605 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-15', 'S2605 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-16', 'S2605 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-17', 'S2605 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-18', 'S2605 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-19', 'S2605 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-20', 'S2605 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-21', 'S2605 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-22', 'S2605 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-23', 'S2605 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-24', 'S2605 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-25', 'S2605 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-26', 'S2605 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-27', 'S2605 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-28', 'S2605 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-29', 'S2605 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-30', 'S2605 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-31', 'S2605 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-32', 'S2605 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-33', 'S2605 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-34', 'S2605 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-35', 'S2605 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-36', 'S2605 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-37', 'S2605 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-38', 'S2605 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-39', 'S2605 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-40', 'S2605 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-41', 'S2605 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-42', 'S2605 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-43', 'S2605 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-44', 'S2605 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2605', (SELECT id FROM wiki_pages WHERE slug = 's2605'), 's2605-45', 'S2605 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2606', 'S2606 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2606 班

本页为 S2606 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2606';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2606')), updated_at = datetime('now') WHERE slug = 's2606';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-01', 'S2606 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-02', 'S2606 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-03', 'S2606 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-04', 'S2606 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-05', 'S2606 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-06', 'S2606 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-07', 'S2606 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-08', 'S2606 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-09', 'S2606 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-10', 'S2606 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-11', 'S2606 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-12', 'S2606 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-13', 'S2606 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-14', 'S2606 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-15', 'S2606 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-16', 'S2606 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-17', 'S2606 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-18', 'S2606 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-19', 'S2606 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-20', 'S2606 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-21', 'S2606 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-22', 'S2606 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-23', 'S2606 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-24', 'S2606 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-25', 'S2606 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-26', 'S2606 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-27', 'S2606 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-28', 'S2606 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-29', 'S2606 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-30', 'S2606 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-31', 'S2606 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-32', 'S2606 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-33', 'S2606 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-34', 'S2606 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-35', 'S2606 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-36', 'S2606 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-37', 'S2606 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-38', 'S2606 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-39', 'S2606 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-40', 'S2606 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-41', 'S2606 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-42', 'S2606 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-43', 'S2606 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-44', 'S2606 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2606', (SELECT id FROM wiki_pages WHERE slug = 's2606'), 's2606-45', 'S2606 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2607', 'S2607 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2607 班

本页为 S2607 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2607';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2607')), updated_at = datetime('now') WHERE slug = 's2607';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-01', 'S2607 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-02', 'S2607 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-03', 'S2607 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-04', 'S2607 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-05', 'S2607 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-06', 'S2607 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-07', 'S2607 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-08', 'S2607 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-09', 'S2607 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-10', 'S2607 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-11', 'S2607 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-12', 'S2607 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-13', 'S2607 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-14', 'S2607 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-15', 'S2607 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-16', 'S2607 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-17', 'S2607 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-18', 'S2607 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-19', 'S2607 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-20', 'S2607 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-21', 'S2607 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-22', 'S2607 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-23', 'S2607 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-24', 'S2607 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-25', 'S2607 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-26', 'S2607 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-27', 'S2607 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-28', 'S2607 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-29', 'S2607 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-30', 'S2607 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-31', 'S2607 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-32', 'S2607 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-33', 'S2607 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-34', 'S2607 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-35', 'S2607 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-36', 'S2607 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-37', 'S2607 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-38', 'S2607 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-39', 'S2607 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-40', 'S2607 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-41', 'S2607 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-42', 'S2607 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-43', 'S2607 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-44', 'S2607 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2607', (SELECT id FROM wiki_pages WHERE slug = 's2607'), 's2607-45', 'S2607 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2608', 'S2608 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2608 班

本页为 S2608 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2608';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2608')), updated_at = datetime('now') WHERE slug = 's2608';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-01', 'S2608 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-02', 'S2608 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-03', 'S2608 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-04', 'S2608 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-05', 'S2608 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-06', 'S2608 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-07', 'S2608 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-08', 'S2608 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-09', 'S2608 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-10', 'S2608 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-11', 'S2608 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-12', 'S2608 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-13', 'S2608 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-14', 'S2608 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-15', 'S2608 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-16', 'S2608 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-17', 'S2608 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-18', 'S2608 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-19', 'S2608 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-20', 'S2608 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-21', 'S2608 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-22', 'S2608 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-23', 'S2608 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-24', 'S2608 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-25', 'S2608 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-26', 'S2608 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-27', 'S2608 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-28', 'S2608 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-29', 'S2608 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-30', 'S2608 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-31', 'S2608 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-32', 'S2608 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-33', 'S2608 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-34', 'S2608 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-35', 'S2608 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-36', 'S2608 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-37', 'S2608 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-38', 'S2608 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-39', 'S2608 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-40', 'S2608 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-41', 'S2608 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-42', 'S2608 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-43', 'S2608 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-44', 'S2608 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2608', (SELECT id FROM wiki_pages WHERE slug = 's2608'), 's2608-45', 'S2608 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2609', 'S2609 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2609 班

本页为 S2609 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2609';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2609')), updated_at = datetime('now') WHERE slug = 's2609';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-01', 'S2609 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-02', 'S2609 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-03', 'S2609 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-04', 'S2609 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-05', 'S2609 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-06', 'S2609 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-07', 'S2609 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-08', 'S2609 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-09', 'S2609 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-10', 'S2609 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-11', 'S2609 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-12', 'S2609 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-13', 'S2609 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-14', 'S2609 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-15', 'S2609 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-16', 'S2609 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-17', 'S2609 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-18', 'S2609 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-19', 'S2609 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-20', 'S2609 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-21', 'S2609 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-22', 'S2609 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-23', 'S2609 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-24', 'S2609 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-25', 'S2609 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-26', 'S2609 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-27', 'S2609 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-28', 'S2609 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-29', 'S2609 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-30', 'S2609 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-31', 'S2609 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-32', 'S2609 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-33', 'S2609 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-34', 'S2609 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-35', 'S2609 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-36', 'S2609 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-37', 'S2609 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-38', 'S2609 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-39', 'S2609 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-40', 'S2609 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-41', 'S2609 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-42', 'S2609 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-43', 'S2609 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-44', 'S2609 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2609', (SELECT id FROM wiki_pages WHERE slug = 's2609'), 's2609-45', 'S2609 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's26'), 's2610', 'S2610 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2610 班

本页为 S2610 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2610';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2610')), updated_at = datetime('now') WHERE slug = 's2610';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-01', 'S2610 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-02', 'S2610 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-03', 'S2610 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-04', 'S2610 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-05', 'S2610 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-06', 'S2610 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-07', 'S2610 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-08', 'S2610 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-09', 'S2610 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-10', 'S2610 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-11', 'S2610 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-12', 'S2610 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-13', 'S2610 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-14', 'S2610 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-15', 'S2610 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-16', 'S2610 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-17', 'S2610 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-18', 'S2610 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-19', 'S2610 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-20', 'S2610 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-21', 'S2610 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-22', 'S2610 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-23', 'S2610 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-24', 'S2610 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-25', 'S2610 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-26', 'S2610 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-27', 'S2610 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-28', 'S2610 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-29', 'S2610 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-30', 'S2610 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-31', 'S2610 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-32', 'S2610 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-33', 'S2610 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-34', 'S2610 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-35', 'S2610 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-36', 'S2610 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-37', 'S2610 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-38', 'S2610 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-39', 'S2610 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-40', 'S2610 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-41', 'S2610 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-42', 'S2610 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-43', 'S2610 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-44', 'S2610 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S26', 'S2610', (SELECT id FROM wiki_pages WHERE slug = 's2610'), 's2610-45', 'S2610 · 45 号');
