-- ===== 主题系统：用户自定义主题 + 分享 =====
CREATE TABLE IF NOT EXISTS themes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  config TEXT NOT NULL,                 -- JSON：导航色/背景/中景图等
  share_code TEXT UNIQUE,               -- 分享码（公开后生成）
  shared INTEGER NOT NULL DEFAULT 0,    -- 是否公开到主题商店
  use_count INTEGER NOT NULL DEFAULT 0, -- 被他人采用次数
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_themes_user ON themes(user_id);
CREATE INDEX IF NOT EXISTS idx_themes_shared ON themes(shared, use_count);

-- 用户当前应用的主题（NULL = 默认宁外主题）
ALTER TABLE users ADD COLUMN active_theme_id INTEGER;

-- 主题商店预置：站长的「宁外专属」主题（与前端默认主题一致，供一键采用）
INSERT OR IGNORE INTO themes (id, user_id, name, config, shared, use_count)
VALUES (1, 1, '宁外专属',
  '{"nav_bg":"#1e3a5f","nav_text":"#f3ecd8","logo_color":"color","bg":"#f5f1e6","mid":"#e7dfc9","gradient_angle":180,"primary":"#9e1b1b","accent":"#c9a227","mid_image":"/anniv/wx-06.jpg","mid_repeat":"no-repeat","mid_size":"cover","mid_x":50,"mid_y":100,"mid_brightness":55,"mid_blur":"standard","mid_scroll":"fullscreen"}',
  1, 0);
