-- ===== wiki 文件树迁移（2026-10-16）=====
-- 目标：wiki_pages 支持任意层级文件夹/词条；新增 wiki_files 附件表；
--       存量 grade/class/student/teacher 页挂进树，教师归入「教师档案」文件夹。
-- 幂等：可重复执行（列已存在会报错而终止，属预期，勿重复跑）。

-- 1. 新列（SQLite 不允许 ADD COLUMN 带非常量默认，先给 '' 再回填）
ALTER TABLE wiki_pages ADD COLUMN parent_id INTEGER DEFAULT NULL;
ALTER TABLE wiki_pages ADD COLUMN created_at TEXT NOT NULL DEFAULT '';
UPDATE wiki_pages SET created_at = updated_at WHERE created_at = '' OR created_at IS NULL;

-- 2. 附件表
CREATE TABLE IF NOT EXISTS wiki_files (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  page_id INTEGER NOT NULL,
  filename TEXT NOT NULL,
  mime TEXT NOT NULL DEFAULT '',
  size INTEGER NOT NULL DEFAULT 0,
  data BLOB NOT NULL,
  uploader_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_files_page ON wiki_files(page_id);
CREATE INDEX IF NOT EXISTS idx_pages_parent ON wiki_pages(org_id, parent_id);

-- 3. 「教师档案」根级文件夹
INSERT INTO wiki_pages (org_id, kind, slug, title, parent_id)
SELECT 1, 'folder', 'folder-teachers', '教师档案', NULL
WHERE NOT EXISTS (SELECT 1 FROM wiki_pages WHERE org_id = 1 AND slug = 'folder-teachers');

-- 4. 班级页 → 挂到对应年级页
UPDATE wiki_pages SET parent_id = (
  SELECT g.id FROM wiki_pages g
  WHERE g.org_id = wiki_pages.org_id AND g.kind = 'grade' AND g.grade = wiki_pages.grade
)
WHERE kind = 'class' AND parent_id IS NULL;

-- 5. 学生页 → 挂到对应班级页
UPDATE wiki_pages SET parent_id = (
  SELECT c.id FROM wiki_pages c
  WHERE c.org_id = wiki_pages.org_id AND c.kind = 'class' AND c.class_name = wiki_pages.class_name
)
WHERE kind = 'student' AND parent_id IS NULL;

-- 6. 老师页 → 挂到「教师档案」文件夹
UPDATE wiki_pages SET parent_id = (
  SELECT id FROM wiki_pages WHERE org_id = wiki_pages.org_id AND slug = 'folder-teachers'
)
WHERE kind = 'teacher' AND parent_id IS NULL;

-- 7. 校验（应全部为 0）
-- SELECT COUNT(*) FROM wiki_pages WHERE kind IN ('class','student','teacher') AND parent_id IS NULL;
