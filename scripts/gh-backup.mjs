// GitHub 源码备份（本地运行）：把源码同步到 yanzien/ningwai-backups 私有备份仓库
// 用法：CLOUDFLARE_API_TOKEN 不需要；node scripts/gh-backup.mjs [--dry-run]
// token 读 .gh-token（gitignore 已排除）；网络走固定 IP + 重试（GFW 规避）
import { readFileSync, writeFileSync, existsSync, readdirSync, statSync } from 'node:fs';
import { createHash } from 'node:crypto';
import { join, relative, sep } from 'node:path';
import { fileURLToPath } from 'node:url';
import { dirname } from 'node:path';

// 注意：勿自定义 undici Agent/lookup——实测会挂死；默认 DNS 直连 api.github.com 即可（2026-10-27 验证）

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const REPO = 'yanzien/ningwai-backups';
const TOK = readFileSync(join(ROOT, '.gh-token'), 'utf8').trim();
const DRY = process.argv.includes('--dry-run');
const API = 'https://api.github.com';

const EXCLUDE_DIRS = new Set(['node_modules', 'pages-build', '.wrangler', 'backups', '.git', '.workbuddy']);
const EXCLUDE_FILES = new Set(['.gh-token', '.cf-token']);

async function gh(method, path, body) {
  for (let i = 1; i <= 8; i++) {
    try {
      const r = await fetch(API + path, {
        method,
        headers: {
          Authorization: `Bearer ${TOK}`,
          Accept: 'application/vnd.github+json',
          'Content-Type': 'application/json',
          'X-GitHub-Api-Version': '2022-11-28',
        },
        body: body ? JSON.stringify(body) : undefined,
        signal: AbortSignal.timeout(30000),
      });
      const d = await r.json().catch(() => ({}));
      if (r.status === 404) return { __404: true };
      if (!r.ok) throw new Error(`${r.status} ${JSON.stringify(d).slice(0, 200)}`);
      return d;
    } catch (e) {
      if (i === 8) throw e;
      await new Promise((res) => setTimeout(res, 800 * i));
    }
  }
}

function walk(dir, out = []) {
  for (const name of readdirSync(dir)) {
    if (EXCLUDE_DIRS.has(name) || EXCLUDE_FILES.has(name)) continue;
    const p = join(dir, name);
    const st = statSync(p);
    if (st.isDirectory()) walk(p, out);
    else if (st.size < 8 * 1024 * 1024) out.push(p); // Contents API 单文件 8MB 上限
  }
  return out;
}

const blobSha = (buf) => `blob ${buf.length}\0` + buf.toString('binary');
function gitBlobSha(buf) {
  const h = createHash('sha1');
  h.update(Buffer.concat([Buffer.from(`blob ${buf.length}\0`, 'binary'), buf]));
  return h.digest('hex');
}

(async () => {
  // 1. 远端现有文件树（sha 对比用）
  let remote = new Map();
  const tree = await gh('GET', `/repos/${REPO}/git/trees/HEAD?recursive=1`).catch(() => null);
  if (tree && tree.tree) for (const t of tree.tree) if (t.type === 'blob') remote.set(t.path, t.sha);
  console.log(`远端已有 ${remote.size} 个文件`);

  // 2. 本地文件收集
  const files = walk(ROOT).map((p) => ({ path: relative(ROOT, p).split(sep).join('/'), abs: p }));
  console.log(`本地待同步 ${files.length} 个文件`);

  // 3. 逐个对比上传
  let up = 0, skip = 0, fail = 0;
  for (const f of files) {
    const buf = readFileSync(f.abs);
    const sha = gitBlobSha(buf);
    if (remote.get(f.path) === sha) { skip++; continue; }
    if (DRY) { console.log('  [dry] 需上传', f.path); up++; continue; }
    try {
      const d = await gh('PUT', `/repos/${REPO}/contents/${f.path.split('/').map(encodeURIComponent).join('/')}`, {
        message: `backup: ${f.path}`,
        content: buf.toString('base64'),
        ...(remote.has(f.path) ? { sha: remote.get(f.path) } : {}),
      });
      if (d.__404) { console.log('  仓库为空需先 init:', f.path); fail++; continue; }
      up++;
      if (up % 10 === 0) console.log(`  …已上传 ${up}`);
    } catch (e) {
      console.error('  FAIL', f.path, e.message.slice(0, 120));
      fail++;
    }
  }
  console.log(`\n完成：上传 ${up}，跳过 ${skip}（一致），失败 ${fail}`);
  if (fail > 0) process.exit(1);
})().catch((e) => { console.error('FATAL', e.message); process.exit(1); });
