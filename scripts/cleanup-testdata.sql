-- 宁外八一 · 冒烟测试数据清理（2026-10-14）
-- 执行前已线上核对：users 表含 testuser1/testuser2；wiki_revisions 含 rev 89（j2804-01 已通过测试内容）、rev 90（j2804-02 已驳回 XSS 测试）

-- 1. 删除测试修订
DELETE FROM wiki_revisions WHERE id IN (89, 90);

-- 2. j2804-01 恢复空页面（seed 初始状态）
UPDATE wiki_pages SET current_rev_id = NULL, updated_at = datetime('now') WHERE id = 602;

-- 3. 删除测试账号及其会话、设备限流记录
DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE username IN ('testuser1', 'testuser2'));
DELETE FROM device_registrations WHERE user_id IN (SELECT id FROM users WHERE username IN ('testuser1', 'testuser2'));
DELETE FROM users WHERE username IN ('testuser1', 'testuser2');
