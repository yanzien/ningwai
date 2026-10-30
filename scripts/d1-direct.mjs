// 直连 CF D1 HTTP API 执行 SQL（绕开 wrangler 对账号级 token 的兼容问题）
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/d1-direct.mjs <db-name> <sql-file|--sql "">
import { readFileSync } from 'node:fs';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB = process.argv[2]; // 数据库名，如 ningwai-db
if (!T || !DB) { console.error('need CLOUDFLARE_API_TOKEN and db name'); process.exit(1); }

// 解析 SQL 文件：去注释行，按分号拆条
let sqlText = process.argv[3] === '--sql' ? process.argv[4] : readFileSync(process.argv[3], 'utf8');
const stmts = sqlText
  .split('\n')
  .filter((l) => !/^\s*--/.test(l))
  .join('\n')
  .split(';')
  .map((s) => s.trim())
  .filter(Boolean);
console.log(`db=${DB}, ${stmts.length} statement(s)`);

// 带重试的 fetch（GFW 随机丢连接，单次 15s 超时，最多 6 次）
async function fetchRetry(url, opts = {}, tries = 6) {
  let lastErr;
  for (let i = 1; i <= tries; i++) {
    try {
      const res = await fetch(url, { ...opts, signal: AbortSignal.timeout(15000) });
      return res;
    } catch (e) {
      lastErr = e;
      console.error(`  attempt ${i}/${tries} failed: ${e.cause?.code || e.message}`);
      await new Promise((r) => setTimeout(r, 1500 * i));
    }
  }
  throw lastErr;
}

// 查 database uuid
const listRes = await fetchRetry(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database`, { headers: { Authorization: `Bearer ${T}` } });
const list = await listRes.json();
if (!listRes.ok) { console.error('list d1 failed:', JSON.stringify(list).slice(0, 300)); process.exit(1); }
const db = (list.result || []).find((d) => d.name === DB);
if (!db) { console.error('db not found:', DB, 'available:', (list.result || []).map((d) => d.name).join(',')); process.exit(1); }
console.log('db uuid:', db.uuid);

for (const sql of stmts) {
  const res = await fetchRetry(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database/${db.uuid}/query`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${T}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ sql }),
  });
  const d = await res.json().catch(() => ({}));
  if (!res.ok || d.success === false) {
    console.error('FAILED:', sql.slice(0, 80), '…');
    console.error(JSON.stringify(d.errors || d).slice(0, 400));
    process.exit(1);
  }
  const rows = d.result?.[0]?.results;
  if (Array.isArray(rows) && rows.length) {
    console.log('ROWS:', JSON.stringify(rows));
  }
  console.log('OK:', sql.replace(/\s+/g, ' ').slice(0, 70), '| rows_written:', d.result?.[0]?.meta?.rows_written ?? '?');
}
console.log('✅ all statements executed');
