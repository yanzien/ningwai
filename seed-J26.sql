-- J26 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'J26', 'j26', 'J26 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# J26 级

本页为 J26 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 'j26';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j26')), updated_at = datetime('now') WHERE slug = 'j26';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2601', 'J2601 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2601 班

本页为 J2601 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2601';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2601')), updated_at = datetime('now') WHERE slug = 'j2601';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-01', 'J2601 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-02', 'J2601 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-03', 'J2601 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-04', 'J2601 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-05', 'J2601 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-06', 'J2601 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-07', 'J2601 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-08', 'J2601 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-09', 'J2601 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-10', 'J2601 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-11', 'J2601 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-12', 'J2601 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-13', 'J2601 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-14', 'J2601 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-15', 'J2601 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-16', 'J2601 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-17', 'J2601 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-18', 'J2601 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-19', 'J2601 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-20', 'J2601 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-21', 'J2601 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-22', 'J2601 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-23', 'J2601 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-24', 'J2601 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-25', 'J2601 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-26', 'J2601 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-27', 'J2601 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-28', 'J2601 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-29', 'J2601 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-30', 'J2601 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-31', 'J2601 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-32', 'J2601 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-33', 'J2601 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-34', 'J2601 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-35', 'J2601 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-36', 'J2601 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-37', 'J2601 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-38', 'J2601 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-39', 'J2601 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-40', 'J2601 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-41', 'J2601 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-42', 'J2601 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-43', 'J2601 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-44', 'J2601 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2601', (SELECT id FROM wiki_pages WHERE slug = 'j2601'), 'j2601-45', 'J2601 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2602', 'J2602 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2602 班

本页为 J2602 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2602';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2602')), updated_at = datetime('now') WHERE slug = 'j2602';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-01', 'J2602 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-02', 'J2602 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-03', 'J2602 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-04', 'J2602 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-05', 'J2602 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-06', 'J2602 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-07', 'J2602 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-08', 'J2602 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-09', 'J2602 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-10', 'J2602 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-11', 'J2602 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-12', 'J2602 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-13', 'J2602 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-14', 'J2602 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-15', 'J2602 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-16', 'J2602 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-17', 'J2602 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-18', 'J2602 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-19', 'J2602 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-20', 'J2602 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-21', 'J2602 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-22', 'J2602 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-23', 'J2602 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-24', 'J2602 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-25', 'J2602 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-26', 'J2602 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-27', 'J2602 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-28', 'J2602 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-29', 'J2602 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-30', 'J2602 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-31', 'J2602 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-32', 'J2602 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-33', 'J2602 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-34', 'J2602 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-35', 'J2602 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-36', 'J2602 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-37', 'J2602 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-38', 'J2602 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-39', 'J2602 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-40', 'J2602 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-41', 'J2602 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-42', 'J2602 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-43', 'J2602 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-44', 'J2602 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2602', (SELECT id FROM wiki_pages WHERE slug = 'j2602'), 'j2602-45', 'J2602 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2603', 'J2603 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2603 班

本页为 J2603 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2603';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2603')), updated_at = datetime('now') WHERE slug = 'j2603';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-01', 'J2603 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-02', 'J2603 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-03', 'J2603 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-04', 'J2603 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-05', 'J2603 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-06', 'J2603 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-07', 'J2603 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-08', 'J2603 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-09', 'J2603 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-10', 'J2603 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-11', 'J2603 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-12', 'J2603 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-13', 'J2603 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-14', 'J2603 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-15', 'J2603 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-16', 'J2603 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-17', 'J2603 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-18', 'J2603 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-19', 'J2603 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-20', 'J2603 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-21', 'J2603 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-22', 'J2603 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-23', 'J2603 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-24', 'J2603 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-25', 'J2603 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-26', 'J2603 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-27', 'J2603 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-28', 'J2603 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-29', 'J2603 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-30', 'J2603 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-31', 'J2603 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-32', 'J2603 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-33', 'J2603 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-34', 'J2603 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-35', 'J2603 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-36', 'J2603 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-37', 'J2603 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-38', 'J2603 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-39', 'J2603 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-40', 'J2603 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-41', 'J2603 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-42', 'J2603 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-43', 'J2603 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-44', 'J2603 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2603', (SELECT id FROM wiki_pages WHERE slug = 'j2603'), 'j2603-45', 'J2603 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2604', 'J2604 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2604 班

本页为 J2604 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2604';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2604')), updated_at = datetime('now') WHERE slug = 'j2604';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-01', 'J2604 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-02', 'J2604 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-03', 'J2604 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-04', 'J2604 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-05', 'J2604 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-06', 'J2604 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-07', 'J2604 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-08', 'J2604 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-09', 'J2604 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-10', 'J2604 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-11', 'J2604 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-12', 'J2604 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-13', 'J2604 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-14', 'J2604 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-15', 'J2604 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-16', 'J2604 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-17', 'J2604 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-18', 'J2604 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-19', 'J2604 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-20', 'J2604 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-21', 'J2604 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-22', 'J2604 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-23', 'J2604 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-24', 'J2604 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-25', 'J2604 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-26', 'J2604 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-27', 'J2604 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-28', 'J2604 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-29', 'J2604 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-30', 'J2604 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-31', 'J2604 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-32', 'J2604 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-33', 'J2604 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-34', 'J2604 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-35', 'J2604 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-36', 'J2604 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-37', 'J2604 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-38', 'J2604 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-39', 'J2604 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-40', 'J2604 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-41', 'J2604 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-42', 'J2604 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-43', 'J2604 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-44', 'J2604 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2604', (SELECT id FROM wiki_pages WHERE slug = 'j2604'), 'j2604-45', 'J2604 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2605', 'J2605 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2605 班

本页为 J2605 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2605';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2605')), updated_at = datetime('now') WHERE slug = 'j2605';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-01', 'J2605 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-02', 'J2605 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-03', 'J2605 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-04', 'J2605 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-05', 'J2605 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-06', 'J2605 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-07', 'J2605 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-08', 'J2605 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-09', 'J2605 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-10', 'J2605 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-11', 'J2605 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-12', 'J2605 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-13', 'J2605 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-14', 'J2605 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-15', 'J2605 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-16', 'J2605 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-17', 'J2605 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-18', 'J2605 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-19', 'J2605 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-20', 'J2605 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-21', 'J2605 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-22', 'J2605 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-23', 'J2605 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-24', 'J2605 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-25', 'J2605 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-26', 'J2605 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-27', 'J2605 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-28', 'J2605 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-29', 'J2605 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-30', 'J2605 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-31', 'J2605 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-32', 'J2605 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-33', 'J2605 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-34', 'J2605 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-35', 'J2605 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-36', 'J2605 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-37', 'J2605 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-38', 'J2605 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-39', 'J2605 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-40', 'J2605 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-41', 'J2605 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-42', 'J2605 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-43', 'J2605 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-44', 'J2605 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2605', (SELECT id FROM wiki_pages WHERE slug = 'j2605'), 'j2605-45', 'J2605 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2606', 'J2606 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2606 班

本页为 J2606 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2606';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2606')), updated_at = datetime('now') WHERE slug = 'j2606';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-01', 'J2606 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-02', 'J2606 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-03', 'J2606 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-04', 'J2606 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-05', 'J2606 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-06', 'J2606 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-07', 'J2606 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-08', 'J2606 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-09', 'J2606 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-10', 'J2606 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-11', 'J2606 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-12', 'J2606 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-13', 'J2606 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-14', 'J2606 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-15', 'J2606 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-16', 'J2606 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-17', 'J2606 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-18', 'J2606 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-19', 'J2606 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-20', 'J2606 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-21', 'J2606 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-22', 'J2606 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-23', 'J2606 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-24', 'J2606 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-25', 'J2606 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-26', 'J2606 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-27', 'J2606 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-28', 'J2606 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-29', 'J2606 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-30', 'J2606 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-31', 'J2606 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-32', 'J2606 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-33', 'J2606 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-34', 'J2606 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-35', 'J2606 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-36', 'J2606 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-37', 'J2606 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-38', 'J2606 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-39', 'J2606 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-40', 'J2606 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-41', 'J2606 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-42', 'J2606 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-43', 'J2606 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-44', 'J2606 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2606', (SELECT id FROM wiki_pages WHERE slug = 'j2606'), 'j2606-45', 'J2606 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2607', 'J2607 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2607 班

本页为 J2607 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2607';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2607')), updated_at = datetime('now') WHERE slug = 'j2607';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-01', 'J2607 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-02', 'J2607 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-03', 'J2607 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-04', 'J2607 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-05', 'J2607 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-06', 'J2607 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-07', 'J2607 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-08', 'J2607 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-09', 'J2607 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-10', 'J2607 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-11', 'J2607 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-12', 'J2607 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-13', 'J2607 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-14', 'J2607 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-15', 'J2607 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-16', 'J2607 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-17', 'J2607 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-18', 'J2607 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-19', 'J2607 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-20', 'J2607 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-21', 'J2607 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-22', 'J2607 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-23', 'J2607 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-24', 'J2607 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-25', 'J2607 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-26', 'J2607 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-27', 'J2607 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-28', 'J2607 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-29', 'J2607 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-30', 'J2607 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-31', 'J2607 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-32', 'J2607 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-33', 'J2607 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-34', 'J2607 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-35', 'J2607 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-36', 'J2607 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-37', 'J2607 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-38', 'J2607 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-39', 'J2607 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-40', 'J2607 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-41', 'J2607 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-42', 'J2607 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-43', 'J2607 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-44', 'J2607 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2607', (SELECT id FROM wiki_pages WHERE slug = 'j2607'), 'j2607-45', 'J2607 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2608', 'J2608 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2608 班

本页为 J2608 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2608';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2608')), updated_at = datetime('now') WHERE slug = 'j2608';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-01', 'J2608 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-02', 'J2608 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-03', 'J2608 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-04', 'J2608 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-05', 'J2608 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-06', 'J2608 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-07', 'J2608 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-08', 'J2608 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-09', 'J2608 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-10', 'J2608 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-11', 'J2608 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-12', 'J2608 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-13', 'J2608 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-14', 'J2608 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-15', 'J2608 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-16', 'J2608 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-17', 'J2608 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-18', 'J2608 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-19', 'J2608 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-20', 'J2608 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-21', 'J2608 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-22', 'J2608 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-23', 'J2608 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-24', 'J2608 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-25', 'J2608 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-26', 'J2608 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-27', 'J2608 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-28', 'J2608 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-29', 'J2608 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-30', 'J2608 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-31', 'J2608 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-32', 'J2608 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-33', 'J2608 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-34', 'J2608 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-35', 'J2608 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-36', 'J2608 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-37', 'J2608 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-38', 'J2608 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-39', 'J2608 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-40', 'J2608 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-41', 'J2608 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-42', 'J2608 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-43', 'J2608 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-44', 'J2608 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2608', (SELECT id FROM wiki_pages WHERE slug = 'j2608'), 'j2608-45', 'J2608 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2609', 'J2609 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2609 班

本页为 J2609 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2609';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2609')), updated_at = datetime('now') WHERE slug = 'j2609';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-01', 'J2609 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-02', 'J2609 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-03', 'J2609 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-04', 'J2609 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-05', 'J2609 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-06', 'J2609 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-07', 'J2609 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-08', 'J2609 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-09', 'J2609 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-10', 'J2609 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-11', 'J2609 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-12', 'J2609 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-13', 'J2609 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-14', 'J2609 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-15', 'J2609 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-16', 'J2609 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-17', 'J2609 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-18', 'J2609 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-19', 'J2609 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-20', 'J2609 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-21', 'J2609 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-22', 'J2609 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-23', 'J2609 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-24', 'J2609 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-25', 'J2609 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-26', 'J2609 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-27', 'J2609 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-28', 'J2609 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-29', 'J2609 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-30', 'J2609 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-31', 'J2609 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-32', 'J2609 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-33', 'J2609 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-34', 'J2609 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-35', 'J2609 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-36', 'J2609 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-37', 'J2609 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-38', 'J2609 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-39', 'J2609 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-40', 'J2609 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-41', 'J2609 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-42', 'J2609 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-43', 'J2609 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-44', 'J2609 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2609', (SELECT id FROM wiki_pages WHERE slug = 'j2609'), 'j2609-45', 'J2609 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j26'), 'j2610', 'J2610 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2610 班

本页为 J2610 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2610';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2610')), updated_at = datetime('now') WHERE slug = 'j2610';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-01', 'J2610 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-02', 'J2610 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-03', 'J2610 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-04', 'J2610 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-05', 'J2610 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-06', 'J2610 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-07', 'J2610 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-08', 'J2610 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-09', 'J2610 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-10', 'J2610 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-11', 'J2610 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-12', 'J2610 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-13', 'J2610 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-14', 'J2610 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-15', 'J2610 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-16', 'J2610 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-17', 'J2610 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-18', 'J2610 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-19', 'J2610 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-20', 'J2610 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-21', 'J2610 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-22', 'J2610 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-23', 'J2610 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-24', 'J2610 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-25', 'J2610 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-26', 'J2610 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-27', 'J2610 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-28', 'J2610 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-29', 'J2610 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-30', 'J2610 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-31', 'J2610 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-32', 'J2610 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-33', 'J2610 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-34', 'J2610 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-35', 'J2610 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-36', 'J2610 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-37', 'J2610 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-38', 'J2610 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-39', 'J2610 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-40', 'J2610 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-41', 'J2610 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-42', 'J2610 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-43', 'J2610 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-44', 'J2610 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J26', 'J2610', (SELECT id FROM wiki_pages WHERE slug = 'j2610'), 'j2610-45', 'J2610 · 45 号');
