-- v2.0 D1 读额度优化：索引补全 + 页面计数器（替代 COUNT(*) 全表扫描）
-- 背景：10-23 insights 实测，wiki_pages 相关查询占全库行读 86%（1.28M/1.5M），
-- 根因是缺索引导致全表扫描（3699 行/次）。本迁移一次性成本约 5×3699 行读。

-- 1. slug 单列索引：wiki 详情/面包屑/修订历史的 WHERE slug = ? 全表扫描 → ~1 行
--    （原 UNIQUE(org_id,slug) 复合索引对单 slug 查询不可用）
CREATE INDEX IF NOT EXISTS idx_wiki_pages_slug ON wiki_pages(slug);

-- 2. (org_id, kind) 复合索引：tree 的 org_id = ? AND kind != 'student' → 仅读非学生行（~100）
CREATE INDEX IF NOT EXISTS idx_wiki_pages_org_kind ON wiki_pages(org_id, kind);

-- 3. (org_id, updated_at) 复合索引：/pages 分页 ORDER BY updated_at DESC LIMIT+OFFSET
CREATE INDEX IF NOT EXISTS idx_wiki_pages_org_updated ON wiki_pages(org_id, updated_at);

-- 4. updated_at 单列索引：管理后台「最近更新」ORDER BY updated_at DESC LIMIT 6
CREATE INDEX IF NOT EXISTS idx_wiki_pages_updated ON wiki_pages(updated_at);

-- 5. wiki_revisions status 索引：待审计数与管理队列 WHERE status = 'pending'
CREATE INDEX IF NOT EXISTS idx_wiki_revisions_status ON wiki_revisions(status);

-- 6. 页面计数器：site_settings 冗余计数，替代 COUNT(*) 全表扫描（与论坛 topic_count 同思路）
INSERT INTO site_settings (key, value) VALUES ('wiki_page_count', (SELECT COUNT(*) FROM wiki_pages))
ON CONFLICT(key) DO UPDATE SET value = (SELECT COUNT(*) FROM wiki_pages);

-- 7. 让 planner 看到新索引的统计信息（修复 class_teachers join 选错驱动表）
ANALYZE;
