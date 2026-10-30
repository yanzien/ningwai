// v1.6 端到端实测：懒加载修复 + 删除功能全链路 + 审核 diff
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/e2e-v16.mjs
// 造两个临时账号（org_admin + 普通用户），测完自动清理并核实 0 残留。
import { pbkdf2Sync, randomBytes, randomUUID } from 'node:crypto';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB = 'ningwai-db';
const BASE = 'https://ningwai.pages.dev';
const ITER = 100000;

if (!T) { console.error('missing CLOUDFLARE_API_TOKEN'); process.exit(1); }

// ---------- D1 裸 API（含重试） ----------
async function d1(sql, params = []) {
  const dbUuid = 'b09a1a8b-ae50-44fa-96d9-d9376548f28e';
  let e;
  for (let i = 1; i <= 8; i++) {
    try {
      const r = await fetch(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database/${dbUuid}/query`, {
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
async function mkUser(username, role, orgRole) {
  const salt = randomBytes(16);
  const hash = b64(pbkdf2Sync('e2e-pass-2026', salt, ITER, 32, 'sha256'));
  await d1('INSERT INTO users (username, pass_hash, salt, display_name, role) VALUES (?,?,?,?,?)',
    [username, hash, b64(salt), username, role]);
  const u = (await d1('SELECT id FROM users WHERE username = ?', [username]))[0];
  await d1('INSERT INTO org_members (org_id, user_id, role, status) VALUES (1,?,?, "approved")'.replace('?,?', '?,?'),
    [u.id, orgRole]);
  const token = randomUUID().replace(/-/g, '');
  const exp = new Date(Date.now() + 3600e3).toISOString();
  await d1('INSERT INTO sessions (token, user_id, ua, expires_at) VALUES (?,?,?,?)', [token, u.id, 'e2e', exp]);
  return { id: u.id, cookie: `session=${token}` };
}

// ---------- API ----------
async function api(path, cookie, opts = {}) {
  const r = await fetch(BASE + path, {
    ...opts,
    headers: { Cookie: cookie, 'Content-Type': 'application/json', ...(opts.headers || {}) },
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
  console.log('== 0. 预检：临时账号残留 ==');
  const pre = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpe2e%'");
  check('无历史残留 tmpe2e 账号', pre[0].n === 0, JSON.stringify(pre));

  console.log('== 1. 造临时账号（管理员 + 普通用户） ==');
  const adm = await mkUser('tmpe2e-adm', 'user', 'org_admin');
  const usr = await mkUser('tmpe2e-usr', 'user', 'member');
  const meA = await api('/api/auth/me', adm.cookie);
  check('管理员 /me 200 且识别为组织管理员', meA.status === 200 && meA.body.memberships?.some((m) => m.role === 'org_admin'), JSON.stringify(meA.body).slice(0, 150));
  const meU = await api('/api/auth/me', usr.cookie);
  check('普通用户 /me 200', meU.status === 200 && meU.body.user?.username === 'tmpe2e-usr');

  console.log('== 2. 删除功能全链路（用户 10-18 报的 bug） ==');
  // 普通用户建词条（默认 create_edit_review → 待审）
  const mk = await api('/api/wiki/pages', usr.cookie, {
    method: 'POST',
    body: JSON.stringify({ title: 'e2e测试词条-待删', kind: 'page', content: '初始内容' }),
  });
  check('普通用户可新建词条', mk.status === 200 || mk.status === 201, JSON.stringify(mk.body).slice(0, 120));
  const testSlug = mk.body.slug || mk.body.id;
  // 管理员删除该词条
  const del = await api('/api/wiki/pages/' + encodeURIComponent(testSlug), adm.cookie, { method: 'DELETE', body: '{}' });
  check('管理员 DELETE 词条返回 200', del.status === 200, `status=${del.status} ${JSON.stringify(del.body).slice(0, 120)}`);
  const afterDel = await api('/api/wiki/pages/' + encodeURIComponent(testSlug), adm.cookie);
  check('删除后详情 404', afterDel.status === 404, `status=${afterDel.status}`);
  // 非管理员删除应 403（负路径）
  const mk2 = await api('/api/wiki/pages', adm.cookie, {
    method: 'POST',
    body: JSON.stringify({ title: 'e2e测试词条-权限', kind: 'page', content: 'x' }),
  });
  const del2 = await api('/api/wiki/pages/' + encodeURIComponent(mk2.body.slug), usr.cookie, { method: 'DELETE', body: '{}' });
  check('普通用户删除返回 403', del2.status === 403, `status=${del2.status}`);

  console.log('== 3. 审核 diff（v1.5 功能补测） ==');
  const rev = await api('/api/wiki/pages/' + encodeURIComponent(mk2.body.slug) + '/revisions', usr.cookie, {
    method: 'POST',
    body: JSON.stringify({ content: '修订后的内容\n第二行', message: 'e2e 修订' }),
  });
  check('普通用户提交修订', rev.status === 200 && rev.body.direct === false, JSON.stringify(rev.body).slice(0, 120));
  const revs = await api('/api/wiki/revisions?status=pending', adm.cookie);
  const myRev = (revs.body.revisions || revs.body.items || []).find((r) => r.slug === mk2.body.slug || r.page_slug === mk2.body.slug);
  check('待审列表含该修订', !!myRev, JSON.stringify(revs.body).slice(0, 150));
  if (myRev) {
    const diff = await api(`/api/wiki/revisions/${myRev.id}/diff`, adm.cookie);
    check('diff 接口 200 且返回修订与当前版内容', diff.status === 200 && typeof diff.body.revision?.content === 'string' && typeof diff.body.current === 'string', JSON.stringify(diff.body).slice(0, 150));
    const ap = await api(`/api/wiki/revisions/${myRev.id}/approve`, adm.cookie, { method: 'POST', body: '{}' });
    check('通过修订 200', ap.status === 200, `status=${ap.status}`);
  }

  console.log('== 4. 懒加载与树（v1.6 优化验证） ==');
  const tree = await api('/api/wiki/tree');
  const stuInTree = (tree.body.nodes || []).filter((n) => n.kind === 'student').length;
  check('tree 默认不含学生节点', stuInTree === 0, `student=${stuInTree}`);
  check('tree 节点数 ~100（原 3689）', tree.body.nodes.length < 200, `n=${tree.body.nodes.length}`);
  const stu = await api('/api/wiki/pages?kind=student&class=J2803&size=all');
  check('班级学生按需拉取 45 人', stu.body.pages?.length === 45, `n=${stu.body.pages?.length}`);
  const home1 = await api('/api/admin/home');
  const home2 = await api('/api/admin/home');
  check('admin/home 连续两次 200 且数据一致', home1.status === 200 && home2.status === 200 && home1.body.page_count === home2.body.page_count);

  console.log('== 5. 清理临时数据 ==');
  const pages = await d1("SELECT id FROM wiki_pages WHERE title LIKE 'e2e测试词条%'");
  for (const p of pages) {
    await d1('DELETE FROM wiki_revisions WHERE page_id = ?', [p.id]);
    await d1('DELETE FROM wiki_files WHERE page_id = ?', [p.id]);
    await d1('DELETE FROM class_teachers WHERE class_page_id = ? OR teacher_page_id = ?', [p.id, p.id]);
    await d1('DELETE FROM wiki_pages WHERE id = ?', [p.id]);
  }
  await d1("DELETE FROM audit_logs WHERE target_type = 'wiki_page' AND detail LIKE '%e2e测试%'");
  await d1('DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE username LIKE "tmpe2e%")'.replace(/"/g, "'"));
  await d1('DELETE FROM org_members WHERE user_id IN (SELECT id FROM users WHERE username LIKE "tmpe2e%")'.replace(/"/g, "'"));
  await d1('DELETE FROM users WHERE username LIKE "tmpe2e%"'.replace(/"/g, "'"));

  console.log('== 6. 核实清理结果 ==');
  const u0 = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpe2e%'");
  const p0 = await d1("SELECT COUNT(*) AS n FROM wiki_pages WHERE title LIKE 'e2e测试词条%'");
  const r0 = await d1("SELECT COUNT(*) AS n FROM wiki_revisions WHERE message LIKE '%e2e%'");
  check('临时用户 0 残留', u0[0].n === 0, JSON.stringify(u0));
  check('测试词条 0 残留', p0[0].n === 0, JSON.stringify(p0));
  check('e2e 修订 0 残留', r0[0].n === 0, JSON.stringify(r0));
  const pc = await d1('SELECT COUNT(*) AS n FROM wiki_pages');
  console.log(`  wiki_pages 总数: ${pc[0].n}（10-17 时为 3689）`);

  console.log(`\n===== 结果: ${pass} 通过, ${fail} 失败 =====`);
  process.exit(fail ? 1 : 0);
})().catch((e) => { console.error('FATAL', e); process.exit(1); });
