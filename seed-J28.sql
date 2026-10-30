-- J28 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'J28', 'j28', 'J28 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# J28 级

本页为 J28 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 'j28';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j28')), updated_at = datetime('now') WHERE slug = 'j28';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2801', 'J2801 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2801 班

本页为 J2801 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2801';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2801')), updated_at = datetime('now') WHERE slug = 'j2801';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-01', 'J2801 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-02', 'J2801 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-03', 'J2801 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-04', 'J2801 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-05', 'J2801 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-06', 'J2801 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-07', 'J2801 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-08', 'J2801 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-09', 'J2801 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-10', 'J2801 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-11', 'J2801 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-12', 'J2801 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-13', 'J2801 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-14', 'J2801 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-15', 'J2801 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-16', 'J2801 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-17', 'J2801 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-18', 'J2801 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-19', 'J2801 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-20', 'J2801 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-21', 'J2801 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-22', 'J2801 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-23', 'J2801 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-24', 'J2801 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-25', 'J2801 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-26', 'J2801 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-27', 'J2801 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-28', 'J2801 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-29', 'J2801 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-30', 'J2801 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-31', 'J2801 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-32', 'J2801 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-33', 'J2801 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-34', 'J2801 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-35', 'J2801 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-36', 'J2801 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-37', 'J2801 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-38', 'J2801 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-39', 'J2801 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-40', 'J2801 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-41', 'J2801 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-42', 'J2801 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-43', 'J2801 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-44', 'J2801 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2801', (SELECT id FROM wiki_pages WHERE slug = 'j2801'), 'j2801-45', 'J2801 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2802', 'J2802 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2802 班

本页为 J2802 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2802';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2802')), updated_at = datetime('now') WHERE slug = 'j2802';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-01', 'J2802 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-02', 'J2802 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-03', 'J2802 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-04', 'J2802 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-05', 'J2802 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-06', 'J2802 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-07', 'J2802 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-08', 'J2802 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-09', 'J2802 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-10', 'J2802 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-11', 'J2802 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-12', 'J2802 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-13', 'J2802 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-14', 'J2802 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-15', 'J2802 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-16', 'J2802 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-17', 'J2802 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-18', 'J2802 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-19', 'J2802 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-20', 'J2802 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-21', 'J2802 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-22', 'J2802 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-23', 'J2802 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-24', 'J2802 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-25', 'J2802 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-26', 'J2802 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-27', 'J2802 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-28', 'J2802 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-29', 'J2802 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-30', 'J2802 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-31', 'J2802 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-32', 'J2802 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-33', 'J2802 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-34', 'J2802 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-35', 'J2802 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-36', 'J2802 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-37', 'J2802 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-38', 'J2802 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-39', 'J2802 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-40', 'J2802 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-41', 'J2802 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-42', 'J2802 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-43', 'J2802 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-44', 'J2802 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2802', (SELECT id FROM wiki_pages WHERE slug = 'j2802'), 'j2802-45', 'J2802 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2803', 'J2803 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2803 班

本页为 J2803 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2803';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2803')), updated_at = datetime('now') WHERE slug = 'j2803';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-01', 'J2803 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-02', 'J2803 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-03', 'J2803 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-04', 'J2803 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-05', 'J2803 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-06', 'J2803 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-07', 'J2803 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-08', 'J2803 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-09', 'J2803 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-10', 'J2803 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-11', 'J2803 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-12', 'J2803 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-13', 'J2803 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-14', 'J2803 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-15', 'J2803 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-16', 'J2803 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-17', 'J2803 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-18', 'J2803 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-19', 'J2803 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-20', 'J2803 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-21', 'J2803 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-22', 'J2803 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-23', 'J2803 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-24', 'J2803 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-25', 'J2803 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-26', 'J2803 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-27', 'J2803 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-28', 'J2803 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-29', 'J2803 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-30', 'J2803 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-31', 'J2803 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-32', 'J2803 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-33', 'J2803 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-34', 'J2803 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-35', 'J2803 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-36', 'J2803 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-37', 'J2803 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-38', 'J2803 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-39', 'J2803 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-40', 'J2803 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-41', 'J2803 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-42', 'J2803 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-43', 'J2803 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-44', 'J2803 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2803', (SELECT id FROM wiki_pages WHERE slug = 'j2803'), 'j2803-45', 'J2803 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2804', 'J2804 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2804 班

本页为 J2804 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2804';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2804')), updated_at = datetime('now') WHERE slug = 'j2804';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-01', 'J2804 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-02', 'J2804 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-03', 'J2804 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-04', 'J2804 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-05', 'J2804 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-06', 'J2804 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-07', 'J2804 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-08', 'J2804 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-09', 'J2804 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-10', 'J2804 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-11', 'J2804 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-12', 'J2804 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-13', 'J2804 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-14', 'J2804 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-15', 'J2804 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-16', 'J2804 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-17', 'J2804 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-18', 'J2804 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-19', 'J2804 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-20', 'J2804 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-21', 'J2804 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-22', 'J2804 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-23', 'J2804 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-24', 'J2804 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-25', 'J2804 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-26', 'J2804 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-27', 'J2804 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-28', 'J2804 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-29', 'J2804 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-30', 'J2804 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-31', 'J2804 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-32', 'J2804 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-33', 'J2804 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-34', 'J2804 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-35', 'J2804 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-36', 'J2804 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-37', 'J2804 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-38', 'J2804 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-39', 'J2804 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-40', 'J2804 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-41', 'J2804 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-42', 'J2804 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-43', 'J2804 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-44', 'J2804 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2804', (SELECT id FROM wiki_pages WHERE slug = 'j2804'), 'j2804-45', 'J2804 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2805', 'J2805 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2805 班

本页为 J2805 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2805';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2805')), updated_at = datetime('now') WHERE slug = 'j2805';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-01', 'J2805 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-02', 'J2805 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-03', 'J2805 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-04', 'J2805 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-05', 'J2805 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-06', 'J2805 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-07', 'J2805 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-08', 'J2805 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-09', 'J2805 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-10', 'J2805 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-11', 'J2805 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-12', 'J2805 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-13', 'J2805 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-14', 'J2805 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-15', 'J2805 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-16', 'J2805 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-17', 'J2805 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-18', 'J2805 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-19', 'J2805 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-20', 'J2805 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-21', 'J2805 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-22', 'J2805 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-23', 'J2805 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-24', 'J2805 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-25', 'J2805 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-26', 'J2805 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-27', 'J2805 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-28', 'J2805 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-29', 'J2805 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-30', 'J2805 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-31', 'J2805 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-32', 'J2805 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-33', 'J2805 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-34', 'J2805 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-35', 'J2805 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-36', 'J2805 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-37', 'J2805 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-38', 'J2805 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-39', 'J2805 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-40', 'J2805 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-41', 'J2805 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-42', 'J2805 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-43', 'J2805 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-44', 'J2805 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2805', (SELECT id FROM wiki_pages WHERE slug = 'j2805'), 'j2805-45', 'J2805 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2806', 'J2806 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2806 班

本页为 J2806 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2806';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2806')), updated_at = datetime('now') WHERE slug = 'j2806';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-01', 'J2806 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-02', 'J2806 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-03', 'J2806 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-04', 'J2806 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-05', 'J2806 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-06', 'J2806 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-07', 'J2806 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-08', 'J2806 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-09', 'J2806 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-10', 'J2806 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-11', 'J2806 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-12', 'J2806 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-13', 'J2806 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-14', 'J2806 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-15', 'J2806 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-16', 'J2806 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-17', 'J2806 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-18', 'J2806 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-19', 'J2806 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-20', 'J2806 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-21', 'J2806 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-22', 'J2806 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-23', 'J2806 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-24', 'J2806 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-25', 'J2806 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-26', 'J2806 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-27', 'J2806 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-28', 'J2806 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-29', 'J2806 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-30', 'J2806 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-31', 'J2806 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-32', 'J2806 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-33', 'J2806 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-34', 'J2806 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-35', 'J2806 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-36', 'J2806 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-37', 'J2806 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-38', 'J2806 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-39', 'J2806 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-40', 'J2806 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-41', 'J2806 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-42', 'J2806 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-43', 'J2806 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-44', 'J2806 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2806', (SELECT id FROM wiki_pages WHERE slug = 'j2806'), 'j2806-45', 'J2806 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2807', 'J2807 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2807 班

本页为 J2807 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2807';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2807')), updated_at = datetime('now') WHERE slug = 'j2807';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-01', 'J2807 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-02', 'J2807 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-03', 'J2807 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-04', 'J2807 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-05', 'J2807 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-06', 'J2807 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-07', 'J2807 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-08', 'J2807 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-09', 'J2807 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-10', 'J2807 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-11', 'J2807 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-12', 'J2807 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-13', 'J2807 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-14', 'J2807 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-15', 'J2807 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-16', 'J2807 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-17', 'J2807 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-18', 'J2807 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-19', 'J2807 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-20', 'J2807 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-21', 'J2807 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-22', 'J2807 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-23', 'J2807 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-24', 'J2807 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-25', 'J2807 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-26', 'J2807 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-27', 'J2807 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-28', 'J2807 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-29', 'J2807 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-30', 'J2807 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-31', 'J2807 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-32', 'J2807 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-33', 'J2807 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-34', 'J2807 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-35', 'J2807 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-36', 'J2807 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-37', 'J2807 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-38', 'J2807 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-39', 'J2807 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-40', 'J2807 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-41', 'J2807 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-42', 'J2807 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-43', 'J2807 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-44', 'J2807 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2807', (SELECT id FROM wiki_pages WHERE slug = 'j2807'), 'j2807-45', 'J2807 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2808', 'J2808 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2808 班

本页为 J2808 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2808';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2808')), updated_at = datetime('now') WHERE slug = 'j2808';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-01', 'J2808 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-02', 'J2808 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-03', 'J2808 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-04', 'J2808 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-05', 'J2808 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-06', 'J2808 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-07', 'J2808 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-08', 'J2808 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-09', 'J2808 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-10', 'J2808 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-11', 'J2808 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-12', 'J2808 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-13', 'J2808 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-14', 'J2808 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-15', 'J2808 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-16', 'J2808 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-17', 'J2808 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-18', 'J2808 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-19', 'J2808 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-20', 'J2808 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-21', 'J2808 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-22', 'J2808 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-23', 'J2808 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-24', 'J2808 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-25', 'J2808 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-26', 'J2808 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-27', 'J2808 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-28', 'J2808 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-29', 'J2808 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-30', 'J2808 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-31', 'J2808 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-32', 'J2808 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-33', 'J2808 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-34', 'J2808 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-35', 'J2808 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-36', 'J2808 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-37', 'J2808 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-38', 'J2808 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-39', 'J2808 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-40', 'J2808 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-41', 'J2808 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-42', 'J2808 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-43', 'J2808 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-44', 'J2808 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2808', (SELECT id FROM wiki_pages WHERE slug = 'j2808'), 'j2808-45', 'J2808 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2809', 'J2809 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2809 班

本页为 J2809 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2809';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2809')), updated_at = datetime('now') WHERE slug = 'j2809';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-01', 'J2809 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-02', 'J2809 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-03', 'J2809 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-04', 'J2809 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-05', 'J2809 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-06', 'J2809 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-07', 'J2809 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-08', 'J2809 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-09', 'J2809 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-10', 'J2809 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-11', 'J2809 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-12', 'J2809 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-13', 'J2809 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-14', 'J2809 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-15', 'J2809 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-16', 'J2809 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-17', 'J2809 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-18', 'J2809 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-19', 'J2809 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-20', 'J2809 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-21', 'J2809 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-22', 'J2809 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-23', 'J2809 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-24', 'J2809 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-25', 'J2809 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-26', 'J2809 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-27', 'J2809 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-28', 'J2809 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-29', 'J2809 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-30', 'J2809 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-31', 'J2809 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-32', 'J2809 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-33', 'J2809 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-34', 'J2809 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-35', 'J2809 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-36', 'J2809 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-37', 'J2809 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-38', 'J2809 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-39', 'J2809 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-40', 'J2809 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-41', 'J2809 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-42', 'J2809 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-43', 'J2809 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-44', 'J2809 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2809', (SELECT id FROM wiki_pages WHERE slug = 'j2809'), 'j2809-45', 'J2809 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j28'), 'j2810', 'J2810 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# J2810 班

本页为 J2810 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 'j2810';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 'j2810')), updated_at = datetime('now') WHERE slug = 'j2810';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-01', 'J2810 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-02', 'J2810 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-03', 'J2810 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-04', 'J2810 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-05', 'J2810 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-06', 'J2810 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-07', 'J2810 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-08', 'J2810 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-09', 'J2810 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-10', 'J2810 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-11', 'J2810 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-12', 'J2810 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-13', 'J2810 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-14', 'J2810 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-15', 'J2810 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-16', 'J2810 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-17', 'J2810 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-18', 'J2810 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-19', 'J2810 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-20', 'J2810 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-21', 'J2810 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-22', 'J2810 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-23', 'J2810 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-24', 'J2810 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-25', 'J2810 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-26', 'J2810 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-27', 'J2810 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-28', 'J2810 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-29', 'J2810 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-30', 'J2810 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-31', 'J2810 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-32', 'J2810 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-33', 'J2810 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-34', 'J2810 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-35', 'J2810 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-36', 'J2810 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-37', 'J2810 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-38', 'J2810 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-39', 'J2810 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-40', 'J2810 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-41', 'J2810 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-42', 'J2810 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-43', 'J2810 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-44', 'J2810 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'J28', 'J2810', (SELECT id FROM wiki_pages WHERE slug = 'j2810'), 'j2810-45', 'J2810 · 45 号');
