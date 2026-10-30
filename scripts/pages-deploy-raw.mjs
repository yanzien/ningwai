// Cloudflare Pages 直传部署（绕开 wrangler：沙箱里它的 fetch 代理链路有 bug）
// 流程：upload-token 换 JWT → /pages/assets/upload 传文件 → /pages/projects/{p}/deployments 建部署
// 用法：CLOUDFLARE_API_TOKEN=... node scripts/pages-deploy-raw.mjs <dir> <project> [branch]
import { readFileSync, readdirSync, statSync } from 'node:fs';
import { createHash } from 'node:crypto';
import { join, relative } from 'node:path';

const T = process.env.CLOUDFLARE_API_TOKEN;
const A = 'ce40324a6c5953f0153dd198d28307b9';
const dir = process.argv[2];
const project = process.argv[3] || 'ningwai';
const branch = process.argv[4] || 'main';
if (!T || !dir) { console.error('need CLOUDFLARE_API_TOKEN and dir'); process.exit(1); }

async function fetchRetry(url, opts = {}, tries = 8) {
  let lastErr;
  for (let i = 1; i <= tries; i++) {
    try {
      return await fetch(url, { ...opts, signal: AbortSignal.timeout(30000) });
    } catch (e) {
      lastErr = e;
      console.error(`  attempt ${i}/${tries}: ${e.cause?.code || e.message}`);
      await new Promise((r) => setTimeout(r, 1200 * i));
    }
  }
  throw lastErr;
}
const j = async (r) => { const d = await r.json().catch(() => ({})); if (!r.ok || d.success === false) throw new Error(JSON.stringify(d.errors || d).slice(0, 300)); return d; };

// 1. 收集文件（pages-build 是扁平的）
const files = [];
(function walk(d) {
  for (const name of readdirSync(d)) {
    const p = join(d, name);
    if (statSync(p).isDirectory()) walk(p);
    else files.push({ path: p, name: relative(dir, p).split('\\').join('/') });
  }
})(dir);
console.log(`${files.length} files in ${dir}`);

const CT = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css', '.json': 'application/json', '.svg': 'image/svg+xml', '.png': 'image/png', '.ico': 'image/x-icon' };
const payload = [];
const manifest = {};
for (const f of files) {
  const buf = readFileSync(f.path);
  const hash = createHash('sha256').update(buf).digest('hex').slice(0, 10);
  const contentType = CT[f.name.slice(f.name.lastIndexOf('.')).toLowerCase()] || 'application/octet-stream';
  manifest[f.name] = hash;
  payload.push({ key: hash, value: buf.toString('base64'), metadata: { contentType }, base64: true });
  console.log(`  ${f.name} (${buf.length}B) -> ${hash}`);
}

// 2. upload-token 换 JWT（注意：该端点是 GET）
console.log('getting upload token…');
const tokRes = await j(await fetchRetry(`https://api.cloudflare.com/client/v4/accounts/${A}/pages/projects/${project}/upload-token`, {
  headers: { Authorization: `Bearer ${T}` },
}));
const jwt = tokRes.result?.jwt || tokRes.jwt;
if (!jwt) { console.error('no jwt in response:', JSON.stringify(tokRes).slice(0, 200)); process.exit(1); }

// 3. 上传文件（分批，每批 20 个）
for (let i = 0; i < payload.length; i += 20) {
  const batch = payload.slice(i, i + 20);
  console.log(`uploading batch ${i / 20 + 1} (${batch.length} files)…`);
  const upRes = await j(await fetchRetry('https://api.cloudflare.com/client/v4/pages/assets/upload', {
    method: 'POST',
    headers: { Authorization: `Bearer ${jwt}`, 'Content-Type': 'application/json' },
    body: JSON.stringify(batch),
  }));
  console.log('  upload ok:', JSON.stringify(upRes.result || upRes).slice(0, 120));
}

// 4. 创建部署（multipart）
console.log('creating deployment…');
const form = new FormData();
form.append('manifest', JSON.stringify(manifest));
form.append('branch', branch);
form.append('commit_dirty', 'true');
const worker = files.find((f) => f.name === '_worker.js');
if (worker) form.append('_worker.js', new File([readFileSync(worker.path)], '_worker.js', { type: 'text/javascript' }));
const depRes = await j(await fetchRetry(`https://api.cloudflare.com/client/v4/accounts/${A}/pages/projects/${project}/deployments`, {
  method: 'POST', headers: { Authorization: `Bearer ${T}` }, body: form,
}));
const dep = depRes.result;
console.log('✅ deployment created:', dep?.id);
console.log('   url:', dep?.url);
console.log('   environment:', dep?.environment);
