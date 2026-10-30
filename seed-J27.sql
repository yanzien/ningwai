-- J27 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'J27', 'j27', 'J27 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# J27 级

本页为 J27 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 'j27';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j27')), updated_at = datetime('now') WHERE slug = 'j27';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2701', 'J2701 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2701 班

本页为 J2701 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2701';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2701')), updated_at = datetime('now') WHERE slug = 'j2701';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-01', 'J2701 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-02', 'J2701 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-03', 'J2701 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-04', 'J2701 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-05', 'J2701 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-06', 'J2701 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-07', 'J2701 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-08', 'J2701 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-09', 'J2701 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-10', 'J2701 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-11', 'J2701 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-12', 'J2701 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-13', 'J2701 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-14', 'J2701 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-15', 'J2701 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-16', 'J2701 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-17', 'J2701 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-18', 'J2701 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-19', 'J2701 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-20', 'J2701 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-21', 'J2701 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-22', 'J2701 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-23', 'J2701 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-24', 'J2701 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-25', 'J2701 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-26', 'J2701 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-27', 'J2701 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-28', 'J2701 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-29', 'J2701 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-30', 'J2701 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-31', 'J2701 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-32', 'J2701 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-33', 'J2701 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-34', 'J2701 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-35', 'J2701 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-36', 'J2701 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-37', 'J2701 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-38', 'J2701 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-39', 'J2701 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-40', 'J2701 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-41', 'J2701 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-42', 'J2701 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-43', 'J2701 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-44', 'J2701 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2701', (SELECT id FROM wiki_pages WHERE slug = 'j2701'), 'j2701-45', 'J2701 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2702', 'J2702 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2702 班

本页为 J2702 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2702';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2702')), updated_at = datetime('now') WHERE slug = 'j2702';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-01', 'J2702 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-02', 'J2702 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-03', 'J2702 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-04', 'J2702 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-05', 'J2702 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-06', 'J2702 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-07', 'J2702 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-08', 'J2702 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-09', 'J2702 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-10', 'J2702 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-11', 'J2702 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-12', 'J2702 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-13', 'J2702 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-14', 'J2702 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-15', 'J2702 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-16', 'J2702 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-17', 'J2702 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-18', 'J2702 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-19', 'J2702 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-20', 'J2702 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-21', 'J2702 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-22', 'J2702 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-23', 'J2702 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-24', 'J2702 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-25', 'J2702 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-26', 'J2702 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-27', 'J2702 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-28', 'J2702 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-29', 'J2702 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-30', 'J2702 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-31', 'J2702 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-32', 'J2702 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-33', 'J2702 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-34', 'J2702 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-35', 'J2702 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-36', 'J2702 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-37', 'J2702 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-38', 'J2702 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-39', 'J2702 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-40', 'J2702 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-41', 'J2702 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-42', 'J2702 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-43', 'J2702 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-44', 'J2702 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2702', (SELECT id FROM wiki_pages WHERE slug = 'j2702'), 'j2702-45', 'J2702 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2703', 'J2703 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2703 班

本页为 J2703 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2703';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2703')), updated_at = datetime('now') WHERE slug = 'j2703';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-01', 'J2703 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-02', 'J2703 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-03', 'J2703 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-04', 'J2703 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-05', 'J2703 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-06', 'J2703 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-07', 'J2703 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-08', 'J2703 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-09', 'J2703 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-10', 'J2703 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-11', 'J2703 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-12', 'J2703 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-13', 'J2703 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-14', 'J2703 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-15', 'J2703 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-16', 'J2703 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-17', 'J2703 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-18', 'J2703 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-19', 'J2703 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-20', 'J2703 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-21', 'J2703 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-22', 'J2703 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-23', 'J2703 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-24', 'J2703 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-25', 'J2703 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-26', 'J2703 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-27', 'J2703 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-28', 'J2703 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-29', 'J2703 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-30', 'J2703 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-31', 'J2703 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-32', 'J2703 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-33', 'J2703 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-34', 'J2703 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-35', 'J2703 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-36', 'J2703 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-37', 'J2703 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-38', 'J2703 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-39', 'J2703 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-40', 'J2703 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-41', 'J2703 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-42', 'J2703 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-43', 'J2703 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-44', 'J2703 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2703', (SELECT id FROM wiki_pages WHERE slug = 'j2703'), 'j2703-45', 'J2703 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2704', 'J2704 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2704 班

本页为 J2704 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2704';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2704')), updated_at = datetime('now') WHERE slug = 'j2704';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-01', 'J2704 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-02', 'J2704 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-03', 'J2704 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-04', 'J2704 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-05', 'J2704 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-06', 'J2704 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-07', 'J2704 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-08', 'J2704 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-09', 'J2704 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-10', 'J2704 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-11', 'J2704 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-12', 'J2704 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-13', 'J2704 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-14', 'J2704 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-15', 'J2704 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-16', 'J2704 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-17', 'J2704 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-18', 'J2704 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-19', 'J2704 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-20', 'J2704 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-21', 'J2704 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-22', 'J2704 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-23', 'J2704 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-24', 'J2704 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-25', 'J2704 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-26', 'J2704 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-27', 'J2704 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-28', 'J2704 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-29', 'J2704 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-30', 'J2704 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-31', 'J2704 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-32', 'J2704 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-33', 'J2704 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-34', 'J2704 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-35', 'J2704 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-36', 'J2704 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-37', 'J2704 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-38', 'J2704 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-39', 'J2704 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-40', 'J2704 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-41', 'J2704 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-42', 'J2704 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-43', 'J2704 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-44', 'J2704 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2704', (SELECT id FROM wiki_pages WHERE slug = 'j2704'), 'j2704-45', 'J2704 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2705', 'J2705 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2705 班

本页为 J2705 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2705';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2705')), updated_at = datetime('now') WHERE slug = 'j2705';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-01', 'J2705 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-02', 'J2705 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-03', 'J2705 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-04', 'J2705 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-05', 'J2705 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-06', 'J2705 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-07', 'J2705 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-08', 'J2705 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-09', 'J2705 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-10', 'J2705 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-11', 'J2705 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-12', 'J2705 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-13', 'J2705 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-14', 'J2705 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-15', 'J2705 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-16', 'J2705 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-17', 'J2705 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-18', 'J2705 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-19', 'J2705 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-20', 'J2705 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-21', 'J2705 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-22', 'J2705 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-23', 'J2705 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-24', 'J2705 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-25', 'J2705 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-26', 'J2705 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-27', 'J2705 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-28', 'J2705 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-29', 'J2705 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-30', 'J2705 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-31', 'J2705 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-32', 'J2705 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-33', 'J2705 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-34', 'J2705 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-35', 'J2705 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-36', 'J2705 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-37', 'J2705 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-38', 'J2705 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-39', 'J2705 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-40', 'J2705 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-41', 'J2705 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-42', 'J2705 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-43', 'J2705 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-44', 'J2705 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2705', (SELECT id FROM wiki_pages WHERE slug = 'j2705'), 'j2705-45', 'J2705 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2706', 'J2706 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2706 班

本页为 J2706 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2706';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2706')), updated_at = datetime('now') WHERE slug = 'j2706';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-01', 'J2706 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-02', 'J2706 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-03', 'J2706 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-04', 'J2706 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-05', 'J2706 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-06', 'J2706 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-07', 'J2706 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-08', 'J2706 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-09', 'J2706 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-10', 'J2706 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-11', 'J2706 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-12', 'J2706 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-13', 'J2706 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-14', 'J2706 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-15', 'J2706 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-16', 'J2706 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-17', 'J2706 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-18', 'J2706 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-19', 'J2706 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-20', 'J2706 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-21', 'J2706 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-22', 'J2706 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-23', 'J2706 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-24', 'J2706 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-25', 'J2706 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-26', 'J2706 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-27', 'J2706 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-28', 'J2706 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-29', 'J2706 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-30', 'J2706 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-31', 'J2706 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-32', 'J2706 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-33', 'J2706 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-34', 'J2706 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-35', 'J2706 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-36', 'J2706 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-37', 'J2706 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-38', 'J2706 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-39', 'J2706 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-40', 'J2706 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-41', 'J2706 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-42', 'J2706 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-43', 'J2706 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-44', 'J2706 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2706', (SELECT id FROM wiki_pages WHERE slug = 'j2706'), 'j2706-45', 'J2706 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2707', 'J2707 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2707 班

本页为 J2707 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2707';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2707')), updated_at = datetime('now') WHERE slug = 'j2707';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-01', 'J2707 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-02', 'J2707 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-03', 'J2707 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-04', 'J2707 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-05', 'J2707 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-06', 'J2707 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-07', 'J2707 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-08', 'J2707 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-09', 'J2707 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-10', 'J2707 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-11', 'J2707 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-12', 'J2707 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-13', 'J2707 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-14', 'J2707 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-15', 'J2707 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-16', 'J2707 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-17', 'J2707 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-18', 'J2707 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-19', 'J2707 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-20', 'J2707 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-21', 'J2707 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-22', 'J2707 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-23', 'J2707 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-24', 'J2707 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-25', 'J2707 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-26', 'J2707 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-27', 'J2707 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-28', 'J2707 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-29', 'J2707 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-30', 'J2707 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-31', 'J2707 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-32', 'J2707 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-33', 'J2707 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-34', 'J2707 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-35', 'J2707 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-36', 'J2707 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-37', 'J2707 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-38', 'J2707 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-39', 'J2707 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-40', 'J2707 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-41', 'J2707 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-42', 'J2707 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-43', 'J2707 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-44', 'J2707 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2707', (SELECT id FROM wiki_pages WHERE slug = 'j2707'), 'j2707-45', 'J2707 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2708', 'J2708 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2708 班

本页为 J2708 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2708';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2708')), updated_at = datetime('now') WHERE slug = 'j2708';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-01', 'J2708 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-02', 'J2708 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-03', 'J2708 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-04', 'J2708 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-05', 'J2708 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-06', 'J2708 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-07', 'J2708 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-08', 'J2708 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-09', 'J2708 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-10', 'J2708 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-11', 'J2708 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-12', 'J2708 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-13', 'J2708 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-14', 'J2708 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-15', 'J2708 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-16', 'J2708 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-17', 'J2708 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-18', 'J2708 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-19', 'J2708 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-20', 'J2708 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-21', 'J2708 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-22', 'J2708 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-23', 'J2708 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-24', 'J2708 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-25', 'J2708 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-26', 'J2708 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-27', 'J2708 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-28', 'J2708 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-29', 'J2708 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-30', 'J2708 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-31', 'J2708 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-32', 'J2708 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-33', 'J2708 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-34', 'J2708 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-35', 'J2708 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-36', 'J2708 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-37', 'J2708 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-38', 'J2708 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-39', 'J2708 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-40', 'J2708 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-41', 'J2708 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-42', 'J2708 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-43', 'J2708 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-44', 'J2708 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2708', (SELECT id FROM wiki_pages WHERE slug = 'j2708'), 'j2708-45', 'J2708 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2709', 'J2709 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2709 班

本页为 J2709 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2709';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2709')), updated_at = datetime('now') WHERE slug = 'j2709';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-01', 'J2709 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-02', 'J2709 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-03', 'J2709 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-04', 'J2709 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-05', 'J2709 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-06', 'J2709 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-07', 'J2709 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-08', 'J2709 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-09', 'J2709 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-10', 'J2709 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-11', 'J2709 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-12', 'J2709 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-13', 'J2709 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-14', 'J2709 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-15', 'J2709 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-16', 'J2709 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-17', 'J2709 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-18', 'J2709 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-19', 'J2709 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-20', 'J2709 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-21', 'J2709 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-22', 'J2709 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-23', 'J2709 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-24', 'J2709 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-25', 'J2709 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-26', 'J2709 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-27', 'J2709 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-28', 'J2709 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-29', 'J2709 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-30', 'J2709 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-31', 'J2709 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-32', 'J2709 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-33', 'J2709 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-34', 'J2709 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-35', 'J2709 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-36', 'J2709 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-37', 'J2709 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-38', 'J2709 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-39', 'J2709 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-40', 'J2709 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-41', 'J2709 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-42', 'J2709 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-43', 'J2709 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-44', 'J2709 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2709', (SELECT id FROM wiki_pages WHERE slug = 'j2709'), 'j2709-45', 'J2709 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j27'), 'j2710', 'J2710 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2710 班

本页为 J2710 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2710';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2710')), updated_at = datetime('now') WHERE slug = 'j2710';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-01', 'J2710 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-02', 'J2710 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-03', 'J2710 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-04', 'J2710 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-05', 'J2710 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-06', 'J2710 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-07', 'J2710 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-08', 'J2710 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-09', 'J2710 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-10', 'J2710 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-11', 'J2710 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-12', 'J2710 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-13', 'J2710 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-14', 'J2710 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-15', 'J2710 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-16', 'J2710 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-17', 'J2710 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-18', 'J2710 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-19', 'J2710 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-20', 'J2710 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-21', 'J2710 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-22', 'J2710 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-23', 'J2710 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-24', 'J2710 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-25', 'J2710 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-26', 'J2710 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-27', 'J2710 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-28', 'J2710 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-29', 'J2710 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-30', 'J2710 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-31', 'J2710 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-32', 'J2710 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-33', 'J2710 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-34', 'J2710 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-35', 'J2710 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-36', 'J2710 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-37', 'J2710 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-38', 'J2710 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-39', 'J2710 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-40', 'J2710 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-41', 'J2710 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-42', 'J2710 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-43', 'J2710 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-44', 'J2710 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J27', 'J2710', (SELECT id FROM wiki_pages WHERE slug = 'j2710'), 'j2710-45', 'J2710 · 45 号');
