// 生成 seed SQL：yanzie 账号 + 默认组织 + 8 年级 × 10 班 × 45 学号
// 用法: node scripts/gen-seed.mjs  （在 ningwai/ 下执行）
// 产出: seed-core.sql + seed-<grade>.sql ×8，用 wrangler d1 execute 逐个执行
import { pbkdf2Sync, randomBytes, createHash } from 'node:crypto';
import { writeFileSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const GRADES = ['J29', 'J28', 'J27', 'J26', 'S29', 'S28', 'S27', 'S26'];
const CLASSES = 10;
const STUDENTS = 45;
const PASSWORD = '123456';

function b64(buf) { return Buffer.from(buf).toString('base64'); }

// PBKDF2-SHA256 100k 次 + 16 字节盐（与 Workers WebCrypto 实现互通）
const salt = randomBytes(16);
const hash = pbkdf2Sync(PASSWORD, salt, 100000, 32, 'sha256');

function q(s) { return `'${String(s).replace(/'/g, "''")}'`; }

// ===== 核心 seed：管理员账号 + 默认组织 =====
const core = `
-- 初始网站管理员：yanzie / 123456（首次登录强制改密）
INSERT INTO users (id, username, pass_hash, salt, display_name, role, must_change_pw)
VALUES (1, 'yanzie', ${q(b64(hash))}, ${q(b64(salt))}, 'yanzie', 'website_admin', 1);

-- 默认公开组织：宁波外国语学校浙江省八一学校
INSERT INTO orgs (id, name, slug, type, join_mode, description, created_by)
VALUES (1, '宁波外国语学校浙江省八一学校', 'ningwai-bayi', 'public', 'open', '宁外八一校园社区默认组织', 1);

-- yanzie 以组织管理员身份加入默认组织
INSERT INTO org_members (org_id, user_id, role, class_name, real_name, student_no, status)
VALUES (1, 1, 'org_admin', '', 'yanzie', '', 'approved');

-- 教师档案文件夹（老师页统一挂在其下）
INSERT INTO wiki_pages (org_id, kind, slug, title, parent_id)
VALUES (1, 'folder', 'folder-teachers', '教师档案', NULL);

INSERT INTO site_settings (key, value) VALUES ('site_name', '宁外八一');
INSERT INTO site_settings (key, value) VALUES ('announcement', '');
INSERT INTO audit_logs (actor_id, action, target_type, target_id, detail) VALUES (1, 'seed', 'system', 0, 'initial');
`;
writeFileSync(resolve(root, 'seed-core.sql'), core.trimStart());
console.log('✓ seed-core.sql');

// ===== 每个年级一个文件：年级页 + 10 班 + 45 学生 + 年级/班初始修订 =====
for (const grade of GRADES) {
  const lines = ['-- ' + grade + ' 级 seed'];
  const push = (sql) => lines.push(sql);

  // 年级页
  push(`INSERT INTO wiki_pages (org_id, kind, grade, slug, title) VALUES (1, 'grade', ${q(grade)}, ${q(grade.toLowerCase())}, ${q(grade + ' 级')});`);
  push(`INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
        SELECT id, 1, ${q(`# ${grade} 级\n\n本页为 ${grade} 级总览页，等待大家共同完善。`)}, '初始化', 'approved', 1, datetime('now')
        FROM wiki_pages WHERE slug = ${q(grade.toLowerCase())};
        UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = ${q(grade.toLowerCase())})), updated_at = datetime('now') WHERE slug = ${q(grade.toLowerCase())};`);

  for (let c = 1; c <= CLASSES; c++) {
    const cls = `${grade}${String(c).padStart(2, '0')}`;
    // 班级页（parent = 年级页）
    push(`INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
          VALUES (1, 'class', ${q(grade)}, ${q(cls)}, (SELECT id FROM wiki_pages WHERE slug = ${q(grade.toLowerCase())}), ${q(cls.toLowerCase())}, ${q(cls + ' 班')});`);
    push(`INSERT INTO wiki_revisions (page_id, author_id, content, message, status, reviewer_id, reviewed_at)
          SELECT id, 1, ${q(`# ${cls} 班\n\n本页为 ${cls} 班页面，等待大家共同完善。`)}, '初始化', 'approved', 1, datetime('now')
          FROM wiki_pages WHERE slug = ${q(cls.toLowerCase())};
          UPDATE wiki_pages SET current_rev_id = (SELECT MAX(id) FROM wiki_revisions WHERE page_id = (SELECT id FROM wiki_pages WHERE slug = ${q(cls.toLowerCase())})), updated_at = datetime('now') WHERE slug = ${q(cls.toLowerCase())};`);
    // 学生页（parent = 班级页）
    for (let s = 1; s <= STUDENTS; s++) {
      const no = String(s).padStart(2, '0');
      push(`INSERT INTO wiki_pages (org_id, kind, grade, class_name, parent_id, slug, title)
            VALUES (1, 'student', ${q(grade)}, ${q(cls)}, (SELECT id FROM wiki_pages WHERE slug = ${q(cls.toLowerCase())}), ${q(cls.toLowerCase() + '-' + no)}, ${q(cls + ' · ' + no + ' 号')});`);
    }
  }
  writeFileSync(resolve(root, `seed-${grade}.sql`), lines.join('\n') + '\n');
  console.log(`✓ seed-${grade}.sql（${lines.length - 1} 条）`);
}
console.log('seed 生成完毕');
