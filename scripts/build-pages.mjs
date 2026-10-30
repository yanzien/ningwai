// 构建 Pages 产物：打包 worker + 拷贝 public/（复用 mdqp 方案）
import { execSync } from 'node:child_process';
import { cpSync, mkdirSync, readdirSync, statSync, unlinkSync, rmdirSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const out = resolve(root, 'pages-build');

function rmTree(p) {
  let st;
  try { st = statSync(p); } catch { return; }
  if (st.isDirectory()) {
    for (const e of readdirSync(p)) rmTree(resolve(p, e));
    try { rmdirSync(p); } catch {}
  } else {
    try { unlinkSync(p); } catch {}
  }
}
rmTree(out);
mkdirSync(out, { recursive: true });
cpSync(resolve(root, 'public'), out, { recursive: true });

// 直接调 esbuild 的 JS 入口，规避 win32 .cmd SIGTERM 问题
const esbuildShim = resolve(root, 'node_modules', 'esbuild', 'bin', 'esbuild');
execSync(
  `"${process.execPath}" "${esbuildShim}" src/worker.js --bundle --platform=neutral --format=esm --outfile=pages-build/_worker.js --external:cloudflare:*`,
  { cwd: root, stdio: 'inherit' }
);

console.log('✅ pages-build 已就绪：', out);
