-- S29 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'S29', 's29', 'S29 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# S29 级

本页为 S29 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 's29';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's29')), updated_at = datetime('now') WHERE slug = 's29';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2901', 'S2901 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2901 班

本页为 S2901 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2901';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2901')), updated_at = datetime('now') WHERE slug = 's2901';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-01', 'S2901 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-02', 'S2901 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-03', 'S2901 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-04', 'S2901 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-05', 'S2901 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-06', 'S2901 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-07', 'S2901 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-08', 'S2901 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-09', 'S2901 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-10', 'S2901 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-11', 'S2901 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-12', 'S2901 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-13', 'S2901 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-14', 'S2901 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-15', 'S2901 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-16', 'S2901 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-17', 'S2901 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-18', 'S2901 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-19', 'S2901 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-20', 'S2901 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-21', 'S2901 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-22', 'S2901 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-23', 'S2901 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-24', 'S2901 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-25', 'S2901 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-26', 'S2901 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-27', 'S2901 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-28', 'S2901 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-29', 'S2901 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-30', 'S2901 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-31', 'S2901 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-32', 'S2901 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-33', 'S2901 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-34', 'S2901 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-35', 'S2901 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-36', 'S2901 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-37', 'S2901 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-38', 'S2901 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-39', 'S2901 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-40', 'S2901 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-41', 'S2901 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-42', 'S2901 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-43', 'S2901 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-44', 'S2901 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2901', (SELECT id FROM wiki_pages WHERE slug = 's2901'), 's2901-45', 'S2901 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2902', 'S2902 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2902 班

本页为 S2902 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2902';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2902')), updated_at = datetime('now') WHERE slug = 's2902';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-01', 'S2902 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-02', 'S2902 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-03', 'S2902 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-04', 'S2902 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-05', 'S2902 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-06', 'S2902 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-07', 'S2902 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-08', 'S2902 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-09', 'S2902 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-10', 'S2902 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-11', 'S2902 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-12', 'S2902 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-13', 'S2902 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-14', 'S2902 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-15', 'S2902 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-16', 'S2902 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-17', 'S2902 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-18', 'S2902 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-19', 'S2902 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-20', 'S2902 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-21', 'S2902 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-22', 'S2902 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-23', 'S2902 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-24', 'S2902 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-25', 'S2902 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-26', 'S2902 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-27', 'S2902 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-28', 'S2902 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-29', 'S2902 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-30', 'S2902 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-31', 'S2902 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-32', 'S2902 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-33', 'S2902 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-34', 'S2902 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-35', 'S2902 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-36', 'S2902 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-37', 'S2902 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-38', 'S2902 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-39', 'S2902 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-40', 'S2902 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-41', 'S2902 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-42', 'S2902 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-43', 'S2902 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-44', 'S2902 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2902', (SELECT id FROM wiki_pages WHERE slug = 's2902'), 's2902-45', 'S2902 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2903', 'S2903 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2903 班

本页为 S2903 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2903';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2903')), updated_at = datetime('now') WHERE slug = 's2903';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-01', 'S2903 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-02', 'S2903 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-03', 'S2903 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-04', 'S2903 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-05', 'S2903 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-06', 'S2903 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-07', 'S2903 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-08', 'S2903 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-09', 'S2903 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-10', 'S2903 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-11', 'S2903 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-12', 'S2903 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-13', 'S2903 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-14', 'S2903 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-15', 'S2903 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-16', 'S2903 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-17', 'S2903 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-18', 'S2903 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-19', 'S2903 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-20', 'S2903 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-21', 'S2903 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-22', 'S2903 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-23', 'S2903 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-24', 'S2903 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-25', 'S2903 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-26', 'S2903 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-27', 'S2903 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-28', 'S2903 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-29', 'S2903 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-30', 'S2903 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-31', 'S2903 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-32', 'S2903 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-33', 'S2903 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-34', 'S2903 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-35', 'S2903 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-36', 'S2903 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-37', 'S2903 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-38', 'S2903 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-39', 'S2903 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-40', 'S2903 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-41', 'S2903 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-42', 'S2903 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-43', 'S2903 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-44', 'S2903 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2903', (SELECT id FROM wiki_pages WHERE slug = 's2903'), 's2903-45', 'S2903 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2904', 'S2904 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2904 班

本页为 S2904 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2904';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2904')), updated_at = datetime('now') WHERE slug = 's2904';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-01', 'S2904 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-02', 'S2904 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-03', 'S2904 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-04', 'S2904 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-05', 'S2904 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-06', 'S2904 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-07', 'S2904 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-08', 'S2904 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-09', 'S2904 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-10', 'S2904 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-11', 'S2904 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-12', 'S2904 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-13', 'S2904 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-14', 'S2904 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-15', 'S2904 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-16', 'S2904 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-17', 'S2904 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-18', 'S2904 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-19', 'S2904 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-20', 'S2904 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-21', 'S2904 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-22', 'S2904 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-23', 'S2904 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-24', 'S2904 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-25', 'S2904 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-26', 'S2904 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-27', 'S2904 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-28', 'S2904 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-29', 'S2904 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-30', 'S2904 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-31', 'S2904 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-32', 'S2904 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-33', 'S2904 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-34', 'S2904 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-35', 'S2904 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-36', 'S2904 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-37', 'S2904 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-38', 'S2904 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-39', 'S2904 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-40', 'S2904 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-41', 'S2904 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-42', 'S2904 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-43', 'S2904 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-44', 'S2904 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2904', (SELECT id FROM wiki_pages WHERE slug = 's2904'), 's2904-45', 'S2904 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2905', 'S2905 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2905 班

本页为 S2905 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2905';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2905')), updated_at = datetime('now') WHERE slug = 's2905';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-01', 'S2905 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-02', 'S2905 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-03', 'S2905 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-04', 'S2905 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-05', 'S2905 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-06', 'S2905 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-07', 'S2905 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-08', 'S2905 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-09', 'S2905 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-10', 'S2905 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-11', 'S2905 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-12', 'S2905 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-13', 'S2905 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-14', 'S2905 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-15', 'S2905 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-16', 'S2905 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-17', 'S2905 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-18', 'S2905 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-19', 'S2905 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-20', 'S2905 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-21', 'S2905 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-22', 'S2905 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-23', 'S2905 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-24', 'S2905 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-25', 'S2905 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-26', 'S2905 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-27', 'S2905 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-28', 'S2905 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-29', 'S2905 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-30', 'S2905 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-31', 'S2905 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-32', 'S2905 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-33', 'S2905 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-34', 'S2905 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-35', 'S2905 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-36', 'S2905 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-37', 'S2905 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-38', 'S2905 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-39', 'S2905 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-40', 'S2905 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-41', 'S2905 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-42', 'S2905 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-43', 'S2905 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-44', 'S2905 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2905', (SELECT id FROM wiki_pages WHERE slug = 's2905'), 's2905-45', 'S2905 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2906', 'S2906 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2906 班

本页为 S2906 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2906';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2906')), updated_at = datetime('now') WHERE slug = 's2906';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-01', 'S2906 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-02', 'S2906 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-03', 'S2906 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-04', 'S2906 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-05', 'S2906 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-06', 'S2906 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-07', 'S2906 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-08', 'S2906 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-09', 'S2906 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-10', 'S2906 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-11', 'S2906 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-12', 'S2906 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-13', 'S2906 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-14', 'S2906 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-15', 'S2906 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-16', 'S2906 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-17', 'S2906 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-18', 'S2906 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-19', 'S2906 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-20', 'S2906 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-21', 'S2906 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-22', 'S2906 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-23', 'S2906 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-24', 'S2906 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-25', 'S2906 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-26', 'S2906 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-27', 'S2906 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-28', 'S2906 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-29', 'S2906 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-30', 'S2906 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-31', 'S2906 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-32', 'S2906 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-33', 'S2906 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-34', 'S2906 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-35', 'S2906 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-36', 'S2906 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-37', 'S2906 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-38', 'S2906 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-39', 'S2906 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-40', 'S2906 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-41', 'S2906 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-42', 'S2906 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-43', 'S2906 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-44', 'S2906 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2906', (SELECT id FROM wiki_pages WHERE slug = 's2906'), 's2906-45', 'S2906 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2907', 'S2907 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2907 班

本页为 S2907 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2907';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2907')), updated_at = datetime('now') WHERE slug = 's2907';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-01', 'S2907 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-02', 'S2907 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-03', 'S2907 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-04', 'S2907 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-05', 'S2907 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-06', 'S2907 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-07', 'S2907 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-08', 'S2907 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-09', 'S2907 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-10', 'S2907 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-11', 'S2907 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-12', 'S2907 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-13', 'S2907 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-14', 'S2907 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-15', 'S2907 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-16', 'S2907 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-17', 'S2907 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-18', 'S2907 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-19', 'S2907 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-20', 'S2907 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-21', 'S2907 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-22', 'S2907 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-23', 'S2907 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-24', 'S2907 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-25', 'S2907 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-26', 'S2907 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-27', 'S2907 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-28', 'S2907 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-29', 'S2907 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-30', 'S2907 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-31', 'S2907 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-32', 'S2907 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-33', 'S2907 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-34', 'S2907 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-35', 'S2907 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-36', 'S2907 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-37', 'S2907 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-38', 'S2907 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-39', 'S2907 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-40', 'S2907 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-41', 'S2907 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-42', 'S2907 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-43', 'S2907 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-44', 'S2907 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2907', (SELECT id FROM wiki_pages WHERE slug = 's2907'), 's2907-45', 'S2907 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2908', 'S2908 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2908 班

本页为 S2908 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2908';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2908')), updated_at = datetime('now') WHERE slug = 's2908';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-01', 'S2908 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-02', 'S2908 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-03', 'S2908 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-04', 'S2908 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-05', 'S2908 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-06', 'S2908 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-07', 'S2908 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-08', 'S2908 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-09', 'S2908 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-10', 'S2908 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-11', 'S2908 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-12', 'S2908 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-13', 'S2908 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-14', 'S2908 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-15', 'S2908 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-16', 'S2908 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-17', 'S2908 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-18', 'S2908 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-19', 'S2908 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-20', 'S2908 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-21', 'S2908 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-22', 'S2908 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-23', 'S2908 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-24', 'S2908 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-25', 'S2908 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-26', 'S2908 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-27', 'S2908 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-28', 'S2908 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-29', 'S2908 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-30', 'S2908 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-31', 'S2908 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-32', 'S2908 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-33', 'S2908 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-34', 'S2908 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-35', 'S2908 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-36', 'S2908 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-37', 'S2908 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-38', 'S2908 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-39', 'S2908 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-40', 'S2908 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-41', 'S2908 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-42', 'S2908 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-43', 'S2908 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-44', 'S2908 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2908', (SELECT id FROM wiki_pages WHERE slug = 's2908'), 's2908-45', 'S2908 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2909', 'S2909 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2909 班

本页为 S2909 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2909';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2909')), updated_at = datetime('now') WHERE slug = 's2909';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-01', 'S2909 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-02', 'S2909 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-03', 'S2909 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-04', 'S2909 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-05', 'S2909 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-06', 'S2909 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-07', 'S2909 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-08', 'S2909 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-09', 'S2909 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-10', 'S2909 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-11', 'S2909 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-12', 'S2909 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-13', 'S2909 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-14', 'S2909 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-15', 'S2909 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-16', 'S2909 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-17', 'S2909 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-18', 'S2909 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-19', 'S2909 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-20', 'S2909 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-21', 'S2909 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-22', 'S2909 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-23', 'S2909 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-24', 'S2909 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-25', 'S2909 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-26', 'S2909 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-27', 'S2909 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-28', 'S2909 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-29', 'S2909 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-30', 'S2909 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-31', 'S2909 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-32', 'S2909 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-33', 'S2909 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-34', 'S2909 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-35', 'S2909 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-36', 'S2909 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-37', 'S2909 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-38', 'S2909 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-39', 'S2909 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-40', 'S2909 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-41', 'S2909 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-42', 'S2909 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-43', 'S2909 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-44', 'S2909 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2909', (SELECT id FROM wiki_pages WHERE slug = 's2909'), 's2909-45', 'S2909 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's29'), 's2910', 'S2910 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2910 班

本页为 S2910 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2910';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2910')), updated_at = datetime('now') WHERE slug = 's2910';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-01', 'S2910 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-02', 'S2910 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-03', 'S2910 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-04', 'S2910 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-05', 'S2910 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-06', 'S2910 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-07', 'S2910 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-08', 'S2910 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-09', 'S2910 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-10', 'S2910 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-11', 'S2910 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-12', 'S2910 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-13', 'S2910 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-14', 'S2910 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-15', 'S2910 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-16', 'S2910 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-17', 'S2910 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-18', 'S2910 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-19', 'S2910 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-20', 'S2910 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-21', 'S2910 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-22', 'S2910 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-23', 'S2910 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-24', 'S2910 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-25', 'S2910 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-26', 'S2910 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-27', 'S2910 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-28', 'S2910 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-29', 'S2910 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-30', 'S2910 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-31', 'S2910 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-32', 'S2910 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-33', 'S2910 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-34', 'S2910 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-35', 'S2910 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-36', 'S2910 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-37', 'S2910 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-38', 'S2910 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-39', 'S2910 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-40', 'S2910 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-41', 'S2910 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-42', 'S2910 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-43', 'S2910 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-44', 'S2910 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S29', 'S2910', (SELECT id FROM wiki_pages WHERE slug = 's2910'), 's2910-45', 'S2910 · 45 号');
