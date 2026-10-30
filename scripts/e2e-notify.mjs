// 端到端实测（v2.3）：站内通知 / 全站搜索 / wiki 回滚
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/e2e-notify.mjs
// 造两个临时账号（adm + u1），测完自动清理并核实 0 残留。
import { pbkdf2Sync, randomBytes, randomUUID } from 'node:crypto';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB_UUID = 'b09a1a8b-ae50-44fa-96d9-d9376548f28e';
const BASE = 'https://ningwai.pages.dev';
const ITER = 100000;
const P = 'tmpns-'; // 本脚本临时数据前缀

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

const createdTopicIds = [];
const createdPageIds = [];
const createdNotifIds = [];
const createdNewsIds = [];

(async () => {
  console.log('== 0. 预检 ==');
  const pre = await d1(`SELECT COUNT(*) AS n FROM users WHERE username LIKE '${P}%'`);
  check('无历史残留账号', pre[0].n === 0, JSON.stringify(pre));
  const tbl = await d1("SELECT name FROM sqlite_master WHERE type='table' AND name='notifications'");
  check('notifications 表已建', tbl.length === 1);

  console.log('== 1. 造临时账号（adm 网站管理员 + u1 普通用户） ==');
  const adm = await mkUser(P + 'adm', 'website_admin');
  const u1 = await mkUser(P + 'u1', 'user');
  check('账号创建', !!(adm.id && u1.id));

  console.log('== 2. 论坛审核开关：先关（adm 发的主题直接上线） ==');
  const st0 = await api('/api/admin/settings', adm.cookie);
  const origReview = st0.body?.settings?.forum_review ?? '1';
  await api('/api/admin/settings', adm.cookie, { method: 'PUT', body: JSON.stringify({ forum_review: '0' }) });

  console.log('== 3. 通知：论坛回复触发 ==');
  const catId = (await d1('SELECT id FROM forum_categories ORDER BY id LIMIT 1'))[0].id;
  const tp = await api(`/api/forum/categories/${catId}/topics`, adm.cookie, {
    method: 'POST', body: JSON.stringify({ title: P + '通知测试主题', content: '主题正文' }),
  });
  check('adm 发主题 200', tp.status === 200, JSON.stringify(tp.body).slice(0, 150));
  const tid = tp.body.id;
  if (tid) createdTopicIds.push(tid);
  const rp = await api(`/api/forum/topics/${tid}/posts`, u1.cookie, {
    method: 'POST', body: JSON.stringify({ content: '这是一条测试回复' }),
  });
  check('u1 回复 200', rp.status === 200, JSON.stringify(rp.body).slice(0, 150));
  const n1 = await api('/api/notifications', adm.cookie);
  check('adm 收到回复通知', n1.status === 200 && n1.body.unread === 1 && n1.body.items[0]?.type === 'forum_reply', JSON.stringify(n1.body).slice(0, 200));
  check('通知标题含主题名', (n1.body.items[0]?.title || '').includes(P + '通知测试主题'), n1.body.items[0]?.title);
  check('通知链接指向主题', n1.body.items[0]?.link === `#/forum/t/${tid}`, n1.body.items[0]?.link);
  if (n1.body.items[0]) createdNotifIds.push(n1.body.items[0].id);
  // u1 自己不应收到（回复的不是自己的主题）
  const n1u = await api('/api/notifications', u1.cookie);
  check('u1 无通知（回复的不是自己主题）', n1u.body.unread === 0, JSON.stringify(n1u.body).slice(0, 150));

  console.log('== 4. 通知：已读流转 ==');
  const nid = n1.body.items[0].id;
  const rd = await api('/api/notifications/read', adm.cookie, { method: 'POST', body: JSON.stringify({ id: nid }) });
  check('标记单条已读 200', rd.status === 200);
  const n2 = await api('/api/notifications', adm.cookie);
  check('未读数归 0', n2.body.unread === 0, JSON.stringify(n2.body.unread));
  check('该条 is_read=1', n2.body.items.find((x) => x.id === nid)?.is_read === 1);
  // 再造一条 → 全部已读
  const rp2 = await api(`/api/forum/topics/${tid}/posts`, u1.cookie, {
    method: 'POST', body: JSON.stringify({ content: '第二条测试回复' }),
  });
  check('u1 二次回复 200', rp2.status === 200);
  const n3 = await api('/api/notifications', adm.cookie);
  check('未读数回到 1', n3.body.unread === 1);
  const rall = await api('/api/notifications/read', adm.cookie, { method: 'POST', body: JSON.stringify({ all: true }) });
  check('全部已读 200', rall.status === 200);
  const n4 = await api('/api/notifications', adm.cookie);
  check('未读数归 0（全部已读）', n4.body.unread === 0);
  check('全部 is_read=1', n4.body.items.every((x) => x.is_read === 1));
  const unauth = await api('/api/notifications');
  check('未登录 401', unauth.status === 401);

  console.log('== 5. 搜索：wiki / forum / news / 空结果 ==');
  const mk = await api('/api/wiki/pages', adm.cookie, {
    method: 'POST', body: JSON.stringify({ kind: 'page', title: P + '搜索测试词条', content: '# ' + P + '搜索测试词条\n正文' }),
  });
  check('adm 建词条 200', mk.status === 200, JSON.stringify(mk.body).slice(0, 150));
  if (mk.body.id) createdPageIds.push(mk.body.id);
  const mkSlug = mk.body.slug;
  const s1 = await api('/api/search?q=' + encodeURIComponent(P + '搜索测试词条'));
  check('搜索命中 wiki 词条', s1.status === 200 && s1.body.wiki.some((w) => w.slug === mkSlug), JSON.stringify(s1.body).slice(0, 200));
  check('搜索不串主题（关键词只匹配词条）', s1.body.forum.length === 0, JSON.stringify(s1.body.forum).slice(0, 100));
  const s1f = await api('/api/search?q=' + encodeURIComponent(P + '通知测试主题'));
  check('搜索命中 forum 主题', s1f.body.forum.some((t) => t.id === tid), JSON.stringify(s1f.body.forum).slice(0, 200));
  // news：插一条已发布资讯验证三源齐全
  const nw = await d1("INSERT INTO news (title, slug, summary, content, author_id, status, published_at) VALUES (?,?,?,?,?,'published',datetime('now'))",
    [P + '搜索测试资讯', P + 'news-slug', '摘要内容', '正文内容', adm.id]);
  const newsId = nw[0]?.id || (await d1('SELECT id FROM news WHERE slug = ?', [P + 'news-slug']))[0]?.id;
  const s1n = await api('/api/search?q=' + encodeURIComponent(P + '搜索测试资讯'));
  check('搜索命中 news 资讯', s1n.status === 200 && s1n.body.news.some((n) => n.id === newsId), JSON.stringify(s1n.body).slice(0, 200));
  if (newsId) createdNewsIds.push(newsId);
  const s2 = await api('/api/search?q=' + encodeURIComponent('zzz不存在的关键词xyz'));
  check('无结果时三组皆空', s2.body.wiki.length === 0 && s2.body.news.length === 0 && s2.body.forum.length === 0);
  const s3 = await api('/api/search?q=');
  check('空关键词被拒', s3.status !== 200, String(s3.status));
  // LIKE 通配符转义：搜 % 不应匹配全部
  const s4 = await api('/api/search?q=' + encodeURIComponent('%'));
  check('百分号转义（不返回全表）', s4.body.wiki.length <= 5, JSON.stringify(s4.body.wiki.length));

  console.log('== 6. 回滚：v1 → v2 → 回滚到 v1 ==');
  const sv2 = await api(`/api/wiki/pages/${encodeURIComponent(mkSlug)}/save`, adm.cookie, {
    method: 'POST', body: JSON.stringify({ content: '# 第二版内容' }),
  });
  check('保存第二版 200', sv2.status === 200, JSON.stringify(sv2.body).slice(0, 150));
  const cur2 = await api('/api/wiki/pages/' + encodeURIComponent(mkSlug));
  check('当前为第二版', (cur2.body.content || '').includes('第二版'), JSON.stringify(cur2.body).slice(0, 120));
  const hist = await api('/api/wiki/pages/' + encodeURIComponent(mkSlug) + '/history');
  const approved = hist.body.revisions.filter((r) => r.status === 'approved');
  check('历史有两条已通过修订', approved.length === 2, JSON.stringify(approved).slice(0, 200));
  const firstRev = approved[approved.length - 1].id; // 最早那条 = 第一版
  const rb = await api('/api/wiki/revisions/' + firstRev + '/rollback', adm.cookie, { method: 'POST', body: '{}' });
  check('回滚 200', rb.status === 200, JSON.stringify(rb.body).slice(0, 150));
  const cur3 = await api('/api/wiki/pages/' + encodeURIComponent(mkSlug));
  check('回滚后内容为第一版', (cur3.body.content || '').includes('第一版') || (cur3.body.content || '').includes(P + '搜索测试词条'), JSON.stringify(cur3.body).slice(0, 120));
  // 负路径：u1（非管理员）不能回滚
  const rb2 = await api('/api/wiki/revisions/' + firstRev + '/rollback', u1.cookie, { method: 'POST', body: '{}' });
  check('普通用户回滚 403', rb2.status === 403, String(rb2.status));
  const rb3 = await api('/api/wiki/revisions/99999999/rollback', adm.cookie, { method: 'POST', body: '{}' });
  check('回滚不存在修订 404', rb3.status === 404, String(rb3.status));

  console.log('== 7. 清理 ==');
  // 恢复论坛审核开关
  await api('/api/admin/settings', adm.cookie, { method: 'PUT', body: JSON.stringify({ forum_review: origReview }) });
  // 历史残留兜底：早前 FATAL 轮次可能留下同前缀数据，先按前缀全清
  await d1('DELETE FROM forum_posts WHERE topic_id IN (SELECT id FROM forum_topics WHERE title LIKE ?)', [P + '%']);
  await d1('DELETE FROM forum_topics WHERE title LIKE ?', [P + '%']);
  await d1('DELETE FROM wiki_revisions WHERE page_id IN (SELECT id FROM wiki_pages WHERE title LIKE ?)', [P + '%']);
  await d1('DELETE FROM wiki_files WHERE page_id IN (SELECT id FROM wiki_pages WHERE title LIKE ?)', [P + '%']);
  await d1('DELETE FROM wiki_pages WHERE title LIKE ?', [P + '%']);
  await d1('DELETE FROM news WHERE title LIKE ?', [P + '%']);
  await d1("UPDATE site_settings SET value = (SELECT COUNT(*) FROM wiki_pages) WHERE key = 'wiki_page_count'");
  // API 删主题（级联删 posts）
  for (const t of createdTopicIds) await api(`/api/forum/topics/${t}/delete`, adm.cookie, { method: 'POST', body: '{}' });
  // API 删词条（用创建时返回的真实 slug）
  for (const p of createdPageIds) {
    const row = (await d1('SELECT slug FROM wiki_pages WHERE id = ?', [p]))[0];
    if (row) await api('/api/wiki/pages/' + encodeURIComponent(row.slug), adm.cookie, { method: 'DELETE', body: '{}' });
  }
  // 兜底：按 id 清理（不用 LIKE）
  for (const t of createdTopicIds) {
    await d1('DELETE FROM forum_posts WHERE topic_id = ?', [t]);
    await d1('DELETE FROM forum_topics WHERE id = ?', [t]);
  }
  for (const p of createdPageIds) {
    await d1('DELETE FROM wiki_revisions WHERE page_id = ?', [p]);
    await d1('DELETE FROM wiki_files WHERE page_id = ?', [p]);
    await d1('DELETE FROM class_teachers WHERE class_page_id = ? OR teacher_page_id = ?', [p, p]);
    await d1('DELETE FROM wiki_pages WHERE id = ?', [p]);
  }
  for (const n of createdNewsIds) await d1('DELETE FROM news WHERE id = ?', [n]);
  await d1('DELETE FROM notifications WHERE user_id IN (SELECT id FROM users WHERE username LIKE ?)', [P + '%']);
  await d1('DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE username LIKE ?)', [P + '%']);
  await d1('DELETE FROM users WHERE username LIKE ?', [P + '%']);
  const post = await d1(`SELECT
    (SELECT COUNT(*) FROM users WHERE username LIKE '${P}%') AS u,
    (SELECT COUNT(*) FROM forum_topics WHERE title LIKE '${P}%') AS t,
    (SELECT COUNT(*) FROM wiki_pages WHERE title LIKE '${P}%') AS pg,
    (SELECT COUNT(*) FROM notifications WHERE title LIKE '%${P}%') AS n`);
  check('四类临时数据 0 残留', post[0].u === 0 && post[0].t === 0 && post[0].pg === 0 && post[0].n === 0, JSON.stringify(post[0]));
  const pc = await d1("SELECT value FROM site_settings WHERE key = 'wiki_page_count'");
  const actual = await d1('SELECT COUNT(*) AS n FROM wiki_pages');
  console.log(`  wiki_page_count=${pc[0]?.value} 实物=${actual[0].n}`);
  check('页面计数器与实物一致', String(pc[0]?.value) === String(actual[0].n), `${pc[0]?.value} vs ${actual[0].n}`);

  console.log(`\n结果：${pass} 过 / ${fail} 挂`);
  process.exit(fail > 0 ? 1 : 0);
})().catch((e) => { console.error('FATAL', e.message); process.exit(1); });
