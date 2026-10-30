// v1.5 端到端实测：老用户强制门 + 审核 diff（临时账号，跑完自动清理）
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/e2e-test.mjs
import { createHash, pbkdf2Sync, randomBytes } from 'node:crypto';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB = 'ningwai-db';
const BASE = 'https://ningwai.pages.dev';
if (!T) { console.error('need CLOUDFLARE_API_TOKEN'); process.exit(1); }

async function fr(url, opts = {}, tries = 8) {
  let e;
  for (let i = 1; i <= tries; i++) {
    try { return await fetch(url, { ...opts, signal: AbortSignal.timeout(25000) }); }
    catch (err) { e = err; console.error(`  net attempt ${i}: ${err.cause?.code || err.message}`); await new Promise((r) => setTimeout(r, 1000 * i)); }
  }
  throw e;
}
// D1 查询（直连 HTTP API）
async function d1(sql, params = []) {
  const list = await (await fr(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database`, { headers: { Authorization: `Bearer ${T}` } })).json();
  const db = list.result.find((d) => d.name === DB);
  const r = await fr(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database/${db.uuid}/query`, {
    method: 'POST', headers: { Authorization: `Bearer ${T}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ sql, params }),
  });
  const d = await r.json();
  if (!r.ok || d.success === false) throw new Error(JSON.stringify(d.errors || d).slice(0, 300));
  return d.result?.[0]?.results || [];
}
const b64 = (b) => b.toString('base64');
function pwHash(pw) {
  const salt = randomBytes(16);
  const hash = pbkdf2Sync(pw, salt, 100000, 32, 'sha256');
  return { hash: b64(hash), salt: b64(salt) };
}

const results = [];
const check = (name, pass, detail = '') => { results.push({ name, pass, detail }); console.log(`${pass ? '✅' : '❌'} ${name}${detail ? ' — ' + detail : ''}`); };

// ===== 1. 造临时账号（直接插库，绕过注册限流）=====
const h1 = pwHash('tmpgate1-pass-123'), h2 = pwHash('tmpdiff1-pass-123');
const tok1 = 'tmpgate1tok' + Date.now().toString(36), tok2 = 'tmpdiff1tok' + Date.now().toString(36);
await d1(`INSERT INTO users (username, pass_hash, salt, display_name, role, disclaimer_ok) VALUES (?,?,?,?,?,?)`,
  ['tmpgate1', h1.hash, h1.salt, 'tmpgate1', 'user', 0]);
await d1(`INSERT INTO users (username, pass_hash, salt, display_name, role, disclaimer_ok) VALUES (?,?,?,?,?,?)`,
  ['tmpdiff1', h2.hash, h2.salt, 'tmpdiff1', 'website_admin', 1]);
const u1 = (await d1(`SELECT id FROM users WHERE username = 'tmpgate1'`))[0].id;
const u2 = (await d1(`SELECT id FROM users WHERE username = 'tmpdiff1'`))[0].id;
await d1(`INSERT INTO sessions (token, user_id, ua, expires_at) VALUES (?,?,?,datetime('now','+1 day'))`, [tok1, u1, 'e2e']);
await d1(`INSERT INTO sessions (token, user_id, ua, expires_at) VALUES (?,?,?,datetime('now','+1 day'))`, [tok2, u2, 'e2e']);
console.log(`temp users: tmpgate1(id=${u1}, disclaimer_ok=0) tmpdiff1(id=${u2}, admin)`);
const C1 = { Cookie: `session=${tok1}`, 'Content-Type': 'application/json' };
const C2 = { Cookie: `session=${tok2}`, 'Content-Type': 'application/json' };

try {
  // ===== 2. 强制门：未读用户 /me 返回 false =====
  let me = await (await fr(`${BASE}/api/auth/me`, { headers: C1 })).json();
  check('老用户 /me 带 disclaimer_ok=false（会弹门）', me.user?.disclaimer_ok === false, JSON.stringify(me.user?.disclaimer_ok));

  // ===== 3. 接受后置 true =====
  const acc = await fr(`${BASE}/api/auth/disclaimer-accept`, { method: 'POST', headers: C1, body: '{}' });
  const accJson = await acc.json();
  check('POST /disclaimer-accept → ok', acc.status === 200 && accJson.ok === true, `status ${acc.status}`);
  me = await (await fr(`${BASE}/api/auth/me`, { headers: C1 })).json();
  check('接受后 /me 带 disclaimer_ok=true（门不再弹）', me.user?.disclaimer_ok === true);

  // ===== 4. diff：tmpgate1 建测试词条（默认权限→初始内容待审）=====
  const slug = 'tmpdiff-e2e-' + Date.now().toString(36);
  const cr = await fr(`${BASE}/api/wiki/pages`, {
    method: 'POST', headers: C1,
    body: JSON.stringify({ kind: 'page', title: 'diff 测试词条', slug, content: '第一行\n第二行\n第三行' }),
  });
  const crJson = await cr.json();
  check('tmpgate1 建词条成功', cr.status === 200 || cr.status === 201, `status ${cr.status} ${JSON.stringify(crJson).slice(0, 120)}`);

  // 找待审修订
  const pend = await (await fr(`${BASE}/api/wiki/revisions?status=pending&page=1`, { headers: C2 })).json();
  const rev = (pend.revisions || []).find((x) => x.page_title === 'diff 测试词条');
  check('审核队列能看到该待审修订', !!rev, rev ? `rev id=${rev.id}` : 'not found');

  if (rev) {
    // 管理员视角：先看 diff（此时 vs 空当前版）
    const d0 = await (await fr(`${BASE}/api/wiki/revisions/${rev.id}/diff`, { headers: C2 })).json();
    check('diff 接口返回 revision+current', !!d0.revision && typeof d0.current === 'string', `current 长度=${d0.current?.length}`);
    check('新词条 diff 的 current 为空', d0.current === '', JSON.stringify(d0.current));

    // 再造一次修订让 diff 有内容可比：tmpgate1 再提交一版（先通过第一版？不行，pending 只能一条。先驳回再提）
    // 直接提第二版会被 dup 拦截——先通过第一版，再提修改版
    await fr(`${BASE}/api/wiki/revisions/${rev.id}/approve`, { method: 'POST', headers: C2, body: '{}' });
    const cr2 = await fr(`${BASE}/api/wiki/pages/${slug}/revisions`, {
      method: 'POST', headers: C1,
      body: JSON.stringify({ content: '第一行\n第二行改了\n第三行\n第四行新增', message: 'e2e 测试修订' }),
    });
    check('tmpgate1 提交第二版修订（待审）', cr2.status === 200 && cr2.json && (await cr2.json()).direct === false, `status ${cr2.status}`);

    const pend2 = await (await fr(`${BASE}/api/wiki/revisions?status=pending&page=1`, { headers: C2 })).json();
    const rev2 = (pend2.revisions || []).find((x) => x.page_title === 'diff 测试词条');
    const d1r = await (await fr(`${BASE}/api/wiki/revisions/${rev2.id}/diff`, { headers: C2 })).json();
    check('第二版 diff：current=旧发布版', d1r.current.includes('第二行') && !d1r.current.includes('第二行改了'), `current="${d1r.current.slice(0, 40)}…"`);
    check('第二版 diff：revision.content=新内容', d1r.revision.content.includes('第四行新增'));

    // 非管理员不能看 diff
    const dNo = await fr(`${BASE}/api/wiki/revisions/${rev2.id}/diff`, { headers: C1 });
    check('普通用户看 diff 被 403', dNo.status === 403, `status ${dNo.status}`);
  }
} finally {
  // ===== 5. 清理：词条（级联修订/附件）→ 会话 → 用户 → 审计 =====
  try { await d1(`DELETE FROM wiki_pages WHERE slug LIKE 'tmpdiff-e2e-%'`); } catch (e) { console.error('cleanup pages:', e.message); }
  await d1(`DELETE FROM sessions WHERE user_id IN (?, ?)`, [u1, u2]);
  await d1(`DELETE FROM audit_logs WHERE user_id IN (?, ?)`, [u1, u2]);
  await d1(`DELETE FROM users WHERE username IN ('tmpgate1', 'tmpdiff1')`);
  const left = await d1(`SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmp%'`);
  check('清理后无临时用户残留', left[0].n === 0, `剩余 ${left[0].n}`);
  const leftRev = await d1(`SELECT COUNT(*) AS n FROM wiki_revisions r JOIN wiki_pages p ON p.id = r.page_id WHERE p.slug LIKE 'tmpdiff-e2e-%'`);
  check('清理后无临时修订残留', leftRev[0].n === 0, `剩余 ${leftRev[0].n}`);
}

const failed = results.filter((r) => !r.pass);
console.log(`\n===== ${results.length - failed.length}/${results.length} 通过 =====`);
if (failed.length) { console.log('失败项：', failed.map((f) => f.name).join(' | ')); process.exit(1); }
