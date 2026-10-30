-- J29 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'J29', 'j29', 'J29 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# J29 级

本页为 J29 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 'j29';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j29')), updated_at = datetime('now') WHERE slug = 'j29';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2901', 'J2901 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2901 班

本页为 J2901 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2901';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2901')), updated_at = datetime('now') WHERE slug = 'j2901';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-01', 'J2901 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-02', 'J2901 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-03', 'J2901 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-04', 'J2901 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-05', 'J2901 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-06', 'J2901 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-07', 'J2901 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-08', 'J2901 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-09', 'J2901 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-10', 'J2901 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-11', 'J2901 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-12', 'J2901 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-13', 'J2901 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-14', 'J2901 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-15', 'J2901 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-16', 'J2901 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-17', 'J2901 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-18', 'J2901 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-19', 'J2901 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-20', 'J2901 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-21', 'J2901 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-22', 'J2901 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-23', 'J2901 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-24', 'J2901 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-25', 'J2901 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-26', 'J2901 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-27', 'J2901 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-28', 'J2901 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-29', 'J2901 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-30', 'J2901 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-31', 'J2901 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-32', 'J2901 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-33', 'J2901 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-34', 'J2901 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-35', 'J2901 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-36', 'J2901 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-37', 'J2901 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-38', 'J2901 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-39', 'J2901 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-40', 'J2901 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-41', 'J2901 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-42', 'J2901 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-43', 'J2901 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-44', 'J2901 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2901', (SELECT id FROM wiki_pages WHERE slug = 'j2901'), 'j2901-45', 'J2901 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2902', 'J2902 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2902 班

本页为 J2902 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2902';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2902')), updated_at = datetime('now') WHERE slug = 'j2902';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-01', 'J2902 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-02', 'J2902 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-03', 'J2902 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-04', 'J2902 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-05', 'J2902 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-06', 'J2902 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-07', 'J2902 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-08', 'J2902 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-09', 'J2902 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-10', 'J2902 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-11', 'J2902 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-12', 'J2902 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-13', 'J2902 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-14', 'J2902 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-15', 'J2902 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-16', 'J2902 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-17', 'J2902 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-18', 'J2902 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-19', 'J2902 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-20', 'J2902 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-21', 'J2902 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-22', 'J2902 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-23', 'J2902 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-24', 'J2902 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-25', 'J2902 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-26', 'J2902 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-27', 'J2902 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-28', 'J2902 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-29', 'J2902 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-30', 'J2902 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-31', 'J2902 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-32', 'J2902 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-33', 'J2902 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-34', 'J2902 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-35', 'J2902 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-36', 'J2902 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-37', 'J2902 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-38', 'J2902 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-39', 'J2902 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-40', 'J2902 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-41', 'J2902 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-42', 'J2902 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-43', 'J2902 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-44', 'J2902 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2902', (SELECT id FROM wiki_pages WHERE slug = 'j2902'), 'j2902-45', 'J2902 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2903', 'J2903 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2903 班

本页为 J2903 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2903';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2903')), updated_at = datetime('now') WHERE slug = 'j2903';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-01', 'J2903 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-02', 'J2903 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-03', 'J2903 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-04', 'J2903 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-05', 'J2903 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-06', 'J2903 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-07', 'J2903 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-08', 'J2903 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-09', 'J2903 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-10', 'J2903 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-11', 'J2903 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-12', 'J2903 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-13', 'J2903 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-14', 'J2903 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-15', 'J2903 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-16', 'J2903 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-17', 'J2903 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-18', 'J2903 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-19', 'J2903 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-20', 'J2903 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-21', 'J2903 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-22', 'J2903 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-23', 'J2903 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-24', 'J2903 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-25', 'J2903 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-26', 'J2903 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-27', 'J2903 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-28', 'J2903 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-29', 'J2903 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-30', 'J2903 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-31', 'J2903 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-32', 'J2903 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-33', 'J2903 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-34', 'J2903 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-35', 'J2903 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-36', 'J2903 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-37', 'J2903 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-38', 'J2903 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-39', 'J2903 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-40', 'J2903 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-41', 'J2903 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-42', 'J2903 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-43', 'J2903 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-44', 'J2903 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2903', (SELECT id FROM wiki_pages WHERE slug = 'j2903'), 'j2903-45', 'J2903 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2904', 'J2904 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2904 班

本页为 J2904 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2904';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2904')), updated_at = datetime('now') WHERE slug = 'j2904';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-01', 'J2904 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-02', 'J2904 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-03', 'J2904 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-04', 'J2904 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-05', 'J2904 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-06', 'J2904 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-07', 'J2904 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-08', 'J2904 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-09', 'J2904 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-10', 'J2904 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-11', 'J2904 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-12', 'J2904 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-13', 'J2904 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-14', 'J2904 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-15', 'J2904 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-16', 'J2904 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-17', 'J2904 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-18', 'J2904 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-19', 'J2904 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-20', 'J2904 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-21', 'J2904 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-22', 'J2904 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-23', 'J2904 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-24', 'J2904 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-25', 'J2904 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-26', 'J2904 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-27', 'J2904 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-28', 'J2904 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-29', 'J2904 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-30', 'J2904 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-31', 'J2904 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-32', 'J2904 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-33', 'J2904 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-34', 'J2904 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-35', 'J2904 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-36', 'J2904 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-37', 'J2904 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-38', 'J2904 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-39', 'J2904 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-40', 'J2904 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-41', 'J2904 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-42', 'J2904 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-43', 'J2904 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-44', 'J2904 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2904', (SELECT id FROM wiki_pages WHERE slug = 'j2904'), 'j2904-45', 'J2904 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2905', 'J2905 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2905 班

本页为 J2905 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2905';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2905')), updated_at = datetime('now') WHERE slug = 'j2905';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-01', 'J2905 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-02', 'J2905 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-03', 'J2905 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-04', 'J2905 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-05', 'J2905 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-06', 'J2905 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-07', 'J2905 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-08', 'J2905 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-09', 'J2905 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-10', 'J2905 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-11', 'J2905 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-12', 'J2905 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-13', 'J2905 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-14', 'J2905 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-15', 'J2905 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-16', 'J2905 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-17', 'J2905 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-18', 'J2905 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-19', 'J2905 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-20', 'J2905 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-21', 'J2905 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-22', 'J2905 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-23', 'J2905 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-24', 'J2905 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-25', 'J2905 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-26', 'J2905 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-27', 'J2905 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-28', 'J2905 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-29', 'J2905 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-30', 'J2905 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-31', 'J2905 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-32', 'J2905 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-33', 'J2905 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-34', 'J2905 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-35', 'J2905 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-36', 'J2905 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-37', 'J2905 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-38', 'J2905 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-39', 'J2905 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-40', 'J2905 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-41', 'J2905 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-42', 'J2905 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-43', 'J2905 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-44', 'J2905 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2905', (SELECT id FROM wiki_pages WHERE slug = 'j2905'), 'j2905-45', 'J2905 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2906', 'J2906 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2906 班

本页为 J2906 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2906';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2906')), updated_at = datetime('now') WHERE slug = 'j2906';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-01', 'J2906 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-02', 'J2906 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-03', 'J2906 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-04', 'J2906 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-05', 'J2906 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-06', 'J2906 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-07', 'J2906 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-08', 'J2906 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-09', 'J2906 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-10', 'J2906 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-11', 'J2906 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-12', 'J2906 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-13', 'J2906 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-14', 'J2906 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-15', 'J2906 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-16', 'J2906 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-17', 'J2906 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-18', 'J2906 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-19', 'J2906 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-20', 'J2906 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-21', 'J2906 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-22', 'J2906 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-23', 'J2906 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-24', 'J2906 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-25', 'J2906 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-26', 'J2906 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-27', 'J2906 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-28', 'J2906 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-29', 'J2906 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-30', 'J2906 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-31', 'J2906 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-32', 'J2906 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-33', 'J2906 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-34', 'J2906 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-35', 'J2906 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-36', 'J2906 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-37', 'J2906 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-38', 'J2906 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-39', 'J2906 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-40', 'J2906 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-41', 'J2906 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-42', 'J2906 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-43', 'J2906 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-44', 'J2906 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2906', (SELECT id FROM wiki_pages WHERE slug = 'j2906'), 'j2906-45', 'J2906 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2907', 'J2907 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2907 班

本页为 J2907 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2907';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2907')), updated_at = datetime('now') WHERE slug = 'j2907';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-01', 'J2907 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-02', 'J2907 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-03', 'J2907 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-04', 'J2907 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-05', 'J2907 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-06', 'J2907 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-07', 'J2907 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-08', 'J2907 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-09', 'J2907 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-10', 'J2907 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-11', 'J2907 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-12', 'J2907 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-13', 'J2907 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-14', 'J2907 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-15', 'J2907 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-16', 'J2907 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-17', 'J2907 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-18', 'J2907 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-19', 'J2907 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-20', 'J2907 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-21', 'J2907 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-22', 'J2907 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-23', 'J2907 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-24', 'J2907 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-25', 'J2907 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-26', 'J2907 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-27', 'J2907 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-28', 'J2907 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-29', 'J2907 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-30', 'J2907 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-31', 'J2907 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-32', 'J2907 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-33', 'J2907 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-34', 'J2907 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-35', 'J2907 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-36', 'J2907 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-37', 'J2907 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-38', 'J2907 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-39', 'J2907 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-40', 'J2907 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-41', 'J2907 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-42', 'J2907 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-43', 'J2907 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-44', 'J2907 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2907', (SELECT id FROM wiki_pages WHERE slug = 'j2907'), 'j2907-45', 'J2907 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2908', 'J2908 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2908 班

本页为 J2908 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2908';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2908')), updated_at = datetime('now') WHERE slug = 'j2908';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-01', 'J2908 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-02', 'J2908 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-03', 'J2908 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-04', 'J2908 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-05', 'J2908 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-06', 'J2908 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-07', 'J2908 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-08', 'J2908 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-09', 'J2908 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-10', 'J2908 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-11', 'J2908 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-12', 'J2908 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-13', 'J2908 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-14', 'J2908 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-15', 'J2908 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-16', 'J2908 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-17', 'J2908 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-18', 'J2908 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-19', 'J2908 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-20', 'J2908 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-21', 'J2908 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-22', 'J2908 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-23', 'J2908 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-24', 'J2908 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-25', 'J2908 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-26', 'J2908 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-27', 'J2908 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-28', 'J2908 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-29', 'J2908 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-30', 'J2908 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-31', 'J2908 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-32', 'J2908 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-33', 'J2908 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-34', 'J2908 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-35', 'J2908 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-36', 'J2908 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-37', 'J2908 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-38', 'J2908 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-39', 'J2908 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-40', 'J2908 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-41', 'J2908 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-42', 'J2908 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-43', 'J2908 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-44', 'J2908 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2908', (SELECT id FROM wiki_pages WHERE slug = 'j2908'), 'j2908-45', 'J2908 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2909', 'J2909 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2909 班

本页为 J2909 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2909';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2909')), updated_at = datetime('now') WHERE slug = 'j2909';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-01', 'J2909 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-02', 'J2909 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-03', 'J2909 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-04', 'J2909 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-05', 'J2909 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-06', 'J2909 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-07', 'J2909 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-08', 'J2909 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-09', 'J2909 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-10', 'J2909 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-11', 'J2909 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-12', 'J2909 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-13', 'J2909 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-14', 'J2909 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-15', 'J2909 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-16', 'J2909 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-17', 'J2909 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-18', 'J2909 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-19', 'J2909 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-20', 'J2909 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-21', 'J2909 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-22', 'J2909 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-23', 'J2909 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-24', 'J2909 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-25', 'J2909 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-26', 'J2909 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-27', 'J2909 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-28', 'J2909 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-29', 'J2909 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-30', 'J2909 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-31', 'J2909 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-32', 'J2909 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-33', 'J2909 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-34', 'J2909 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-35', 'J2909 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-36', 'J2909 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-37', 'J2909 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-38', 'J2909 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-39', 'J2909 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-40', 'J2909 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-41', 'J2909 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-42', 'J2909 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-43', 'J2909 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-44', 'J2909 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2909', (SELECT id FROM wiki_pages WHERE slug = 'j2909'), 'j2909-45', 'J2909 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j29'), 'j2910', 'J2910 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2910 班

本页为 J2910 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2910';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2910')), updated_at = datetime('now') WHERE slug = 'j2910';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-01', 'J2910 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-02', 'J2910 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-03', 'J2910 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-04', 'J2910 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-05', 'J2910 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-06', 'J2910 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-07', 'J2910 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-08', 'J2910 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-09', 'J2910 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-10', 'J2910 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-11', 'J2910 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-12', 'J2910 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-13', 'J2910 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-14', 'J2910 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-15', 'J2910 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-16', 'J2910 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-17', 'J2910 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-18', 'J2910 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-19', 'J2910 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-20', 'J2910 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-21', 'J2910 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-22', 'J2910 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-23', 'J2910 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-24', 'J2910 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-25', 'J2910 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-26', 'J2910 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-27', 'J2910 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-28', 'J2910 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-29', 'J2910 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-30', 'J2910 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-31', 'J2910 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-32', 'J2910 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-33', 'J2910 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-34', 'J2910 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-35', 'J2910 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-36', 'J2910 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-37', 'J2910 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-38', 'J2910 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-39', 'J2910 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-40', 'J2910 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-41', 'J2910 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-42', 'J2910 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-43', 'J2910 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-44', 'J2910 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J29', 'J2910', (SELECT id FROM wiki_pages WHERE slug = 'j2910'), 'j2910-45', 'J2910 · 45 号');
