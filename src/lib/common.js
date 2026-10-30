// 公共工具：密码哈希、会话、审计、校验（宁外八一）
const enc = new TextEncoder();

// ===== 组织档案库权限（orgs.wiki_perm，控制普通用户能做什么）=====
export const WIKI_PERMS = {
  all: '所有（可新建、编辑免审、可建文件夹）',
  create_edit: '可新建、编辑免审',
  create_edit_review: '可新建、编辑需审核',
  all_review: '全部需审核',
};
export const DEFAULT_WIKI_PERM = 'create_edit_review';

export const GRADES = ['J29', 'J28', 'J27', 'J26', 'S29', 'S28', 'S27', 'S26'];
export const CLASSES_PER_GRADE = 10;
export const STUDENTS_PER_CLASS = 45;
export const DEFAULT_ORG_SLUG = 'ningwai-bayi';
const PBKDF2_ITER = 100000;
const SESSION_TTL = 7 * 24 * 3600;
const RATE_TTL = 3600;

export function b64(buf) {
  return btoa(String.fromCharCode(...new Uint8Array(buf)));
}
export function b64d(s) {
  return Uint8Array.from(atob(s), (c) => c.charCodeAt(0));
}
export function randomToken(n = 32) {
  const b = crypto.getRandomValues(new Uint8Array(n));
  return b64(b).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}
export async function sha256hex(s) {
  const d = await crypto.subtle.digest('SHA-256', enc.encode(s));
  return [...new Uint8Array(d)].map((b) => b.toString(16).padStart(2, '0')).join('');
}
export function ok(c, data) { return c.json(data); }
export function jsonErr(c, msg, code = 400, extra = {}) { return c.json({ error: msg, ...extra }, code); }

// ===== 密码：PBKDF2-SHA256 10 万次 + 16 字节盐 =====
async function pwHash(pw, salt) {
  const s = salt ? b64d(salt) : crypto.getRandomValues(new Uint8Array(16));
  const key = await crypto.subtle.importKey('raw', enc.encode(pw), 'PBKDF2', false, ['deriveBits']);
  const bits = await crypto.subtle.deriveBits({ name: 'PBKDF2', salt: s, iterations: PBKDF2_ITER, hash: 'SHA-256' }, key, 256);
  return { hash: b64(bits), salt: b64(s) };
}
export async function hashPassword(pw) { return pwHash(pw); }
export async function verifyPassword(pw, hash, salt) {
  const r = await pwHash(pw, salt);
  return r.hash === hash;
}

// ===== 会话（D1 sessions 表；KV 写额度账号级共享，已撞满，弃用）=====
function setCookie(c, val) {
  c.header('Set-Cookie', `session=${val}; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=${SESSION_TTL}`, { append: true });
}
export async function createSession(c, user) {
  const token = randomToken(32);
  const expires = new Date(Date.now() + SESSION_TTL * 1000).toISOString();
  await c.env.db.prepare('INSERT INTO sessions (token, user_id, ua, expires_at) VALUES (?,?,?,?)')
    .bind(token, user.id, (c.req.header('User-Agent') || '').slice(0, 200), expires).run();
  setCookie(c, token);
}
export async function clearSession(c) {
  const m = (c.req.header('Cookie') || '').match(/(?:^|;\s*)session=([^;]+)/);
  if (m) await c.env.db.prepare('DELETE FROM sessions WHERE token = ?').bind(m[1]).run();
  c.header('Set-Cookie', 'session=; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=0', { append: true });
}
export async function getSessionUser(c) {
  const m = (c.req.header('Cookie') || '').match(/(?:^|;\s*)session=([^;]+)/);
  if (!m) return null;
  const row = await c.env.db.prepare('SELECT u.*, s.expires_at FROM sessions s JOIN users u ON u.id = s.user_id WHERE s.token = ?').bind(m[1]).first();
  if (!row) return null;
  if (new Date(row.expires_at) < new Date()) {
    await c.env.db.prepare('DELETE FROM sessions WHERE token = ?').bind(m[1]).run();
    return null;
  }
  if (row.status !== 'active') return null;
  return row;
}
export async function auth(c) { return getSessionUser(c); }

// must_change_pw 守卫：返回非 null 表示应拦截
export function pwGuard(c, user, path) {
  if (user.must_change_pw && !['/api/auth/change-password', '/api/auth/logout', '/api/me'].includes(path)) {
    return jsonErr(c, '请先在个人中心修改初始密码', 403, { code: 'must_change_pw' });
  }
  return null;
}

// ===== 审计日志 =====
export async function audit(c, actorId, action, targetType, targetId, detail) {
  try {
    await c.env.db.prepare('INSERT INTO audit_logs (actor_id, action, target_type, target_id, detail) VALUES (?,?,?,?,?)')
      .bind(actorId, action, targetType, targetId, detail || '').run();
  } catch { /* 不影响主流程 */ }
}

// ===== 站点创始人（owner_user_id 落 site_settings）=====
// v2.1 权限修复：站点创始人不可被封禁/降级，且是唯一可任免 website_admin 的账号。
// 生产库已置 1（yanzie）；新环境未初始化时 getOwnerId 返回 0，任免管理员一律拒绝。
export async function getOwnerId(c) {
  try {
    const row = await c.env.db.prepare('SELECT value FROM site_settings WHERE key = "owner_user_id"').first();
    return parseInt(row?.value) || 0;
  } catch { return 0; }
}

// ===== 站内通知（v2.3：wiki 审核结果 / 论坛回复）=====
// 所有触发点共用；写失败不影响主流程（try/catch 静默）
export async function notify(c, userId, type, title, body = '', link = '') {
  if (!userId) return;
  try {
    await c.env.db.prepare('INSERT INTO notifications (user_id, type, title, body, link) VALUES (?,?,?,?,?)')
      .bind(userId, type, String(title).slice(0, 120), String(body).slice(0, 300), String(link).slice(0, 200)).run();
  } catch { /* 通知失败不阻断主业务 */ }
}

// ===== 论坛板块冗余计数（禁 COUNT(*)，见额度方案书；admin-routes 与 forum-routes 共用）=====
export async function bumpCat(c, catId, topicDelta, postDelta) {
  await c.env.db.prepare('UPDATE forum_categories SET topic_count = topic_count + ?, post_count = post_count + ? WHERE id = ?')
    .bind(topicDelta, postDelta, catId).run();
}

// ===== 校验 =====
export function validClass(name) {
  return typeof name === 'string' && /^(J|S)2[6-9](0[1-9]|10)$/.test(name);
}
export function validStudentNo(no) {
  return typeof no === 'string' && /^\d{1,2}$/.test(no) && +no >= 1 && +no <= 45;
}
export function validUsername(u) {
  return typeof u === 'string' && /^[A-Za-z0-9_]{3,24}$/.test(u);
}
export function pubUser(u) {
  return { id: u.id, username: u.username, display_name: u.display_name, bio: u.bio, role: u.role, must_change_pw: !!u.must_change_pw, disclaimer_ok: !!u.disclaimer_ok };
}

// ===== 注册限流：设备指纹（D1，1 小时 1 账号）=====
export async function checkRateLimit(c, fingerprint) {
  if (!fingerprint) return null;
  const fh = await sha256hex(fingerprint);
  const hit = await c.env.db.prepare('SELECT id FROM device_registrations WHERE fingerprint_hash = ? AND created_at > datetime(\'now\', \'-1 hour\') LIMIT 1').bind(fh).first();
  if (hit) return '同一设备 1 小时内只能注册一个账号，请稍后再试';
  return null;
}
export async function markRateLimit(c, fingerprint, userId) {
  const ipUa = await sha256hex((c.req.header('CF-Connecting-IP') || '') + '|' + (c.req.header('User-Agent') || ''));
  await c.env.db.prepare('INSERT INTO device_registrations (fingerprint_hash, ip_ua_hash, user_id) VALUES (?,?,?)')
    .bind(fingerprint ? await sha256hex(fingerprint) : '', ipUa, userId).run();
}

// ===== 缓存（KV 写额度不可用，暂直查 D1）=====
export async function bustCache(c, keys) {
  // v1.6：恢复 KV 缓存失效。仅用于低频写操作后的主动清理（首页统计缓存），
  // 每天调用量 < 100 次，远低于账号级 1000 次/天写额度。
  if (!c.env?.KV || !keys?.length) return;
  for (const k of keys) {
    try { await c.env.KV.delete(k); } catch {}
  }
}

// ===== wiki 页面计数器（site_settings 冗余计数，替代 COUNT(*) 全表扫描）=====
// v2.0：COUNT(*) 每次全表扫 3699 行，是 D1 读额度第二大消耗点；
// 改为创建/删除时增量维护 site_settings.wiki_page_count（与论坛 topic_count 同思路）。
export async function bumpPageCount(c, delta) {
  await c.env.db.prepare(
    "INSERT INTO site_settings (key, value) VALUES ('wiki_page_count', ?) " +
    "ON CONFLICT(key) DO UPDATE SET value = CAST(COALESCE(value, '0') AS INTEGER) + ?"
  ).bind(delta, delta).run();
}

// ===== 组织/成员关系辅助 =====
export async function getMembership(c, userId, orgId) {
  return c.env.db.prepare('SELECT * FROM org_members WHERE user_id = ? AND org_id = ? AND status = "approved"').bind(userId, orgId).first();
}
export async function isWebsiteAdmin(user) { return user.role === 'website_admin'; }
export async function isOrgAdminOf(c, user, orgId) {
  if (user.role === 'website_admin') return true;
  const m = await c.env.db.prepare('SELECT role FROM org_members WHERE user_id = ? AND org_id = ? AND status = "approved"').bind(user.id, orgId).first();
  return !!m && m.role === 'org_admin';
}
