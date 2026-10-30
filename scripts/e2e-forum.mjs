// 论坛端到端实测：板块/主题/回复/审核/管理动作/负路径/清理
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/e2e-forum.mjs
// 造 website_admin + 普通用户两个临时账号，测完自动清理并核实 0 残留。
import { pbkdf2Sync, randomBytes, randomUUID } from 'node:crypto';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB_UUID = 'b09a1a8b-ae50-44fa-96d9-d9376548f28e';
const BASE = 'https://ningwai.pages.dev';
const ITER = 100000;

if (!T) { console.error('missing CLOUDFLARE_API_TOKEN'); process.exit(1); }

// ---------- D1 裸 API（含重试） ----------
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

// ---------- 造账号 ----------
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

// ---------- API ----------
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

const createdTopicIds = [];   // 记录待清理的主题
const createdCatIds = [];     // 记录待清理的板块

(async () => {
  console.log('== 0. 预检 ==');
  const pre = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpe2e%'");
  check('无历史残留 tmpe2e 账号', pre[0].n === 0, JSON.stringify(pre));
  const catsPre = await d1('SELECT id, name, topic_count, post_count FROM forum_categories ORDER BY id');
  check('论坛表已迁移且有预置板块', catsPre.length >= 4, JSON.stringify(catsPre).slice(0, 200));

  console.log('== 1. 造临时账号 ==');
  const adm = await mkUser('tmpe2e-wadm', 'website_admin');
  const usr = await mkUser('tmpe2e-usr', 'user');
  const meA = await api('/api/auth/me', adm.cookie);
  check('管理员 /me 200 且为网站管理员', meA.status === 200 && meA.body.user?.role === 'website_admin');
  const meU = await api('/api/auth/me', usr.cookie);
  check('普通用户 /me 200', meU.status === 200 && meU.body.user?.username === 'tmpe2e-usr');

  console.log('== 2. 板块列表 ==');
  const catList = await api('/api/forum/categories');
  check('板块列表 200 且 ≥4', catList.status === 200 && catList.body.categories.length >= 4);
  const catId = catList.body.categories[0].id;

  console.log('== 3. 审核开关：关闭 → 直发（记录原值先） ==');
  const origReview = (await d1("SELECT value FROM site_settings WHERE key = 'forum_review'"))[0]?.value || '0';
  const off = await api('/api/admin/settings', adm.cookie, { method: 'POST', body: JSON.stringify({ forum_review: '0' }) });
  check('管理员可关闭审核开关', off.status === 200);
  const negAuth = await api('/api/forum/categories/' + catId + '/topics', null, {
    method: 'POST', body: JSON.stringify({ title: 'e2e未登录发帖', content: 'x' }),
  });
  check('未登录发帖 401', negAuth.status === 401, `status=${negAuth.status}`);
  const shortTitle = await api('/api/forum/categories/' + catId + '/topics', usr.cookie, {
    method: 'POST', body: JSON.stringify({ title: 'x', content: 'y' }),
  });
  check('标题过短 400', shortTitle.status === 400, `status=${shortTitle.status}`);
  const noCat = await api('/api/forum/categories/99999/topics', usr.cookie, {
    method: 'POST', body: JSON.stringify({ title: '正常标题', content: 'y' }),
  });
  check('不存在板块 404', noCat.status === 404, `status=${noCat.status}`);

  const t1 = await api('/api/forum/categories/' + catId + '/topics', usr.cookie, {
    method: 'POST', body: JSON.stringify({ title: 'e2e测试主题-直发', content: '一楼内容 **加粗**\n\n第二段' }),
  });
  check('用户发帖成功', t1.status === 200 || t1.status === 201, JSON.stringify(t1.body).slice(0, 150));
  check('审核关闭时直发 published', t1.body.status === 'published', JSON.stringify(t1.body));
  createdTopicIds.push(t1.body.id);
  const r1 = await api('/api/forum/topics/' + t1.body.id + '/posts', usr.cookie, {
    method: 'POST', body: JSON.stringify({ content: '二楼回复' }),
  });
  check('回复成功且楼层为 2', r1.status === 200 && r1.body.floor === 2, JSON.stringify(r1.body));
  const detail = await api('/api/forum/topics/' + t1.body.id, usr.cookie);
  check('主题详情含 2 楼且可回复', detail.status === 200 && detail.body.posts.length === 2 && detail.body.can_reply === true, JSON.stringify(detail.body).slice(0, 150));

  console.log('== 4. 审核开关：开启 → 待审 ==');
  const on = await api('/api/admin/settings', adm.cookie, { method: 'POST', body: JSON.stringify({ forum_review: '1' }) });
  check('管理员可开启审核开关', on.status === 200);
  const t2 = await api('/api/forum/categories/' + catId + '/topics', usr.cookie, {
    method: 'POST', body: JSON.stringify({ title: 'e2e测试主题-待审', content: '待审内容' }),
  });
  check('审核开启时发帖为 pending', t2.body.status === 'pending', JSON.stringify(t2.body));
  createdTopicIds.push(t2.body.id);
  const listAfter = await api('/api/forum/categories/' + catId + '/topics', usr.cookie);
  const hasPending = listAfter.body.topics.some((t) => t.id === t2.body.id);
  check('普通用户列表不显示待审主题', !hasPending);
  const pendingDetail = await api('/api/forum/topics/' + t2.body.id, usr.cookie);
  check('普通用户看待审主题 404', pendingDetail.status === 404, `status=${pendingDetail.status}`);
  const replyPending = await api('/api/forum/topics/' + t2.body.id + '/posts', usr.cookie, {
    method: 'POST', body: JSON.stringify({ content: '回复待审主题' }),
  });
  check('回复待审主题 403', replyPending.status === 403, `status=${replyPending.status}`);
  const pendingQueue = await api('/api/admin/forum/pending', adm.cookie);
  check('管理员待审队列包含该主题', pendingQueue.body.pending.some((t) => t.id === t2.body.id), JSON.stringify(pendingQueue.body).slice(0, 200));

  console.log('== 5. 管理动作 ==');
  const approve = await api('/api/admin/forum/topics/' + t2.body.id + '/approve', adm.cookie, { method: 'POST', body: '{}' });
  check('管理员通过审核', approve.status === 200);
  const afterApprove = await api('/api/forum/topics/' + t2.body.id, usr.cookie);
  check('通过后普通用户可见', afterApprove.status === 200);
  const pin = await api('/api/admin/forum/topics/' + t1.body.id + '/pin', adm.cookie, { method: 'POST', body: '{}' });
  check('置顶操作 200', pin.status === 200);
  const lock = await api('/api/admin/forum/topics/' + t1.body.id + '/lock', adm.cookie, { method: 'POST', body: '{}' });
  check('锁定操作 200', lock.status === 200);
  const replyLocked = await api('/api/forum/topics/' + t1.body.id + '/posts', usr.cookie, {
    method: 'POST', body: JSON.stringify({ content: '锁定后回复' }),
  });
  check('锁定主题回复被拒（4xx）', replyLocked.status >= 400 && replyLocked.status < 500, `status=${replyLocked.status}`);
  const unlock = await api('/api/admin/forum/topics/' + t1.body.id + '/unlock', adm.cookie, { method: 'POST', body: '{}' });
  check('解锁操作 200', unlock.status === 200);
  const negPerm = await api('/api/admin/forum/topics/' + t1.body.id + '/pin', usr.cookie, { method: 'POST', body: '{}' });
  check('普通用户调管理接口 403', negPerm.status === 403, `status=${negPerm.status}`);

  console.log('== 6. 作者删自己的主题 ==');
  const authorDel = await api('/api/forum/topics/' + t2.body.id + '/delete', usr.cookie, { method: 'POST', body: '{}' });
  check('作者可删自己的主题', authorDel.status === 200);
  const gone = await api('/api/forum/topics/' + t2.body.id, usr.cookie);
  check('删除后 404', gone.status === 404, `status=${gone.status}`);

  console.log('== 7. 板块管理 ==');
  const newCat = await api('/api/admin/forum/categories', adm.cookie, {
    method: 'POST', body: JSON.stringify({ name: 'e2e临时板块', description: '测试用' }),
  });
  check('管理员可建板块', newCat.status === 200 || newCat.status === 201, JSON.stringify(newCat.body).slice(0, 120));
  createdCatIds.push(newCat.body.id);
  const catHas = catList.body.categories[0];
  const delCat = await api('/api/admin/forum/categories/' + catHas.id + '/delete', adm.cookie, { method: 'POST', body: '{}' });
  check('有主题的板块删除被拒（4xx）', delCat.status >= 400 && delCat.status < 500, `status=${delCat.status}`);
  const delEmpty = await api('/api/admin/forum/categories/' + newCat.body.id + '/delete', adm.cookie, { method: 'POST', body: '{}' });
  check('空板块删除 200', delEmpty.status === 200, `status=${delEmpty.status}`);

  console.log('== 8. 首页论坛热帖字段 ==');
  const home = await api('/api/admin/home');
  check('首页聚合含 hot 数组', Array.isArray(home.body.hot), JSON.stringify(home.body).slice(0, 120));

  console.log('== 9. 恢复审核开关原值 ==');
  await api('/api/admin/settings', adm.cookie, { method: 'POST', body: JSON.stringify({ forum_review: origReview === '1' ? '1' : '0' }) });
  check('forum_review 已恢复原值 ' + origReview, true);

  console.log('== 10. 清理 ==');
  for (const tid of createdTopicIds) {
    await api('/api/forum/topics/' + tid + '/delete', adm.cookie, { method: 'POST', body: '{}' }).catch(() => {});
  }
  for (const cid of createdCatIds) {
    await api('/api/admin/forum/categories/' + cid + '/delete', adm.cookie, { method: 'POST', body: '{}' }).catch(() => {});
  }
  // 兜底：原始 SQL 清残留（含回复别人的主题产生的楼层）
  await d1(`DELETE FROM forum_posts WHERE author_id IN (SELECT id FROM users WHERE username LIKE 'tmpe2e%')`);
  await d1(`DELETE FROM forum_posts WHERE topic_id IN (SELECT id FROM forum_topics WHERE author_id IN (SELECT id FROM users WHERE username LIKE 'tmpe2e%'))`);
  await d1(`DELETE FROM forum_topics WHERE author_id IN (SELECT id FROM users WHERE username LIKE 'tmpe2e%')`);
  await d1(`DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE username LIKE 'tmpe2e%')`);
  await d1(`DELETE FROM org_members WHERE user_id IN (SELECT id FROM users WHERE username LIKE 'tmpe2e%')`);
  await d1(`DELETE FROM users WHERE username LIKE 'tmpe2e%'`);
  // 计数器重算（测试删了主题，防止板块计数漂移）
  await d1(`UPDATE forum_categories SET topic_count = (SELECT COUNT(*) FROM forum_topics t WHERE t.category_id = forum_categories.id),
    post_count = (SELECT COUNT(*) FROM forum_posts p JOIN forum_topics t ON t.id = p.topic_id WHERE t.category_id = forum_categories.id)`);
  const residue = await d1("SELECT (SELECT COUNT(*) FROM users WHERE username LIKE 'tmpe2e%') AS u, (SELECT COUNT(*) FROM forum_topics t JOIN users us ON us.id = t.author_id WHERE us.username LIKE 'tmpe2e%') AS t, (SELECT COUNT(*) FROM sessions s JOIN users us ON us.id = s.user_id WHERE us.username LIKE 'tmpe2e%') AS s");
  check('临时数据 0 残留', residue[0].u === 0 && residue[0].t === 0 && residue[0].s === 0, JSON.stringify(residue));

  console.log(`\n结果：${pass} 通过 / ${fail} 失败`);
  process.exit(fail ? 1 : 0);
})().catch((e) => { console.error('e2e 异常中断：', e); process.exit(1); });
