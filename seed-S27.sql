-- S27 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'S27', 's27', 'S27 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# S27 级

本页为 S27 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 's27';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's27')), updated_at = datetime('now') WHERE slug = 's27';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2701', 'S2701 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2701 班

本页为 S2701 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2701';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2701')), updated_at = datetime('now') WHERE slug = 's2701';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-01', 'S2701 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-02', 'S2701 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-03', 'S2701 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-04', 'S2701 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-05', 'S2701 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-06', 'S2701 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-07', 'S2701 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-08', 'S2701 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-09', 'S2701 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-10', 'S2701 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-11', 'S2701 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-12', 'S2701 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-13', 'S2701 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-14', 'S2701 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-15', 'S2701 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-16', 'S2701 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-17', 'S2701 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-18', 'S2701 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-19', 'S2701 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-20', 'S2701 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-21', 'S2701 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-22', 'S2701 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-23', 'S2701 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-24', 'S2701 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-25', 'S2701 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-26', 'S2701 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-27', 'S2701 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-28', 'S2701 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-29', 'S2701 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-30', 'S2701 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-31', 'S2701 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-32', 'S2701 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-33', 'S2701 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-34', 'S2701 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-35', 'S2701 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-36', 'S2701 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-37', 'S2701 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-38', 'S2701 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-39', 'S2701 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-40', 'S2701 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-41', 'S2701 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-42', 'S2701 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-43', 'S2701 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-44', 'S2701 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2701', (SELECT id FROM wiki_pages WHERE slug = 's2701'), 's2701-45', 'S2701 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2702', 'S2702 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2702 班

本页为 S2702 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2702';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2702')), updated_at = datetime('now') WHERE slug = 's2702';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-01', 'S2702 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-02', 'S2702 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-03', 'S2702 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-04', 'S2702 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-05', 'S2702 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-06', 'S2702 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-07', 'S2702 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-08', 'S2702 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-09', 'S2702 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-10', 'S2702 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-11', 'S2702 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-12', 'S2702 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-13', 'S2702 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-14', 'S2702 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-15', 'S2702 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-16', 'S2702 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-17', 'S2702 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-18', 'S2702 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-19', 'S2702 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-20', 'S2702 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-21', 'S2702 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-22', 'S2702 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-23', 'S2702 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-24', 'S2702 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-25', 'S2702 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-26', 'S2702 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-27', 'S2702 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-28', 'S2702 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-29', 'S2702 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-30', 'S2702 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-31', 'S2702 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-32', 'S2702 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-33', 'S2702 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-34', 'S2702 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-35', 'S2702 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-36', 'S2702 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-37', 'S2702 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-38', 'S2702 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-39', 'S2702 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-40', 'S2702 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-41', 'S2702 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-42', 'S2702 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-43', 'S2702 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-44', 'S2702 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2702', (SELECT id FROM wiki_pages WHERE slug = 's2702'), 's2702-45', 'S2702 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2703', 'S2703 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2703 班

本页为 S2703 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2703';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2703')), updated_at = datetime('now') WHERE slug = 's2703';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-01', 'S2703 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-02', 'S2703 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-03', 'S2703 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-04', 'S2703 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-05', 'S2703 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-06', 'S2703 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-07', 'S2703 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-08', 'S2703 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-09', 'S2703 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-10', 'S2703 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-11', 'S2703 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-12', 'S2703 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-13', 'S2703 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-14', 'S2703 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-15', 'S2703 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-16', 'S2703 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-17', 'S2703 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-18', 'S2703 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-19', 'S2703 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-20', 'S2703 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-21', 'S2703 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-22', 'S2703 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-23', 'S2703 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-24', 'S2703 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-25', 'S2703 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-26', 'S2703 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-27', 'S2703 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-28', 'S2703 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-29', 'S2703 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-30', 'S2703 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-31', 'S2703 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-32', 'S2703 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-33', 'S2703 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-34', 'S2703 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-35', 'S2703 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-36', 'S2703 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-37', 'S2703 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-38', 'S2703 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-39', 'S2703 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-40', 'S2703 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-41', 'S2703 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-42', 'S2703 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-43', 'S2703 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-44', 'S2703 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2703', (SELECT id FROM wiki_pages WHERE slug = 's2703'), 's2703-45', 'S2703 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2704', 'S2704 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2704 班

本页为 S2704 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2704';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2704')), updated_at = datetime('now') WHERE slug = 's2704';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-01', 'S2704 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-02', 'S2704 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-03', 'S2704 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-04', 'S2704 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-05', 'S2704 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-06', 'S2704 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-07', 'S2704 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-08', 'S2704 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-09', 'S2704 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-10', 'S2704 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-11', 'S2704 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-12', 'S2704 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-13', 'S2704 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-14', 'S2704 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-15', 'S2704 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-16', 'S2704 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-17', 'S2704 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-18', 'S2704 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-19', 'S2704 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-20', 'S2704 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-21', 'S2704 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-22', 'S2704 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-23', 'S2704 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-24', 'S2704 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-25', 'S2704 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-26', 'S2704 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-27', 'S2704 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-28', 'S2704 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-29', 'S2704 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-30', 'S2704 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-31', 'S2704 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-32', 'S2704 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-33', 'S2704 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-34', 'S2704 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-35', 'S2704 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-36', 'S2704 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-37', 'S2704 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-38', 'S2704 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-39', 'S2704 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-40', 'S2704 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-41', 'S2704 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-42', 'S2704 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-43', 'S2704 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-44', 'S2704 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2704', (SELECT id FROM wiki_pages WHERE slug = 's2704'), 's2704-45', 'S2704 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2705', 'S2705 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2705 班

本页为 S2705 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2705';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2705')), updated_at = datetime('now') WHERE slug = 's2705';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-01', 'S2705 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-02', 'S2705 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-03', 'S2705 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-04', 'S2705 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-05', 'S2705 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-06', 'S2705 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-07', 'S2705 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-08', 'S2705 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-09', 'S2705 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-10', 'S2705 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-11', 'S2705 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-12', 'S2705 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-13', 'S2705 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-14', 'S2705 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-15', 'S2705 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-16', 'S2705 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-17', 'S2705 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-18', 'S2705 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-19', 'S2705 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-20', 'S2705 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-21', 'S2705 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-22', 'S2705 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-23', 'S2705 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-24', 'S2705 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-25', 'S2705 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-26', 'S2705 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-27', 'S2705 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-28', 'S2705 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-29', 'S2705 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-30', 'S2705 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-31', 'S2705 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-32', 'S2705 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-33', 'S2705 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-34', 'S2705 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-35', 'S2705 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-36', 'S2705 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-37', 'S2705 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-38', 'S2705 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-39', 'S2705 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-40', 'S2705 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-41', 'S2705 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-42', 'S2705 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-43', 'S2705 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-44', 'S2705 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2705', (SELECT id FROM wiki_pages WHERE slug = 's2705'), 's2705-45', 'S2705 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2706', 'S2706 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2706 班

本页为 S2706 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2706';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2706')), updated_at = datetime('now') WHERE slug = 's2706';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-01', 'S2706 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-02', 'S2706 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-03', 'S2706 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-04', 'S2706 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-05', 'S2706 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-06', 'S2706 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-07', 'S2706 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-08', 'S2706 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-09', 'S2706 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-10', 'S2706 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-11', 'S2706 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-12', 'S2706 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-13', 'S2706 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-14', 'S2706 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-15', 'S2706 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-16', 'S2706 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-17', 'S2706 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-18', 'S2706 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-19', 'S2706 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-20', 'S2706 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-21', 'S2706 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-22', 'S2706 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-23', 'S2706 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-24', 'S2706 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-25', 'S2706 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-26', 'S2706 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-27', 'S2706 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-28', 'S2706 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-29', 'S2706 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-30', 'S2706 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-31', 'S2706 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-32', 'S2706 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-33', 'S2706 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-34', 'S2706 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-35', 'S2706 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-36', 'S2706 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-37', 'S2706 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-38', 'S2706 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-39', 'S2706 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-40', 'S2706 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-41', 'S2706 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-42', 'S2706 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-43', 'S2706 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-44', 'S2706 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2706', (SELECT id FROM wiki_pages WHERE slug = 's2706'), 's2706-45', 'S2706 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2707', 'S2707 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2707 班

本页为 S2707 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2707';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2707')), updated_at = datetime('now') WHERE slug = 's2707';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-01', 'S2707 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-02', 'S2707 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-03', 'S2707 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-04', 'S2707 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-05', 'S2707 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-06', 'S2707 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-07', 'S2707 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-08', 'S2707 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-09', 'S2707 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-10', 'S2707 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-11', 'S2707 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-12', 'S2707 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-13', 'S2707 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-14', 'S2707 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-15', 'S2707 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-16', 'S2707 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-17', 'S2707 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-18', 'S2707 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-19', 'S2707 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-20', 'S2707 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-21', 'S2707 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-22', 'S2707 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-23', 'S2707 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-24', 'S2707 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-25', 'S2707 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-26', 'S2707 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-27', 'S2707 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-28', 'S2707 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-29', 'S2707 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-30', 'S2707 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-31', 'S2707 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-32', 'S2707 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-33', 'S2707 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-34', 'S2707 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-35', 'S2707 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-36', 'S2707 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-37', 'S2707 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-38', 'S2707 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-39', 'S2707 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-40', 'S2707 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-41', 'S2707 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-42', 'S2707 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-43', 'S2707 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-44', 'S2707 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2707', (SELECT id FROM wiki_pages WHERE slug = 's2707'), 's2707-45', 'S2707 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2708', 'S2708 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2708 班

本页为 S2708 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2708';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2708')), updated_at = datetime('now') WHERE slug = 's2708';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-01', 'S2708 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-02', 'S2708 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-03', 'S2708 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-04', 'S2708 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-05', 'S2708 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-06', 'S2708 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-07', 'S2708 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-08', 'S2708 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-09', 'S2708 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-10', 'S2708 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-11', 'S2708 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-12', 'S2708 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-13', 'S2708 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-14', 'S2708 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-15', 'S2708 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-16', 'S2708 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-17', 'S2708 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-18', 'S2708 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-19', 'S2708 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-20', 'S2708 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-21', 'S2708 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-22', 'S2708 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-23', 'S2708 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-24', 'S2708 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-25', 'S2708 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-26', 'S2708 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-27', 'S2708 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-28', 'S2708 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-29', 'S2708 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-30', 'S2708 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-31', 'S2708 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-32', 'S2708 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-33', 'S2708 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-34', 'S2708 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-35', 'S2708 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-36', 'S2708 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-37', 'S2708 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-38', 'S2708 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-39', 'S2708 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-40', 'S2708 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-41', 'S2708 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-42', 'S2708 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-43', 'S2708 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-44', 'S2708 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2708', (SELECT id FROM wiki_pages WHERE slug = 's2708'), 's2708-45', 'S2708 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2709', 'S2709 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2709 班

本页为 S2709 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2709';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2709')), updated_at = datetime('now') WHERE slug = 's2709';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-01', 'S2709 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-02', 'S2709 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-03', 'S2709 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-04', 'S2709 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-05', 'S2709 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-06', 'S2709 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-07', 'S2709 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-08', 'S2709 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-09', 'S2709 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-10', 'S2709 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-11', 'S2709 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-12', 'S2709 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-13', 'S2709 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-14', 'S2709 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-15', 'S2709 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-16', 'S2709 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-17', 'S2709 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-18', 'S2709 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-19', 'S2709 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-20', 'S2709 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-21', 'S2709 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-22', 'S2709 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-23', 'S2709 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-24', 'S2709 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-25', 'S2709 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-26', 'S2709 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-27', 'S2709 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-28', 'S2709 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-29', 'S2709 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-30', 'S2709 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-31', 'S2709 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-32', 'S2709 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-33', 'S2709 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-34', 'S2709 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-35', 'S2709 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-36', 'S2709 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-37', 'S2709 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-38', 'S2709 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-39', 'S2709 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-40', 'S2709 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-41', 'S2709 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-42', 'S2709 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-43', 'S2709 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-44', 'S2709 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2709', (SELECT id FROM wiki_pages WHERE slug = 's2709'), 's2709-45', 'S2709 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's27'), 's2710', 'S2710 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2710 班

本页为 S2710 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2710';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2710')), updated_at = datetime('now') WHERE slug = 's2710';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-01', 'S2710 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-02', 'S2710 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-03', 'S2710 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-04', 'S2710 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-05', 'S2710 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-06', 'S2710 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-07', 'S2710 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-08', 'S2710 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-09', 'S2710 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-10', 'S2710 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-11', 'S2710 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-12', 'S2710 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-13', 'S2710 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-14', 'S2710 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-15', 'S2710 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-16', 'S2710 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-17', 'S2710 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-18', 'S2710 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-19', 'S2710 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-20', 'S2710 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-21', 'S2710 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-22', 'S2710 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-23', 'S2710 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-24', 'S2710 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-25', 'S2710 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-26', 'S2710 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-27', 'S2710 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-28', 'S2710 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-29', 'S2710 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-30', 'S2710 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-31', 'S2710 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-32', 'S2710 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-33', 'S2710 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-34', 'S2710 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-35', 'S2710 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-36', 'S2710 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-37', 'S2710 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-38', 'S2710 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-39', 'S2710 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-40', 'S2710 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-41', 'S2710 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-42', 'S2710 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-43', 'S2710 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-44', 'S2710 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S27', 'S2710', (SELECT id FROM wiki_pages WHERE slug = 's2710'), 's2710-45', 'S2710 · 45 号');
