-- v1.7.1：mid_blur 语义迁移（背景模糊px → 卡片透明度%）
-- 旧值 3 / "standard" / "light" 一律归一为 100（不透明），并补 mid_img_blur=0
UPDATE themes SET config = json_set(config, '$.mid_blur', 100) WHERE json_extract(config, '$.mid_blur') IS NOT NULL AND json_extract(config, '$.mid_blur') != 100;
UPDATE themes SET config = json_set(config, '$.mid_img_blur', 0) WHERE json_extract(config, '$.mid_img_blur') IS NULL;
