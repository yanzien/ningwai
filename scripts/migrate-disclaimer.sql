-- 加入说明（免责声明）已读标记：老用户刷新后强制弹窗补签，完成后置 1
-- 注册新用户在 register 路由直接置 1
ALTER TABLE users ADD COLUMN disclaimer_ok INTEGER NOT NULL DEFAULT 0;
