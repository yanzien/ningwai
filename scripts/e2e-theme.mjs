// 主题系统 e2e（v2.2）：建/脏配置过滤/应用(共享)/fork(另存为)/公开详情/权限/删除级联/清理
// v2.2 起「应用他人主题」= 共享同一实例（不复制）；想改就 fork，副本作者变为当前用户。
import { pbkdf2Sync, randomBytes, randomUUID } from 'node:crypto';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const BASE = 'https://ningwai.pages.dev';
const ITER = 100000;
const DBUUID = 'b09a1a8b-ae50-44fa-96d9-d9376548f28e';

async function d1(sql, params = []) {
  let e;
  for (let i = 1; i <= 8; i++) {
    try {
      const r = await fetch(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database/${DBUUID}/query`, {
        method: 'POST', headers: { Authorization: `Bearer ${T}`, 'Content-Type': 'application/json' },
        body: JSON.stringify({ sql, params }), signal: AbortSignal.timeout(30000),
      });
      const d = await r.json();
      if (d.errors?.length) throw new Error(JSON.stringify(d.errors));
      return d.result?.[0]?.results || [];
    } catch (err) { e = err; await new Promise((r) => setTimeout(r, 1200 * i)); }
  }
  throw e;
}
const b64 = (b) => Buffer.from(b).toString('base64');

async function mkUser(username) {
  const salt = randomBytes(16);
  const hash = b64(pbkdf2Sync('e2e-pass-2026', salt, ITER, 32, 'sha256'));
  await d1('INSERT INTO users (username, pass_hash, salt, display_name, role, disclaimer_ok) VALUES (?,?,?,?,?,1)',
    [username, hash, b64(salt), username, 'user']);
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

(async () => {
  console.log('== 0. 残留检查 ==');
  const pre = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmptheme%'");
  check('无 tmptheme 残留', pre[0].n === 0, JSON.stringify(pre));

  console.log('== 1. 造两个临时账号 ==');
  const u1 = await mkUser('tmptheme-a');   // 原作者
  const u2 = await mkUser('tmptheme-b');   // 使用者

  console.log('== 2. /me 带 theme 字段 ==');
  const me = await api('/api/auth/me', u1.cookie);
  check('/me 200 且 theme=null（默认主题）', me.status === 200 && me.body.theme === null, JSON.stringify(me.body).slice(0, 120));

  console.log('== 3. 创建主题 + 脏配置过滤 ==');
  const cfg = { nav_bg: '#123456', nav_text: '#ffffff', bg: '#fafafa', mid: '#eee', primary: '#9e1b1b' };
  const cr = await api('/api/themes', u1.cookie, { method: 'POST', body: JSON.stringify({ name: '测试主题甲', config: cfg }) });
  check('创建 200', cr.status === 200, JSON.stringify(cr.body).slice(0, 150));
  const tid = cr.body.id;
  check('返回 id', !!tid);
  const bad = await api('/api/themes', u1.cookie, { method: 'POST', body: JSON.stringify({ name: 'x', config: { nav_bg: 'javascript:alert(1)', primary: 'notacolor', mid_image: 'javascript:x', mid_blur: 'evil', gradient_angle: 9999 } }) });
  check('非法颜色/URL/枚举被过滤', bad.status === 200 && bad.body.config && !bad.body.config.nav_bg && !bad.body.config.primary && !bad.body.config.mid_image && bad.body.config.gradient_angle === 360, JSON.stringify(bad.body).slice(0, 200));
  const badId = bad.body.id;

  console.log('== 4. 应用自己的主题 ==');
  const ap = await api('/api/themes/' + tid + '/apply', u1.cookie, { method: 'POST', body: '{}' });
  check('应用 200', ap.status === 200, JSON.stringify(ap.body).slice(0, 100));
  const me2 = await api('/api/auth/me', u1.cookie);
  check('/me 返回应用的主题', me2.body.theme?.id === tid && me2.body.theme?.config.nav_bg === '#123456', JSON.stringify(me2.body.theme).slice(0, 150));

  console.log('== 5. 分享 + 商店 + 分享码 ==');
  const sh = await api('/api/themes/' + tid + '/share', u1.cookie, { method: 'POST', body: '{}' });
  check('分享生成 code', sh.status === 200 && !!sh.body.code, JSON.stringify(sh.body).slice(0, 100));
  const code = sh.body.code;
  const store = await api('/api/themes/store');
  check('商店出现该主题且带作者', store.body.themes?.some((t) => t.id === tid && t.author === 'tmptheme-a'), JSON.stringify(store.body).slice(0, 120));
  const byCode = await api('/api/themes/shared/' + code);
  check('分享码可查', byCode.status === 200 && byCode.body.theme?.name === '测试主题甲', JSON.stringify(byCode.body).slice(0, 120));

  console.log('== 6. 他人应用 = 共享同一实例（不复制）==');
  const u2MineBefore = await api('/api/themes/mine', u2.cookie);
  check('u2 应用前无自己的主题', (u2MineBefore.body.themes || []).length === 0);
  const ap2 = await api('/api/themes/' + tid + '/apply', u2.cookie, { method: 'POST', body: '{}' });
  check('他人应用 200', ap2.status === 200, JSON.stringify(ap2.body).slice(0, 100));
  const u2Active = await d1('SELECT active_theme_id FROM users WHERE id = ?', [u2.id]);
  check('u2 的 active 指向原作者主题（共享非复制）', u2Active[0]?.active_theme_id === tid, JSON.stringify(u2Active));
  const u2MineAfter = await api('/api/themes/mine', u2.cookie);
  check('u2 名下没有产生副本', (u2MineAfter.body.themes || []).length === 0, JSON.stringify(u2MineAfter.body.themes?.length));
  const useCnt = await d1('SELECT use_count FROM themes WHERE id = ?', [tid]);
  check('use_count 每次切换应用 +1（u1 自己 + u2 = 2）', useCnt[0]?.use_count === 2, JSON.stringify(useCnt));

  console.log('== 7. 非作者不能直接改他人主题 ==');
  const hack = await api('/api/themes/' + tid, u2.cookie, { method: 'PUT', body: JSON.stringify({ config: { nav_bg: '#000000' } }) });
  check('他人修改被拒(403)', hack.status === 403, `status=${hack.status}`);

  console.log('== 8. 另存为（fork）：副本作者变为当前用户 ==');
  const fk = await api('/api/themes/' + tid + '/fork', u2.cookie, { method: 'POST', body: '{}' });
  check('fork 200', fk.status === 200, JSON.stringify(fk.body).slice(0, 120));
  const fid = fk.body.id;
  check('fork 返回新 id', !!fid && fid !== tid);
  const fkRow = await d1('SELECT user_id, name, config FROM themes WHERE id = ?', [fid]);
  check('副本作者是 u2', fkRow[0]?.user_id === u2.id, JSON.stringify(fkRow));
  const forkPut = await api('/api/themes/' + fid, u2.cookie, { method: 'PUT', body: JSON.stringify({ name: 'u2 的改版', config: { ...cfg, nav_bg: '#654321' } }) });
  check('u2 编辑自己的副本 200', forkPut.status === 200, JSON.stringify(forkPut.body).slice(0, 120));
  const fkOwn = await api('/api/themes/' + tid + '/fork', u1.cookie, { method: 'POST', body: '{}' });
  check('fork 自己的主题被拒', fkOwn.status !== 200, `status=${fkOwn.status}`);

  console.log('== 9. 公开详情端点 ==');
  const pub = await api('/api/themes/public/' + tid);
  check('未登录可看已分享主题', pub.status === 200 && pub.body.theme?.author === 'tmptheme-a' && pub.body.theme?.is_mine === false, JSON.stringify(pub.body).slice(0, 150));
  const pubBad = await api('/api/themes/public/' + badId);
  check('未分享主题未登录 404', pubBad.status === 404, `status=${pubBad.status}`);
  const pubOwn = await api('/api/themes/public/' + badId, u1.cookie);
  check('未分享主题作者本人可看', pubOwn.status === 200 && pubOwn.body.theme?.is_mine === true, `status=${pubOwn.status}`);

  console.log('== 10. 修改/取消分享/删除级联 ==');
  const up = await api('/api/themes/' + tid, u1.cookie, { method: 'PUT', body: JSON.stringify({ name: '测试主题甲改', config: { ...cfg, nav_bg: '#654321' } }) });
  check('作者修改 200', up.status === 200);
  const un = await api('/api/themes/' + tid + '/unshare', u1.cookie, { method: 'POST', body: '{}' });
  check('取消分享 200', un.status === 200);
  const byCode2 = await api('/api/themes/shared/' + code);
  check('取消分享后码失效(404)', byCode2.status === 404);
  await api('/api/themes/' + tid + '/share', u1.cookie, { method: 'POST', body: '{}' }); // 重新分享供删除级联测试
  await api('/api/themes/' + tid + '/apply', u2.cookie, { method: 'POST', body: '{}' });
  const del = await api('/api/themes/' + tid, u1.cookie, { method: 'DELETE', body: '{}' });
  check('删除 200', del.status === 200);
  const u2Active2 = await d1('SELECT active_theme_id FROM users WHERE id = ?', [u2.id]);
  check('删除后使用者的 active 被清空', u2Active2[0]?.active_theme_id === null, JSON.stringify(u2Active2));
  const me3 = await api('/api/auth/me', u1.cookie);
  check('删除后 /me theme 回 null', me3.body.theme === null, JSON.stringify(me3.body.theme));
  const pubGone = await api('/api/themes/public/' + tid);
  check('删除后详情 404', pubGone.status === 404, `status=${pubGone.status}`);

  console.log('== 11. 权限：他人删除被拒 ==');
  const u3 = await mkUser('tmptheme-c');
  const tid3 = (await api('/api/themes', u3.cookie, { method: 'POST', body: JSON.stringify({ name: '丙的主题', config: cfg }) })).body.id;
  const hackDel = await api('/api/themes/' + tid3, u1.cookie, { method: 'DELETE', body: '{}' });
  check('他人删除被拒(403)', hackDel.status === 403, `status=${hackDel.status}`);

  console.log('== 12. 清理 ==');
  await d1("DELETE FROM themes WHERE user_id IN (SELECT id FROM users WHERE username LIKE 'tmptheme%')");
  await d1('UPDATE users SET active_theme_id = NULL WHERE username LIKE "tmptheme%"');
  await d1('DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE username LIKE "tmptheme%")');
  await d1('DELETE FROM users WHERE username LIKE "tmptheme%"');
  const left = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmptheme%'");
  const themes = await d1("SELECT COUNT(*) AS n FROM themes WHERE user_id NOT IN (SELECT id FROM users)");
  check('账号 0 残留', left[0].n === 0, JSON.stringify(left));
  check('无孤儿主题', themes[0].n === 0, JSON.stringify(themes));
  const preset = await d1('SELECT id, name, shared FROM themes WHERE id = 1');
  check('预置主题完好', preset[0]?.name === '宁外专属' && preset[0]?.shared === 1, JSON.stringify(preset));

  console.log(`\n结果: ${pass} 通过, ${fail} 失败`);
  process.exit(fail ? 1 : 0);
})().catch((e) => { console.error('FATAL', e); process.exit(1); });
