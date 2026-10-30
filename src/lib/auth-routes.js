// 认证路由：注册 / 登录 / 登出 / 改密 / 个人中心
import { Hono } from 'hono';
import {
  auth, audit, checkRateLimit, clearSession, createSession, getSessionUser,
  hashPassword, jsonErr, markRateLimit, ok, pubUser, validClass, validStudentNo, validUsername, verifyPassword, pwGuard,
} from './common.js';

const r = new Hono();

// ===== 注册 =====
r.post('/register', async (c) => {
  const body = await c.req.json().catch(() => null);
  if (!body) return jsonErr(c, '请求格式错误');
  const { username, password, confirm, fingerprint, org_slug, class_name, real_name, student_no } = body;

  if (!validUsername(username)) return jsonErr(c, '用户名需 3-24 位字母、数字或下划线');
  if (!password || password.length < 8) return jsonErr(c, '密码至少 8 位');
  if (password !== confirm) return jsonErr(c, '两次输入的密码不一致');
  if (real_name && String(real_name).length > 30) return jsonErr(c, '姓名过长');
  if (student_no && String(student_no).length > 10) return jsonErr(c, '学号格式不正确');

  const rl = await checkRateLimit(c, fingerprint ? String(fingerprint).slice(0, 128) : '');
  if (rl) return jsonErr(c, rl, 429);

  const dup = await c.env.db.prepare('SELECT id FROM users WHERE username = ?').bind(username).first();
  if (dup) return jsonErr(c, '用户名已被注册');

  // 组织加入（注册时可选）
  let orgId = null, memberStatus = null;
  if (org_slug) {
    const org = await c.env.db.prepare('SELECT * FROM orgs WHERE slug = ?').bind(org_slug).first();
    if (!org) return jsonErr(c, '组织不存在');
    if (org.type !== 'public') return jsonErr(c, '非公开组织请使用邀请码加入');
    if (!class_name || !real_name || !student_no) return jsonErr(c, '加入组织需填写班级、姓名、学号');
    const { validClass, validStudentNo } = await import('./common.js');
    if (!validClass(class_name) || !validStudentNo(String(student_no))) return jsonErr(c, '班级或学号格式不正确（如 J2804 / 01）');
    orgId = org.id;
    memberStatus = org.join_mode === 'approval' ? 'pending' : 'approved';
  }

  const { hash, salt } = await hashPassword(password);
  // 注册时已在前端完成《加入说明》阅读与签名，直接标记为已读
  const res = await c.env.db.prepare('INSERT INTO users (username, pass_hash, salt, display_name, disclaimer_ok) VALUES (?,?,?,?,1)')
    .bind(username, hash, salt, username).run();
  const uid = res.meta.last_row_id;

  if (orgId) {
    await c.env.db.prepare('INSERT INTO org_members (org_id, user_id, role, class_name, real_name, student_no, status) VALUES (?,?,?,?,?,?,?)')
      .bind(orgId, uid, 'member', class_name, real_name, String(student_no), memberStatus).run();
  }
  await markRateLimit(c, fingerprint ? String(fingerprint).slice(0, 128) : '', uid);

  const user = await c.env.db.prepare('SELECT * FROM users WHERE id = ?').bind(uid).first();
  await createSession(c, user);
  await audit(c, uid, 'register', 'user', uid, orgId ? `org:${orgId}` : '');
  return ok(c, { user: pubUser(user) });
});

// ===== 登录 =====
r.post('/login', async (c) => {
  const body = await c.req.json().catch(() => null);
  if (!body || !body.username || !body.password) return jsonErr(c, '请输入用户名和密码');
  const user = await c.env.db.prepare('SELECT * FROM users WHERE username = ?').bind(body.username).first();
  if (!user) return jsonErr(c, '用户名或密码错误', 401);
  if (user.status !== 'active') return jsonErr(c, '账号已被封禁', 403);
  const good = await verifyPassword(body.password, user.pass_hash, user.salt);
  if (!good) {
    await audit(c, user.id, 'login_fail', 'user', user.id, '');
    return jsonErr(c, '用户名或密码错误', 401);
  }
  await createSession(c, user);
  await audit(c, user.id, 'login', 'user', user.id, '');
  return ok(c, { user: pubUser(user), must_change_pw: !!user.must_change_pw });
});

// ===== 登出 =====
r.post('/logout', async (c) => {
  const user = await auth(c);
  if (user) await audit(c, user.id, 'logout', 'user', user.id, '');
  await clearSession(c);
  return ok(c, { ok: true });
});

// ===== 当前用户（含组织身份）=====
r.get('/me', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const memberships = await c.env.db.prepare(`
    SELECT m.id, m.role, m.class_name, m.real_name, m.student_no, m.status, o.id AS org_id, o.name AS org_name, o.slug AS org_slug, o.type AS org_type
    FROM org_members m JOIN orgs o ON o.id = m.org_id
    WHERE m.user_id = ? ORDER BY m.joined_at`).bind(user.id).all();
  // 当前应用的主题（NULL = 默认宁外主题）
  let theme = null;
  const au = await c.env.db.prepare('SELECT active_theme_id FROM users WHERE id = ?').bind(user.id).first();
  if (au?.active_theme_id) {
    const t = await c.env.db.prepare('SELECT id, name, config FROM themes WHERE id = ?').bind(au.active_theme_id).first();
    if (t) theme = { id: t.id, name: t.name, config: JSON.parse(t.config || '{}') };
  }
  return ok(c, { user: pubUser(user), memberships: memberships.results || [], theme });
});

// ===== 加入说明确认（老用户被强制门拦截后提交）=====
r.post('/disclaimer-accept', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/auth/disclaimer-accept');
  if (g) return g;
  await c.env.db.prepare('UPDATE users SET disclaimer_ok = 1 WHERE id = ?').bind(user.id).run();
  return ok(c, { ok: true });
});

// ===== 改昵称/简介 =====
r.patch('/me', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const g = pwGuard(c, user, '/api/me');
  if (g) return g;
  const body = await c.req.json().catch(() => null);
  if (!body) return jsonErr(c, '请求格式错误');
  const dn = String(body.display_name ?? user.display_name).slice(0, 30);
  const bio = String(body.bio ?? user.bio ?? '').slice(0, 500);
  await c.env.db.prepare('UPDATE users SET display_name = ?, bio = ? WHERE id = ?').bind(dn, bio, user.id).run();
  if (body.membership && body.membership.id) {
    const mid = parseInt(body.membership.id);
    const mem = await c.env.db.prepare('SELECT * FROM org_members WHERE id = ? AND user_id = ?').bind(mid, user.id).first();
    if (!mem) return jsonErr(c, '组织成员记录不存在', 404);
    const cls = String(body.membership.class_name ?? mem.class_name ?? '').trim().toUpperCase();
    const rn = String(body.membership.real_name ?? mem.real_name ?? '').trim();
    const sn = String(body.membership.student_no ?? mem.student_no ?? '').trim();
    if (cls && !validClass(cls)) return jsonErr(c, '班级格式不正确（如 J2804）');
    if (rn && (rn.length < 2 || rn.length > 30)) return jsonErr(c, '姓名需 2-30 个字符');
    if (sn && !validStudentNo(sn)) return jsonErr(c, '学号需为 01-45');
    await c.env.db.prepare('UPDATE org_members SET class_name = ?, real_name = ?, student_no = ? WHERE id = ?')
      .bind(cls, rn, sn ? sn.padStart(2, '0') : sn, mid).run();
    await audit(c, user.id, 'member_profile_update', 'org_member', mid, `org:${mem.org_id}`);
  }
  const fresh = await c.env.db.prepare('SELECT * FROM users WHERE id = ?').bind(user.id).first();
  return ok(c, { user: pubUser(fresh) });
});

// ===== 修改密码（must_change_pw 时免旧密码；改后作废全部会话）=====
r.post('/change-password', async (c) => {
  const user = await getSessionUser(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const body = await c.req.json().catch(() => null);
  if (!body || !body.new_password) return jsonErr(c, '请输入新密码');
  if (body.new_password.length < 8) return jsonErr(c, '新密码至少 8 位');
  if (!user.must_change_pw) {
    if (!body.old_password) return jsonErr(c, '请输入原密码');
    if (!(await verifyPassword(body.old_password, user.pass_hash, user.salt))) return jsonErr(c, '原密码错误', 403);
  }
  const { hash, salt } = await hashPassword(body.new_password);
  await c.env.db.prepare('UPDATE users SET pass_hash = ?, salt = ?, must_change_pw = 0 WHERE id = ?').bind(hash, salt, user.id).run();
  await c.env.db.prepare('DELETE FROM sessions WHERE user_id = ?').bind(user.id).run();
  const fresh = await c.env.db.prepare('SELECT * FROM users WHERE id = ?').bind(user.id).first();
  await createSession(c, fresh);
  await audit(c, user.id, 'change_password', 'user', user.id, '');
  return ok(c, { user: pubUser(fresh) });
});

export default r;
