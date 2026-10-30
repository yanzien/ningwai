// 下载微信文章候选图片到 public/anniv/（下载后人工目检筛选）
import { mkdirSync, writeFileSync } from 'node:fs';

const OUT = 'public/anniv';
mkdirSync(OUT, { recursive: true });

// 候选：IMG1(gif) + IMG6-IMG26（按文章结构应为十景照片区）
const cands = [1, 6, 7, 8, 9, 12, 13, 14, 15, 16, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34];
const urls = {};
const html = await (await fetch('https://mp.weixin.qq.com/s?__biz=MzI0ODQ1ODI0NA==&mid=2247621607&idx=1&sn=37880d85272dba9d13b05f5da0528cc5&chksm=e99cecf0de6b65e6a88f97a5daa5732b70c6c34a561f7272a7f2dbf40b5a03f0d7bf63a2f247&scene=27', {
  headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0 Safari/537.36' },
})).text();
const all = [...html.matchAll(/https:\/\/mmbiz\.qpic\.cn\/[^"'\s\\)]+/g)].map((m) => m[0].replace(/\\/g, ''));
const uniq = [...new Set(all)];
for (const i of cands) urls[i] = uniq[i];

async function dl(i, url) {
  for (let t = 1; t <= 3; t++) {
    try {
      const r = await fetch(url, {
        headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0 Safari/537.36', Referer: 'https://mp.weixin.qq.com/' },
        signal: AbortSignal.timeout(40000),
      });
      if (!r.ok) throw new Error('http ' + r.status);
      const buf = Buffer.from(await r.arrayBuffer());
      const ext = url.includes('wx_fmt=gif') ? 'gif' : url.includes('wx_fmt=png') ? 'png' : 'jpg';
      writeFileSync(`${OUT}/wx-${String(i).padStart(2, '0')}.${ext}`, buf);
      console.log(`IMG${i} -> wx-${String(i).padStart(2, '0')}.${ext} (${(buf.length / 1024).toFixed(0)}KB)`);
      return;
    } catch (e) { if (t === 3) console.log(`IMG${i} FAILED:`, e.message); else await new Promise((r) => setTimeout(r, 800 * t)); }
  }
}
for (const [i, u] of Object.entries(urls)) await dl(i, u);
console.log('done');
