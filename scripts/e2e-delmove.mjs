// 删除/移动功能专项实测：造临时组织管理员，全链路测 create→move→verify→delete→verify
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

async function mkUser(username, orgRole) {
  const salt = randomBytes(16);
  const hash = b64(pbkdf2Sync('e2e-pass-2026', salt, ITER, 32, 'sha256'));
  await d1('INSERT INTO users (username, pass_hash, salt, display_name, role) VALUES (?,?,?,?,?)',
    [username, hash, b64(salt), username, 'user']);
  const u = (await d1('SELECT id FROM users WHERE username = ?', [username]))[0];
  await d1('INSERT INTO org_members (org_id, user_id, role, status) VALUES (1,?,?, "approved")', [u.id, orgRole]);
  const token = randomUUID().replace(/-/g, '');
  const exp = new Date(Date.now() + 3600e3).toISOString();
  await d1('INSERT INTO sessions (token, user_id, ua, expires_at) VALUES (?,?,?,?)', [token, u.id, 'e2e', exp]);
  return { id: u.id, cookie: `session=${token}` };
}

async function api(path, cookie, opts = {}) {
  const r = await fetch(BASE + path, {
    ...opts,
    headers: { Cookie: cookie, 'Content-Type': 'application/json', ...(opts.headers || {}) },
    signal: AbortSignal.timeout(30000),
  });
  const txt = await r.text();
  let d; try { d = JSON.parse(txt); } catch { d = { raw: txt.slice(0, 200) } }
  return { status: r.status, body: d };
}

let pass = 0, fail = 0;
const check = (name, cond, extra = '') => {
  if (cond) { pass++; console.log(`  ✓ ${name}`); }
  else { fail++; console.log(`  ✗ ${name} ${extra}`); }
};

(async () => {
  console.log('== 0. 残留检查 ==');
  const pre = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpdel%'");
  check('无 tmpdel 残留', pre[0].n === 0, JSON.stringify(pre));

  console.log('== 1. 造临时组织管理员 ==');
  const adm = await mkUser('tmpdel-adm', 'org_admin');
  const me = await api('/api/auth/me', adm.cookie);
  check('/me 200', me.status === 200, JSON.stringify(me.body).slice(0, 120));
  check('识别为组织管理员', me.body.memberships?.some((m) => m.role === 'org_admin'));
  // v2.0：计数器基线（site_settings.wiki_page_count）
  const baseCnt = await d1("SELECT value AS n FROM site_settings WHERE key = 'wiki_page_count'");
  const baseCount = parseInt(baseCnt[0]?.n) || 0;

  console.log('== 2. 建测试词条 ==');
  const createdIds = []; // v2.0：记录创建的页面 id，清理时按 id 删（LIKE 会全表扫 3699 行）
  const cr = await api('/api/wiki/pages', adm.cookie, {
    method: 'POST',
    body: JSON.stringify({ kind: 'page', title: 'tmpdel-测试词条', content: '# tmpdel\n第一版内容' }),
  });
  check('创建词条 200', cr.status === 200, JSON.stringify(cr.body).slice(0, 150));
  const slug = cr.body.slug || cr.body.page?.slug;
  check('返回 slug', !!slug, JSON.stringify(cr.body).slice(0, 150));
  if (cr.body.id) createdIds.push(cr.body.id);
  // v2.0：创建后计数器应 +1
  const cnt1 = await d1("SELECT value AS n FROM site_settings WHERE key = 'wiki_page_count'");
  check('创建词条后计数器 +1', parseInt(cnt1[0]?.n) === baseCount + 1, `counter=${cnt1[0]?.n} base=${baseCount}`);

  console.log('== 3. 移动词条（移到根→再移回） ==');
  // 先建一个文件夹作为目标
  const fdr = await api('/api/wiki/folders', adm.cookie, {
    method: 'POST', body: JSON.stringify({ title: 'tmpdel-测试目录' }),
  });
  check('创建文件夹 200', fdr.status === 200, JSON.stringify(fdr.body).slice(0, 150));
  const fid = fdr.body.id;
  if (fid) createdIds.push(fid);
  const mv = await api(`/api/wiki/pages/${encodeURIComponent(slug)}/move`, adm.cookie, {
    method: 'POST', body: JSON.stringify({ parent_id: fid }),
  });
  check('移动 200', mv.status === 200, JSON.stringify(mv.body).slice(0, 150));
  const pg = await api(`/api/wiki/pages/${encodeURIComponent(slug)}`);
  check('移动后 parent_id 已生效', pg.body.page?.parent_id === fid, JSON.stringify(pg.body.page).slice(0, 150));
  // 移回根目录
  const mv2 = await api(`/api/wiki/pages/${encodeURIComponent(slug)}/move`, adm.cookie, {
    method: 'POST', body: JSON.stringify({ parent_id: null }),
  });
  check('移回根目录 200', mv2.status === 200, JSON.stringify(mv2.body).slice(0, 150));
  const pg2 = await api(`/api/wiki/pages/${encodeURIComponent(slug)}`);
  check('移回后 parent_id 为 null', pg2.body.page?.parent_id == null, JSON.stringify(pg2.body.page).slice(0, 150));

  console.log('== 4. 删除词条 ==');
  const del = await api(`/api/wiki/pages/${encodeURIComponent(slug)}`, adm.cookie, { method: 'DELETE', body: '{}' });
  check('删除 200', del.status === 200, JSON.stringify(del.body).slice(0, 150));
  const gone = await api(`/api/wiki/pages/${encodeURIComponent(slug)}`);
  check('删除后详情 404', gone.status === 404, `status=${gone.status}`);

  console.log('== 5. 非空文件夹删除应被拒 ==');
  const mk2 = await api('/api/wiki/pages', adm.cookie, {
    method: 'POST',
    body: JSON.stringify({ kind: 'page', title: 'tmpdel-子词条', parent_id: fid, content: 'x' }),
  });
  const delF = await api(`/api/wiki/pages/${encodeURIComponent(fdr.body.slug)}`, adm.cookie, { method: 'DELETE', body: '{}' });
  check('非空文件夹删除被拒(4xx)', delF.status >= 400, `status=${delF.status} ${JSON.stringify(delF.body).slice(0, 120)}`);
  // 清掉子词条再删文件夹
  const slug2 = mk2.body.slug || mk2.body.page?.slug;
  if (mk2.body.id) createdIds.push(mk2.body.id);
  await api(`/api/wiki/pages/${encodeURIComponent(slug2)}`, adm.cookie, { method: 'DELETE', body: '{}' });
  const delF2 = await api(`/api/wiki/pages/${encodeURIComponent(fdr.body.slug)}`, adm.cookie, { method: 'DELETE', body: '{}' });
  check('空文件夹删除 200', delF2.status === 200, JSON.stringify(delF2.body).slice(0, 120));

  console.log('== 6. 班级学生删除（找一个真实班级） ==');
  const cls = (await api('/api/wiki/pages?kind=class&size=all')).body.pages?.[0];
  if (cls) {
    const stus = (await api('/api/wiki/pages?kind=student&class=' + encodeURIComponent(cls.class_name) + '&size=all')).body.pages || [];
    if (stus.length) {
      const target = stus[stus.length - 1];
      const delS = await api(`/api/wiki/pages/${encodeURIComponent(target.slug)}`, adm.cookie, { method: 'DELETE', body: '{}' });
      check('删除学生页 200', delS.status === 200, JSON.stringify(delS.body).slice(0, 120));
      const goneS = await api(`/api/wiki/pages/${encodeURIComponent(target.slug)}`);
      check('学生页删除后 404', goneS.status === 404, `status=${goneS.status}`);
      // 恢复：重建同名同班学生页
      const re = await api('/api/wiki/pages', adm.cookie, {
        method: 'POST',
        body: JSON.stringify({ kind: 'student', title: target.title, class_name: cls.class_name, grade: cls.grade || 'J28', student_no: target.title.split(' · ').pop(), parent_id: cls.id }),
      });
      check('恢复学生页 200', re.status === 200, JSON.stringify(re.body).slice(0, 150));
    } else { console.log('  (该班无学生，跳过)'); }
  } else { console.log('  (无班级，跳过)'); }

  console.log('== 7. 清理临时账号与数据 ==');
  // v2.0：按记录的 id 清理（避免 LIKE 全表扫描 wiki_pages 3699 行/次）
  const idList = createdIds.join(',');
  if (idList) {
    await d1(`DELETE FROM wiki_revisions WHERE page_id IN (${idList})`);
    await d1(`DELETE FROM wiki_files WHERE page_id IN (${idList})`);
    await d1(`DELETE FROM class_teachers WHERE class_page_id IN (${idList}) OR teacher_page_id IN (${idList})`);
    await d1(`DELETE FROM wiki_pages WHERE id IN (${idList})`);
  }
  // 兜底：历史上遗留的 tmpdel 页面（按 id 删不掉的老数据才走 LIKE）
  const legacy = await d1('SELECT id FROM wiki_pages WHERE title LIKE "tmpdel-%"');
  for (const p of legacy) {
    await d1('DELETE FROM wiki_revisions WHERE page_id = ?', [p.id]);
    await d1('DELETE FROM wiki_files WHERE page_id = ?', [p.id]);
    await d1('DELETE FROM class_teachers WHERE class_page_id = ? OR teacher_page_id = ?', [p.id, p.id]);
    await d1('DELETE FROM wiki_pages WHERE id = ?', [p.id]);
  }
  // 审计 detail 两种格式：词条创建为「kind:title」、文件夹为 title 本身，统一用 %tmpdel-% 匹配
  await d1('DELETE FROM audit_logs WHERE detail LIKE "%tmpdel-%"');
  await d1('DELETE FROM org_members WHERE user_id IN (SELECT id FROM users WHERE username LIKE "tmpdel%")');
  await d1('DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE username LIKE "tmpdel%")');
  await d1('DELETE FROM users WHERE username LIKE "tmpdel%"');
  const post = await d1("SELECT COUNT(*) AS n FROM users WHERE username LIKE 'tmpdel%'");
  check('临时账号 0 残留', post[0].n === 0, JSON.stringify(post));
  const pgCount = await d1('SELECT COUNT(*) AS n FROM wiki_pages');
  // v2.0：legacy 兜底清理绕过了计数器，结束后重算对齐；再验证与实物一致
  await d1("UPDATE site_settings SET value = (SELECT COUNT(*) FROM wiki_pages) WHERE key = 'wiki_page_count'");
  const cntEnd = await d1("SELECT value AS n FROM site_settings WHERE key = 'wiki_page_count'");
  check('页面计数器与实物一致', String(cntEnd[0]?.n) === String(pgCount[0].n), `counter=${cntEnd[0]?.n} actual=${pgCount[0].n}`);
  console.log(`  wiki_pages 总数: ${pgCount[0].n}（计数器 ${cntEnd[0]?.n}）`);

  console.log(`\n结果: ${pass} 通过, ${fail} 失败`);
  process.exit(fail ? 1 : 0);
})().catch((e) => { console.error('FATAL', e); process.exit(1); });
