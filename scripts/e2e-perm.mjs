// 权限修复端到端实测（v2.1）：
//   ① 站点管理员只能封禁/解封普通用户（ban/unban 对 website_admin 一律 403）
//   ② 任免 website_admin 仅站点创始人（owner_user_id）可做，其他人 403
//   ③ 站点创始人不可被封禁、不可被降级
//   ④ 被封账号全站 API 401
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/e2e-perm.mjs
// 造 website_admin + 普通用户两个临时账号，测完自动清理并核实 0 残留。
import { pbkdf2Sync, randomBytes, randomUUID } from 'node:crypto';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB_UUID = 'b09a1a8b-ae50-44fa-96d9-d9376548f28e';
const BASE = 'https://ningwai.pages.dev';
const ITER = 100000;

if (!T) { console.error('missing CLOUDFLARE_API_TOKEN'); process.exit(1); }

async function d1(sql, params = []) {
  let e;
  for (let i = 1; i <= 8; i++) {
    try {
      const r = await fetch(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database/${DB_UUID}/query`, {
        method: 'POST',
        headers: { Authorization: `Bearer ${T}`, 'Content-Type': 'application/json' },
        body: JSON.stringify({ sql, params }),
        signal: AbortSignal.timeout(30000),
      });
      const d = await r.json();
      if (d.errors?.length) throw new Error(JSON.stringify(d.errors));
      return d.result?.[0]?.results || [];
    } catch (err) { e = err; await new Promise((r) => setTimeout(r, 1200 * i)); }
  }
  throw e;
}
const b64 = (b) => Buffer.from(b).toString('base64');

async function mkUser(username, role) {
  const salt = randomBytes(16);
  const hash = b64(pbkdf2Sync('e2e-pass-2026', salt, ITER, 32, 'sha256'));
  await d1('INSERT INTO users (username, pass_hash, salt, display_name, role, disclaimer_ok) VALUES (?,?,?,?,?,1)',
    [username, hash, b64(salt), username, role]);
  const u = (await d1('SELECT id FROM users WHERE username = ?', [username]))[0];
  const token = randomUUID().replace(/-/g, '');
  const exp = new Date(Date.now() + 3600e3).toISOString();
  await d1('INSERT INTO sessions (token, user_id, ua, expires_at) VALUES (?,?,?,?)', [token, u.id, 'e2e', exp]);
  return { id: u.id, cookie: `session=${token}` };
}

async function api(path, cookie, opts = {}) {
  const r = await fetch(BASE + path, {
    ...opts,
    headers: cookie ? { Cookie: cookie, 'Content-Type': 'application/json', ...(opts.headers || {}) } : { 'Content-Type': 'application/json', ...(opts.headers || {}) },
    signal: AbortSignal.timeout(30000),
  });
  const txt = await r.text();
  let d; try { d = JSON.parse(txt); } catch { d = { raw: txt.slice(0, 200) }; }
  return { status: r.status, body: d };
}

let pass = 0, fail = 0;
const check = (name, cond, extra = '') => {
  if (cond) { pass++; console.log(`  ✓ ${name}`); }
  else { fail++; console.log(`  ✗ ${name} ${extra}`); }
};

const createdIds = [];

(async () => {
  console.log('== 0. 预检 ==');
  const pre = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpctl-%'");
  check('无历史残留 tmpctl 账号', pre[0].n === 0, JSON.stringify(pre));
  const owner = await d1("SELECT value FROM site_settings WHERE key = 'owner_user_id'");
  const ownerId = parseInt(owner[0]?.value) || 0;
  check('owner_user_id 已初始化', ownerId > 0, JSON.stringify(owner));
  const ownerRow = await d1('SELECT id, role, status FROM users WHERE id = ?', [ownerId]);
  check('创始人存在且为 website_admin/active', ownerRow[0]?.role === 'website_admin' && ownerRow[0]?.status === 'active', JSON.stringify(ownerRow));

  console.log('== 1. 造临时账号 ==');
  const adm = await mkUser('tmpctl-adm', 'website_admin');   // 普通网站管理员（非创始人）
  const usr = await mkUser('tmpctl-usr', 'user');            // 普通用户
  const adm2 = await mkUser('tmpctl-adm2', 'website_admin'); // 另一个网站管理员（当靶子）
  createdIds.push(adm.id, usr.id, adm2.id);
  const meA = await api('/api/auth/me', adm.cookie);
  check('管理员 /me 200 且为网站管理员', meA.status === 200 && meA.body.user?.role === 'website_admin');

  console.log('== 2. 普通管理员封禁普通用户（允许） ==');
  const ban1 = await api(`/api/admin/users/${usr.id}/ban`, adm.cookie, { method: 'POST', body: '{}' });
  check('封禁普通用户 200', ban1.status === 200, JSON.stringify(ban1.body).slice(0, 150));
  const meBanned = await api('/api/auth/me', usr.cookie);
  check('被封账号全站 API 401', meBanned.status === 401, `status=${meBanned.status}`);
  const unban1 = await api(`/api/admin/users/${usr.id}/unban`, adm.cookie, { method: 'POST', body: '{}' });
  check('解封普通用户 200', unban1.status === 200, JSON.stringify(unban1.body).slice(0, 150));
  const meOk = await api('/api/auth/me', usr.cookie);
  check('解封后 /me 恢复 200', meOk.status === 200, `status=${meOk.status}`);

  console.log('== 3. 普通管理员封其他管理员（拒绝） ==');
  const banAdm = await api(`/api/admin/users/${adm2.id}/ban`, adm.cookie, { method: 'POST', body: '{}' });
  check('封其他网站管理员 403', banAdm.status === 403, JSON.stringify(banAdm.body).slice(0, 150));
  const meAdm2 = await api('/api/auth/me', adm2.cookie);
  check('靶子管理员未被封（仍 200）', meAdm2.status === 200, `status=${meAdm2.status}`);

  console.log('== 4. 普通管理员动创始人（拒绝） ==');
  const banOwner = await api(`/api/admin/users/${ownerId}/ban`, adm.cookie, { method: 'POST', body: '{}' });
  check('封站点创始人 403', banOwner.status === 403, JSON.stringify(banOwner.body).slice(0, 150));
  const roleOwner = await api(`/api/admin/users/${ownerId}/role`, adm.cookie, { method: 'POST', body: JSON.stringify({ role: 'user' }) });
  check('降级站点创始人 403', roleOwner.status === 403, JSON.stringify(roleOwner.body).slice(0, 150));
  const ownerAfter = await d1('SELECT role, status FROM users WHERE id = ?', [ownerId]);
  check('创始人角色/状态未被改动', ownerAfter[0]?.role === 'website_admin' && ownerAfter[0]?.status === 'active', JSON.stringify(ownerAfter));

  console.log('== 5. 普通管理员任免管理员（拒绝） ==');
  const setAdm = await api(`/api/admin/users/${usr.id}/role`, adm.cookie, { method: 'POST', body: JSON.stringify({ role: 'website_admin' }) });
  check('给普通用户设管理员 403', setAdm.status === 403, JSON.stringify(setAdm.body).slice(0, 150));
  const unsetAdm = await api(`/api/admin/users/${adm2.id}/role`, adm.cookie, { method: 'POST', body: JSON.stringify({ role: 'user' }) });
  check('撤其他管理员 403', unsetAdm.status === 403, JSON.stringify(unsetAdm.body).slice(0, 150));
  const usrRole = await d1('SELECT role FROM users WHERE id = ?', [usr.id]);
  check('目标用户角色未被改动', usrRole[0]?.role === 'user', JSON.stringify(usrRole));

  console.log('== 6. 用户列表接口带 founder 标记 ==');
  const list = await api('/api/admin/users?q=tmpctl', adm.cookie);
  check('users 接口返回 owner_id', list.body.owner_id === ownerId, JSON.stringify(list.body.owner_id));
  const ownerRowInList = (list.body.users || []).find((u) => u.id === ownerId);
  check('创始人出现在列表（可被前端标注）', !!ownerRowInList || ownerId === 1);

  console.log('== 7. 清理 ==');
  for (const id of createdIds) {
    await d1('DELETE FROM sessions WHERE user_id = ?', [id]);
    await d1('DELETE FROM users WHERE id = ?', [id]);
  }
  await d1("UPDATE site_settings SET value = (SELECT COUNT(*) FROM wiki_pages) WHERE key = 'wiki_page_count'");
  const post = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpctl-%'");
  check('临时账号 0 残留', post[0].n === 0, JSON.stringify(post));

  console.log(`\n结果：${pass} 通过 / ${fail} 失败`);
  process.exit(fail ? 1 : 0);
})().catch((e) => { console.error('FATAL', e.message); process.exit(1); });
