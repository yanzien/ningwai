// 提取微信文章中的图片 URL（mmbiz.qpic.cn）
const url = 'https://mp.weixin.qq.com/s?__biz=MzI0ODQ1ODI0NA==&mid=2247621607&idx=1&sn=37880d85272dba9d13b05f5da0528cc5&chksm=e99cecf0de6b65e6a88f97a5daa5732b70c6c34a561f7272a7f2dbf40b5a03f0d7bf63a2f247&scene=27';
async function fr(u, tries = 4) {
  let e;
  for (let i = 1; i <= tries; i++) {
    try {
      return await fetch(u, {
        signal: AbortSignal.timeout(30000),
        headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36' },
      });
    } catch (err) { e = err; await new Promise((r) => setTimeout(r, 1000 * i)); }
  }
  throw e;
}
(async () => {
  const r = await fr(url);
  const html = await r.text();
  console.log('status:', r.status, '| len:', html.length);
  const urls = [...html.matchAll(/https:\/\/mmbiz\.qpic\.cn\/[^"'\s\\)]+/g)].map((m) => m[0].replace(/\\/g, ''));
  const uniq = [...new Set(urls)];
  console.log('mmbiz images:', uniq.length);
  uniq.forEach((u, i) => console.log(`IMG${i}\t${u.slice(0, 200)}`));
  // 顺带抓 gif（wxplicensing 等动图参数）
  const gifs = uniq.filter((u) => /tp=webp|gif/.test(u));
  console.log('possible animated:', gifs.length);
})().catch((e) => console.error('ERR', e.message));
