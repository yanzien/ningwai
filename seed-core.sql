-- ============================================================
-- 基础数据（在 database_init.sql 之后执行）
-- 前置条件：已完成注册，且 users 表中第一个账号 id = 1
--   （空库注册的第一个用户 id 必然是 1，档案页作者、审计日志都指向它）
-- 首个账号需要手动提升为站长，见 README「初始化第一个站长」
-- ============================================================

-- 默认公开组织：宁外八一（示例机构，部署时改成自己的学校）
INSERT INTO orgs (id, name, slug, type, join_mode, description, created_by)
VALUES (1, '示例中学', 'demo-school', 'public', 'open', '默认公开组织，所有人可加入', 1);

-- 第一个账号以组织管理员身份加入默认组织
INSERT INTO org_members (org_id, user_id, role, class_name, real_name, student_no, status)
VALUES (1, 1, 'org_admin', '', '', '', 'approved');

-- 教师档案文件夹（老师页统一挂在其下）
INSERT INTO wiki_pages (org_id, kind, slug, title, parent_id)
VALUES (1, 'folder', 'folder-teachers', '教师档案', NULL);

-- 站点设置：owner_user_id 即本站创始人，唯一有权任免网站管理员、且不可被封禁
INSERT INTO site_settings (key, value) VALUES ('site_name', '示例中学')
  ON CONFLICT(key) DO UPDATE SET value = excluded.value;
INSERT INTO site_settings (key, value) VALUES ('announcement', '')
  ON CONFLICT(key) DO NOTHING;
INSERT INTO site_settings (key, value) VALUES ('owner_user_id', '1')
  ON CONFLICT(key) DO UPDATE SET value = excluded.value;

INSERT INTO audit_logs (actor_id, action, target_type, target_id, detail)
VALUES (1, 'seed', 'system', 0, 'initial');
