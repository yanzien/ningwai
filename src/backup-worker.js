// 每日 D1 备份 Worker（独立部署，不走 Pages——Pages 无 Cron Triggers）
// 每天 UTC 16:00（北京 0 00）全量导出 D1 → SQL dump → push 到 GitHub 私有备份仓库（env.GH_BACKUP_REPO）backups/
// 手动测试：curl https://ningwai-backup.<subdomain>.workers.dev/backup
export default {
  async fetch(req, env, ctx) {
    const url = new URL(req.url);
    if (url.pathname === '/backup') {
      const r = await doBackup(env);
      return new Response(JSON.stringify(r, null, 2), { headers: { 'Content-Type': 'application/json' } });
    }
    return new Response('ningwai d1 backup worker', { status: 200 });
  },
  async scheduled(event, env, ctx) {
    ctx.waitUntil(doBackup(env));
  },
};

// 导出供本地测试（scripts/test-backup.mjs 模拟 env 跑全链路）
export { doBackup };

function sqlVal(v) {
  if (v === null || v === undefined) return 'NULL';
  if (typeof v === 'number') return String(v);
  // D1 SELECT 出的 BLOB 是数字数组
  if (Array.isArray(v) && v.length && typeof v[0] === 'number') {
    return "X'" + v.map((b) => b.toString(16).padStart(2, '0')).join('') + "'";
  }
  if (typeof v === 'object') return "'" + JSON.stringify(v).replace(/'/g, "''") + "'";
  return "'" + String(v).replace(/'/g, "''") + "'";
}

async function doBackup(env) {
  const tok = env.GH_BACKUP_TOKEN;
  if (!tok) return { ok: false, error: 'GH_BACKUP_TOKEN 未配置' };
  // 备份目标仓库（私有）：owner/repo，默认本项目的备份仓
  const repo = env.GH_BACKUP_REPO || 'yanzien/ningwai-backups';
  const db = env.db;
  // 1. 表清单（跳过 sqlite 内部表和 KV 元数据表）
  const tables = (await db.prepare(
    "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' AND name != '_cf_KV' ORDER BY name"
  ).all()).results.map((r) => r.name);
  const lines = [
    '-- 宁外八一 D1 全量备份',
    `-- 导出于 ${new Date().toISOString()}`,
    '-- 恢复：node scripts/d1-direct.mjs ningwai-db < 本文件',
    'PRAGMA foreign_keys = OFF;',
    '',
  ];
  let totalRows = 0;
  for (const t of tables) {
    const cols = (await db.prepare(`PRAGMA table_info(${t})`).all()).results.map((c) => c.name);
    const rows = (await db.prepare(`SELECT * FROM ${t}`).all()).results;
    lines.push(`-- ===== ${t}（${rows.length} 行）=====`);
    for (const row of rows) {
      const vals = cols.map((c) => sqlVal(row[c]));
      lines.push(`INSERT OR REPLACE INTO ${t} (${cols.map((c) => `"${c}"`).join(',')}) VALUES (${vals.join(',')});`);
    }
    lines.push('');
    totalRows += rows.length;
  }
  const content = lines.join('\n');
  const date = new Date().toISOString().slice(0, 10);
  const path = `backups/d1-${date}.sql`;
  // 2. 推 GitHub（Contents API；同一天重复跑覆盖旧文件）
  let sha;
  try {
    const g = await fetch(`https://api.github.com/repos/${repo}/contents/${path}`, {
      headers: { Authorization: `Bearer ${tok}`, Accept: 'application/vnd.github+json' },
    });
    if (g.ok) sha = (await g.json()).sha;
  } catch { /* 首次没有该文件 */ }
  const put = await fetch(`https://api.github.com/repos/${repo}/contents/${path}`, {
    method: 'PUT',
    headers: { Authorization: `Bearer ${tok}`, Accept: 'application/vnd.github+json', 'Content-Type': 'application/json' },
    body: JSON.stringify({
      message: `backup: d1 dump ${date}（${totalRows} 行 / ${tables.length} 表）`,
      content: btoa(unescape(encodeURIComponent(content))),
      ...(sha ? { sha } : {}),
    }),
  });
  if (!put.ok) {
    const t = await put.text();
    return { ok: false, error: `GitHub PUT ${put.status}: ${t.slice(0, 200)}` };
  }
  return { ok: true, path, tables: tables.length, rows: totalRows, bytes: content.length };
}
