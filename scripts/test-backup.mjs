// 本地全链路验证 backup-worker.js 的 doBackup：
// 用 D1 HTTP API 模拟 worker 的 env.db，跑真实导出 + 真实 GitHub PUT
// 用法：node scripts/test-backup.mjs
import { readFileSync } from 'node:fs';

const T = readFileSync('.cf-token', 'utf8').trim();
const GH = readFileSync('.gh-token', 'utf8').trim();
const A = 'ce40324a6c5953f0153dd198d28307b9';
const DB = 'b09a1a8b-ae50-44fa-96d9-d9376548f28e';
const REPO = process.env.GH_BACKUP_REPO || 'yanzien/ningwai-backups';

// 模拟 worker D1 binding（prepare().all()）
const db = {
  prepare: (sql) => ({
    all: async () => {
      for (let i = 1; i <= 8; i++) {
        try {
          const r = await fetch(`https://api.cloudflare.com/client/v4/accounts/${A}/d1/database/${DB}/query`, {
            method: 'POST',
            headers: { Authorization: `Bearer ${T}`, 'Content-Type': 'application/json' },
            body: JSON.stringify({ sql }),
            signal: AbortSignal.timeout(30000),
          });
          const d = await r.json();
          if (d.errors?.length) throw new Error(JSON.stringify(d.errors).slice(0, 300));
          return { results: d.result?.[0]?.results || [] };
        } catch (e) {
          if (i === 8) throw e;
          await new Promise((r) => setTimeout(r, 1000 * i));
        }
      }
    },
  }),
};

const { doBackup } = await import('../src/backup-worker.js');
const r = await doBackup({ GH_BACKUP_TOKEN: GH, GH_BACKUP_REPO: REPO, db });
console.log('doBackup 结果:', JSON.stringify(r, null, 2));

// 下载刚推送的文件验证可读
if (r.ok) {
  const g = await fetch(`https://api.github.com/repos/${REPO}/contents/${r.path}`, {
    headers: { Authorization: `Bearer ${GH}`, Accept: 'application/vnd.github+json' },
  });
  const d = await g.json();
  // Contents API 对 >1MB 的文件不返回正文，需改用 Blobs API 按 sha 取
  let body;
  if (d.content) {
    body = Buffer.from(d.content, 'base64').toString('utf8');
  } else {
    const b = await fetch(`https://api.github.com/repos/${REPO}/git/blobs/${d.sha}`, {
      headers: { Authorization: `Bearer ${GH}`, Accept: 'application/vnd.github+json' },
    });
    const bd = await b.json();
    body = Buffer.from(bd.content, 'base64').toString('utf8');
  }
  const lines = body.split('\n');
  console.log(`\n下载验证：${r.path} ${(body.length / 1024).toFixed(1)}KB ${lines.length} 行`);
  console.log('头部:', lines.slice(0, 4).join(' / ').slice(0, 120));
  const usersLine = lines.find((l) => l.startsWith('INSERT OR REPLACE INTO users'));
  console.log('users 首行样例:', usersLine ? usersLine.slice(0, 150) + '…' : '(无)');
  const blobLine = lines.find((l) => l.startsWith("INSERT OR REPLACE INTO wiki_files"));
  console.log('wiki_files 首行样例:', blobLine ? blobLine.slice(0, 100) + '…' : '(无 BLOB 数据)');
  process.exit(r.ok ? 0 : 1);
}
process.exit(1);
