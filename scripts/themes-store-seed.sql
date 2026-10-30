-- ===== 主题商店上架：yanzie 的分享主题（2026-10-23）=====

-- 预置主题补一个分享码，方便转发
UPDATE themes SET share_code = 'NINGWAI' WHERE id = 1 AND share_code IS NULL;

-- 1. 宁外校徽校训·超牛动图（浅蓝导航 + 白底 + 纵向重复校训动图，参考洛谷同款配置）
INSERT INTO themes (user_id, name, config, shared, share_code, use_count) VALUES
(1, '宁外校徽校训·超牛动图',
 '{"nav_bg":"#4a90d9","nav_text":"#101820","logo_color":"color","bg":"#ffffff","mid":"#2456a6","gradient_angle":0,"primary":"#9e1b1b","accent":"#c9a227","mid_image":"https://cdn.luogu.com.cn/upload/image_hosting/5u38gg87.webp","mid_repeat":"repeat-y","mid_size":"contain","mid_x":0,"mid_y":0,"mid_brightness":100,"mid_blur":3,"mid_scroll":"fullscreen"}',
 1, 'BAYI35', 0);

-- 2. 宁外校园·浩汇湖（默认冷色 + 校园实景中景图）
INSERT INTO themes (user_id, name, config, shared, share_code, use_count) VALUES
(1, '宁外校园 · 浩汇湖',
 '{"nav_bg":"#1e3a5f","nav_text":"#e9c959","logo_color":"color","bg":"#edf2f8","mid":"#d6e2ef","gradient_angle":180,"primary":"#9e1b1b","accent":"#c9a227","mid_image":"/anniv/wx-06.jpg","mid_repeat":"no-repeat","mid_size":"cover","mid_x":50,"mid_y":100,"mid_brightness":35,"mid_blur":3,"mid_scroll":"fullscreen"}',
 1, 'HAIHUI', 0);

-- 3. 宁外校园·共适馆书海
INSERT INTO themes (user_id, name, config, shared, share_code, use_count) VALUES
(1, '宁外校园 · 共适馆书海',
 '{"nav_bg":"#1e3a5f","nav_text":"#e9c959","logo_color":"color","bg":"#edf2f8","mid":"#d6e2ef","gradient_angle":180,"primary":"#9e1b1b","accent":"#c9a227","mid_image":"/anniv/wx-31.jpg","mid_repeat":"no-repeat","mid_size":"cover","mid_x":50,"mid_y":100,"mid_brightness":40,"mid_blur":3,"mid_scroll":"fullscreen"}',
 1, 'SHUHAI', 0);
