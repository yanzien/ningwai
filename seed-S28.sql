-- S28 级 seed
INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', 'S28', 's28', 'S28 级');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, '# S28 级

本页为 S28 级总览页，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = 's28';
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's28')), updated_at = datetime('now') WHERE slug = 's28';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2801', 'S2801 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2801 班

本页为 S2801 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2801';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2801')), updated_at = datetime('now') WHERE slug = 's2801';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-01', 'S2801 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-02', 'S2801 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-03', 'S2801 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-04', 'S2801 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-05', 'S2801 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-06', 'S2801 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-07', 'S2801 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-08', 'S2801 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-09', 'S2801 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-10', 'S2801 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-11', 'S2801 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-12', 'S2801 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-13', 'S2801 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-14', 'S2801 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-15', 'S2801 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-16', 'S2801 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-17', 'S2801 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-18', 'S2801 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-19', 'S2801 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-20', 'S2801 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-21', 'S2801 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-22', 'S2801 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-23', 'S2801 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-24', 'S2801 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-25', 'S2801 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-26', 'S2801 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-27', 'S2801 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-28', 'S2801 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-29', 'S2801 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-30', 'S2801 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-31', 'S2801 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-32', 'S2801 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-33', 'S2801 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-34', 'S2801 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-35', 'S2801 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-36', 'S2801 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-37', 'S2801 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-38', 'S2801 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-39', 'S2801 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-40', 'S2801 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-41', 'S2801 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-42', 'S2801 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-43', 'S2801 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-44', 'S2801 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2801', (SELECT id FROM wiki_pages WHERE slug = 's2801'), 's2801-45', 'S2801 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2802', 'S2802 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2802 班

本页为 S2802 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2802';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2802')), updated_at = datetime('now') WHERE slug = 's2802';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-01', 'S2802 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-02', 'S2802 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-03', 'S2802 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-04', 'S2802 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-05', 'S2802 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-06', 'S2802 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-07', 'S2802 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-08', 'S2802 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-09', 'S2802 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-10', 'S2802 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-11', 'S2802 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-12', 'S2802 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-13', 'S2802 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-14', 'S2802 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-15', 'S2802 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-16', 'S2802 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-17', 'S2802 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-18', 'S2802 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-19', 'S2802 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-20', 'S2802 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-21', 'S2802 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-22', 'S2802 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-23', 'S2802 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-24', 'S2802 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-25', 'S2802 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-26', 'S2802 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-27', 'S2802 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-28', 'S2802 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-29', 'S2802 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-30', 'S2802 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-31', 'S2802 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-32', 'S2802 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-33', 'S2802 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-34', 'S2802 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-35', 'S2802 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-36', 'S2802 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-37', 'S2802 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-38', 'S2802 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-39', 'S2802 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-40', 'S2802 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-41', 'S2802 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-42', 'S2802 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-43', 'S2802 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-44', 'S2802 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2802', (SELECT id FROM wiki_pages WHERE slug = 's2802'), 's2802-45', 'S2802 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2803', 'S2803 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2803 班

本页为 S2803 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2803';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2803')), updated_at = datetime('now') WHERE slug = 's2803';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-01', 'S2803 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-02', 'S2803 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-03', 'S2803 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-04', 'S2803 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-05', 'S2803 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-06', 'S2803 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-07', 'S2803 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-08', 'S2803 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-09', 'S2803 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-10', 'S2803 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-11', 'S2803 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-12', 'S2803 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-13', 'S2803 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-14', 'S2803 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-15', 'S2803 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-16', 'S2803 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-17', 'S2803 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-18', 'S2803 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-19', 'S2803 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-20', 'S2803 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-21', 'S2803 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-22', 'S2803 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-23', 'S2803 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-24', 'S2803 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-25', 'S2803 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-26', 'S2803 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-27', 'S2803 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-28', 'S2803 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-29', 'S2803 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-30', 'S2803 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-31', 'S2803 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-32', 'S2803 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-33', 'S2803 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-34', 'S2803 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-35', 'S2803 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-36', 'S2803 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-37', 'S2803 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-38', 'S2803 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-39', 'S2803 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-40', 'S2803 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-41', 'S2803 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-42', 'S2803 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-43', 'S2803 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-44', 'S2803 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2803', (SELECT id FROM wiki_pages WHERE slug = 's2803'), 's2803-45', 'S2803 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2804', 'S2804 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2804 班

本页为 S2804 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2804';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2804')), updated_at = datetime('now') WHERE slug = 's2804';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-01', 'S2804 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-02', 'S2804 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-03', 'S2804 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-04', 'S2804 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-05', 'S2804 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-06', 'S2804 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-07', 'S2804 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-08', 'S2804 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-09', 'S2804 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-10', 'S2804 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-11', 'S2804 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-12', 'S2804 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-13', 'S2804 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-14', 'S2804 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-15', 'S2804 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-16', 'S2804 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-17', 'S2804 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-18', 'S2804 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-19', 'S2804 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-20', 'S2804 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-21', 'S2804 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-22', 'S2804 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-23', 'S2804 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-24', 'S2804 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-25', 'S2804 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-26', 'S2804 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-27', 'S2804 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-28', 'S2804 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-29', 'S2804 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-30', 'S2804 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-31', 'S2804 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-32', 'S2804 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-33', 'S2804 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-34', 'S2804 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-35', 'S2804 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-36', 'S2804 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-37', 'S2804 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-38', 'S2804 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-39', 'S2804 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-40', 'S2804 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-41', 'S2804 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-42', 'S2804 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-43', 'S2804 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-44', 'S2804 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2804', (SELECT id FROM wiki_pages WHERE slug = 's2804'), 's2804-45', 'S2804 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2805', 'S2805 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2805 班

本页为 S2805 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2805';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2805')), updated_at = datetime('now') WHERE slug = 's2805';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-01', 'S2805 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-02', 'S2805 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-03', 'S2805 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-04', 'S2805 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-05', 'S2805 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-06', 'S2805 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-07', 'S2805 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-08', 'S2805 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-09', 'S2805 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-10', 'S2805 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-11', 'S2805 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-12', 'S2805 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-13', 'S2805 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-14', 'S2805 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-15', 'S2805 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-16', 'S2805 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-17', 'S2805 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-18', 'S2805 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-19', 'S2805 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-20', 'S2805 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-21', 'S2805 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-22', 'S2805 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-23', 'S2805 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-24', 'S2805 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-25', 'S2805 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-26', 'S2805 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-27', 'S2805 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-28', 'S2805 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-29', 'S2805 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-30', 'S2805 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-31', 'S2805 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-32', 'S2805 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-33', 'S2805 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-34', 'S2805 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-35', 'S2805 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-36', 'S2805 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-37', 'S2805 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-38', 'S2805 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-39', 'S2805 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-40', 'S2805 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-41', 'S2805 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-42', 'S2805 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-43', 'S2805 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-44', 'S2805 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2805', (SELECT id FROM wiki_pages WHERE slug = 's2805'), 's2805-45', 'S2805 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2806', 'S2806 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2806 班

本页为 S2806 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2806';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2806')), updated_at = datetime('now') WHERE slug = 's2806';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-01', 'S2806 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-02', 'S2806 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-03', 'S2806 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-04', 'S2806 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-05', 'S2806 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-06', 'S2806 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-07', 'S2806 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-08', 'S2806 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-09', 'S2806 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-10', 'S2806 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-11', 'S2806 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-12', 'S2806 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-13', 'S2806 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-14', 'S2806 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-15', 'S2806 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-16', 'S2806 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-17', 'S2806 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-18', 'S2806 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-19', 'S2806 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-20', 'S2806 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-21', 'S2806 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-22', 'S2806 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-23', 'S2806 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-24', 'S2806 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-25', 'S2806 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-26', 'S2806 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-27', 'S2806 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-28', 'S2806 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-29', 'S2806 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-30', 'S2806 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-31', 'S2806 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-32', 'S2806 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-33', 'S2806 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-34', 'S2806 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-35', 'S2806 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-36', 'S2806 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-37', 'S2806 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-38', 'S2806 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-39', 'S2806 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-40', 'S2806 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-41', 'S2806 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-42', 'S2806 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-43', 'S2806 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-44', 'S2806 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2806', (SELECT id FROM wiki_pages WHERE slug = 's2806'), 's2806-45', 'S2806 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2807', 'S2807 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2807 班

本页为 S2807 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2807';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2807')), updated_at = datetime('now') WHERE slug = 's2807';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-01', 'S2807 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-02', 'S2807 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-03', 'S2807 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-04', 'S2807 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-05', 'S2807 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-06', 'S2807 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-07', 'S2807 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-08', 'S2807 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-09', 'S2807 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-10', 'S2807 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-11', 'S2807 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-12', 'S2807 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-13', 'S2807 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-14', 'S2807 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-15', 'S2807 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-16', 'S2807 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-17', 'S2807 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-18', 'S2807 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-19', 'S2807 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-20', 'S2807 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-21', 'S2807 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-22', 'S2807 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-23', 'S2807 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-24', 'S2807 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-25', 'S2807 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-26', 'S2807 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-27', 'S2807 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-28', 'S2807 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-29', 'S2807 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-30', 'S2807 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-31', 'S2807 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-32', 'S2807 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-33', 'S2807 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-34', 'S2807 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-35', 'S2807 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-36', 'S2807 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-37', 'S2807 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-38', 'S2807 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-39', 'S2807 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-40', 'S2807 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-41', 'S2807 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-42', 'S2807 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-43', 'S2807 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-44', 'S2807 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2807', (SELECT id FROM wiki_pages WHERE slug = 's2807'), 's2807-45', 'S2807 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2808', 'S2808 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2808 班

本页为 S2808 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2808';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2808')), updated_at = datetime('now') WHERE slug = 's2808';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-01', 'S2808 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-02', 'S2808 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-03', 'S2808 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-04', 'S2808 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-05', 'S2808 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-06', 'S2808 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-07', 'S2808 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-08', 'S2808 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-09', 'S2808 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-10', 'S2808 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-11', 'S2808 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-12', 'S2808 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-13', 'S2808 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-14', 'S2808 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-15', 'S2808 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-16', 'S2808 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-17', 'S2808 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-18', 'S2808 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-19', 'S2808 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-20', 'S2808 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-21', 'S2808 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-22', 'S2808 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-23', 'S2808 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-24', 'S2808 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-25', 'S2808 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-26', 'S2808 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-27', 'S2808 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-28', 'S2808 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-29', 'S2808 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-30', 'S2808 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-31', 'S2808 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-32', 'S2808 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-33', 'S2808 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-34', 'S2808 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-35', 'S2808 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-36', 'S2808 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-37', 'S2808 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-38', 'S2808 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-39', 'S2808 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-40', 'S2808 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-41', 'S2808 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-42', 'S2808 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-43', 'S2808 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-44', 'S2808 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2808', (SELECT id FROM wiki_pages WHERE slug = 's2808'), 's2808-45', 'S2808 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2809', 'S2809 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2809 班

本页为 S2809 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2809';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2809')), updated_at = datetime('now') WHERE slug = 's2809';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-01', 'S2809 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-02', 'S2809 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-03', 'S2809 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-04', 'S2809 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-05', 'S2809 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-06', 'S2809 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-07', 'S2809 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-08', 'S2809 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-09', 'S2809 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-10', 'S2809 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-11', 'S2809 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-12', 'S2809 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-13', 'S2809 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-14', 'S2809 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-15', 'S2809 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-16', 'S2809 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-17', 'S2809 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-18', 'S2809 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-19', 'S2809 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-20', 'S2809 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-21', 'S2809 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-22', 'S2809 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-23', 'S2809 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-24', 'S2809 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-25', 'S2809 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-26', 'S2809 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-27', 'S2809 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-28', 'S2809 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-29', 'S2809 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-30', 'S2809 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-31', 'S2809 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-32', 'S2809 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-33', 'S2809 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-34', 'S2809 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-35', 'S2809 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-36', 'S2809 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-37', 'S2809 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-38', 'S2809 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-39', 'S2809 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-40', 'S2809 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-41', 'S2809 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-42', 'S2809 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-43', 'S2809 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-44', 'S2809 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2809', (SELECT id FROM wiki_pages WHERE slug = 's2809'), 's2809-45', 'S2809 · 45 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's28'), 's2810', 'S2810 班');
INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, '# S2810 班

本页为 S2810 班页面，等待大家共同完善。', '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = 's2810';
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = 's2810')), updated_at = datetime('now') WHERE slug = 's2810';
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-01', 'S2810 · 01 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-02', 'S2810 · 02 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-03', 'S2810 · 03 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-04', 'S2810 · 04 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-05', 'S2810 · 05 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-06', 'S2810 · 06 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-07', 'S2810 · 07 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-08', 'S2810 · 08 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-09', 'S2810 · 09 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-10', 'S2810 · 10 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-11', 'S2810 · 11 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-12', 'S2810 · 12 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-13', 'S2810 · 13 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-14', 'S2810 · 14 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-15', 'S2810 · 15 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-16', 'S2810 · 16 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-17', 'S2810 · 17 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-18', 'S2810 · 18 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-19', 'S2810 · 19 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-20', 'S2810 · 20 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-21', 'S2810 · 21 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-22', 'S2810 · 22 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-23', 'S2810 · 23 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-24', 'S2810 · 24 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-25', 'S2810 · 25 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-26', 'S2810 · 26 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-27', 'S2810 · 27 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-28', 'S2810 · 28 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-29', 'S2810 · 29 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-30', 'S2810 · 30 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-31', 'S2810 · 31 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-32', 'S2810 · 32 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-33', 'S2810 · 33 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-34', 'S2810 · 34 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-35', 'S2810 · 35 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-36', 'S2810 · 36 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-37', 'S2810 · 37 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-38', 'S2810 · 38 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-39', 'S2810 · 39 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-40', 'S2810 · 40 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-41', 'S2810 · 41 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-42', 'S2810 · 42 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-43', 'S2810 · 43 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-44', 'S2810 · 44 号');
INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', 'S28', 'S2810', (SELECT id FROM wiki_pages WHERE slug = 's2810'), 's2810-45', 'S2810 · 45 号');
