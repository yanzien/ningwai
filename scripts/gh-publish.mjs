// 把当前源码发布到公开仓库（一次性建 commit，历史干净）
// 用法：node scripts/gh-publish.mjs [--repo yanzien/ningwai] [--dry-run]
// token 读 .gh-token；网络直连 api.github.com（勿自定义 undici Agent）
import { readFileSync, readdirSync, statSync } from 'node:fs';
import { join, relative, sep, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const TOK = readFileSync(join(ROOT, '.gh-token'), 'utf8').trim();
const API = 'https://api.github.com';

const argv = process.argv.slice(2);
const argOf = (k, d) => {
  const i = argv.indexOf(k);
  return i >= 0 && argv[i + 1] ? argv[i + 1] : d;
};
const REPO = argOf('--repo', 'yanzien/ningwai');
const DRY = argv.includes('--dry-run');

// 绝不外发的目录与文件：备份含真实用户数据，token 是凭证
const EXCLUDE_DIRS = new Set(['node_modules', 'pages-build', '.wrangler', 'backups', '.git', '.workbuddy']);
const EXCLUDE_FILES = new Set(['.gh-token', '.cf-token', '.env', '.env.local', '.DS_Store']);

function walk(dir, out = []) {
  for (const name of readdirSync(dir)) {
    if (EXCLUDE_DIRS.has(name) || EXCLUDE_FILES.has(name)) continue;
    if (name.endsWith('.log')) continue;
    const p = join(dir, name);
    const st = statSync(p);
    if (st.isDirectory()) walk(p, out);
    else if (st.size < 8 * 1024 * 1024) out.push(p);
  }
  return out;
}

async function gh(method, path, body) {
  for (let i = 1; i <= 6; i++) {
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
        signal: AbortSignal.timeout(60000),
      });
      const t = await r.text();
      let d = {};
      try { d = JSON.parse(t); } catch { /* 非 JSON 错误页 */ }
      if (!r.ok) throw new Error(`${method} ${path} → ${r.status} ${t.slice(0, 160)}`);
      return d;
    } catch (e) {
      if (i === 6) throw e;
      await new Promise((res) => setTimeout(res, 1200 * i));
    }
  }
}

(async () => {
  const files = walk(ROOT).map((abs) => ({
    abs,
    path: relative(ROOT, abs).split(sep).join('/'),
  }));
  files.sort((a, b) => a.path.localeCompare(b.path));
  console.log(`待发布 ${files.length} 个文件 → ${REPO}`);
  if (DRY) {
    files.forEach((f) => console.log('  ', f.path));
    return;
  }

  console.log('== 1/4 上传 blobs ==');
  const tree = [];
  let n = 0;
  for (const f of files) {
    const buf = readFileSync(f.abs);
    const blob = await gh('POST', `/repos/${REPO}/git/blobs`, {
      content: buf.toString('base64'),
      encoding: 'base64',
    });
    tree.push({ path: f.path, mode: '100644', type: 'blob', sha: blob.sha });
    if (++n % 25 === 0) console.log(`   …${n}/${files.length}`);
  }

  console.log('== 2/4 建 tree ==');
  const t = await gh('POST', `/repos/${REPO}/git/trees`, { tree });

  console.log('== 3/4 建 commit ==');
  const c = await gh('POST', `/repos/${REPO}/git/commits`, {
    message: 'feat: 宁外八一校园社区 v2.3 开源首发\n\n论坛、档案库、主题商店、通知、搜索、每日备份。\nMIT License.',
    tree: t.sha,
    parents: [],
  });

  console.log('== 4/4 建分支 ==');
  try {
    await gh('POST', `/repos/${REPO}/git/refs`, { ref: 'refs/heads/main', sha: c.sha });
  } catch {
    // 空仓库初始化后 ref 已存在 → 强制指向新 commit（旧提交变为不可达，历史只有这一个）
    await gh('PATCH', `/repos/${REPO}/git/refs/heads/main`, { sha: c.sha, force: true });
    console.log('   （覆盖已有 main 分支）');
  }

  console.log(`\n完成：${files.length} 文件 → 1 个 commit ${c.sha.slice(0, 8)}`);
  console.log(`https://github.com/${REPO}`);
})().catch((e) => { console.error('FATAL', e.message); process.exit(1); });
