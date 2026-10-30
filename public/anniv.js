/* 宁外八一 · 35 周年校庆开场动画
 * 流程（每个浏览器只自动播一次，localStorage 记录）：
 *   1. 邀请函全屏入场（fade + scale）→「开启校庆回忆」按钮
 *   2. 点击后：校园实景图全屏快速播放（Ken Burns 推拉 + 交叉淡入 + 图注）
 *   3. 播完：35 周年海报入场，下方放校训动图（badge-full.webp）
 *   4. 点击动图：玻璃破碎效果（canvas 碎片下落）→ 揭開首页
 *   5. 首页显示「再看校庆动画」；不点则本地不再自动触发
 */
(function () {
  'use strict';

  const LS_KEY = 'nw_anniv_seen_v1';
  const SLIDES = [
    { src: '/anniv/wx-06.jpg', cap: '浩汇湖 · 晨光' },
    { src: '/anniv/wx-07.jpg', cap: '校园全景' },
    { src: '/anniv/wx-25.jpg', cap: '启韵楼 · 音乐厅' },
    { src: '/anniv/wx-26.jpg', cap: '智慧生态海岛农场' },
    { src: '/anniv/wx-27.jpg', cap: '共适馆 · 图书馆' },
    { src: '/anniv/wx-28.jpg', cap: '校史广场' },
    { src: '/anniv/wx-09.jpg', cap: '浩汇湖 · 黑天鹅' },
    { src: '/anniv/wx-30.jpg', cap: '濯缨湖 · 莲花' },
    { src: '/anniv/wx-31.jpg', cap: '共适馆 · 书海' },
    { src: '/anniv/wx-33.jpg', cap: '宁心楼 · 校史馆' },
    { src: '/anniv/wx-34.jpg', cap: '浩汇水榭' },
    { src: '/anniv/badge-full.webp', cap: '求实 创新 立德 树人', anim: true },
  ];
  const SLIDE_MS = 900; // 每张停留（快速播放）

  const seen = () => { try { return localStorage.getItem(LS_KEY) === '1'; } catch { return false; } };
  const markSeen = () => { try { localStorage.setItem(LS_KEY, '1'); } catch {} };

  let running = false;

  // ---------- 舞台 ----------
  function stage() {
    let s = document.getElementById('anniv-stage');
    if (s) return s;
    s = document.createElement('div');
    s.id = 'anniv-stage';
    s.innerHTML = `
      <div class="an-layer" id="an-img-a"></div>
      <div class="an-layer" id="an-img-b"></div>
      <div class="an-cap" id="an-cap"></div>
      <canvas id="an-glass"></canvas>
      <div class="an-card" id="an-card">
        <img id="an-card-img" alt="">
        <div id="an-card-sub"></div>
        <button class="an-btn" id="an-btn"></button>
        <img class="an-gif" id="an-gif" alt="校训">
      </div>
      <button class="an-skip" id="an-skip">跳过</button>`;
    document.body.appendChild(s);
    // 跳过按钮：全程存在，单击进入三级确认链（见 skipClick）
    const sk = s.querySelector('#an-skip');
    if (sk) sk.onclick = () => skipClick();
    return s;
  }
  const $ = (id) => document.getElementById(id);

  // ---------- 跳过：三级确认链（防误触） ----------
  const SKIP_TEXTS = ['跳过', '确认退出吗', '确确确定退出吗', '你确确确确确定要退出了'];
  let skipLevel = 0;
  let skipTimer = 0;
  function resetSkip() {
    skipLevel = 0;
    clearTimeout(skipTimer);
    const b = $('an-skip');
    if (b) { b.textContent = SKIP_TEXTS[0]; b.classList.remove('warn'); }
  }
  function skipClick() {
    const b = $('an-skip');
    if (!b) return;
    skipLevel++;
    if (skipLevel >= SKIP_TEXTS.length) { resetSkip(); finish(); return; }
    b.textContent = SKIP_TEXTS[skipLevel];
    b.classList.add('warn');
    clearTimeout(skipTimer);
    skipTimer = setTimeout(resetSkip, 3000); // 3 秒没继续点，退回「跳过」
  }
  // ESC 与点击背景：同样走确认链，不直接退
  document.addEventListener('keydown', (e) => {
    if (e.key !== 'Escape') return;
    const s = document.getElementById('anniv-stage');
    if (s && !s.hidden) skipClick();
  });

  function preload(list) {
    return Promise.all(list.map((l) => new Promise((res) => {
      const im = new Image();
      im.onload = im.onerror = () => res();
      im.src = l.src;
    })));
  }

  // ---------- 阶段 1：邀请函 ----------
  function showInvitation() {
    shattering = false; // 重看动画时复位破碎锁
    const s = stage();
    s.hidden = false;
    s.classList.add('on');
    $('an-img-a').style.backgroundImage = '';
    $('an-img-b').style.backgroundImage = '';
    $('an-cap').textContent = '';
    $('an-glass').style.display = 'none';
    const card = $('an-card');
    card.hidden = false;
    card.className = 'an-card phase-inv';
    $('an-card-img').src = '/anniv/inv.jpg';
    $('an-card-img').style.display = '';
    $('an-card-sub').textContent = '宁波外国语学校 · 浙江省八一学校';
    $('an-gif').style.display = 'none';
    const btn = $('an-btn');
    btn.textContent = '开启校庆回忆';
    btn.onclick = () => { playSlides(); };
    // 邀请函整卡可点：点图片或文案也能进入动画
    const img = $('an-card-img');
    img.onclick = () => { playSlides(); };
    img.style.cursor = 'pointer';
    // 清掉上一轮末页可能残留的处理器
    $('an-gif').onclick = null;
    $('an-card').onclick = null;
    resetSkip();
    $('an-skip').style.display = '';
    // ESC / 点击背景：走跳过确认链（防误触）
    s.onclick = (e) => { if (e.target === s) skipClick(); };
  }

  // ---------- 阶段 2：图片快速播放 ----------
  async function playSlides() {
    if (running) return;
    running = true;
    const s = stage();
    s.onclick = null;
    resetSkip();
    const card = $('an-card');
    card.hidden = true;
    $('an-cap').classList.add('on');
    const layers = [$('an-img-a'), $('an-img-b')];
    let front = 0;
    await preload(SLIDES);
    for (let i = 0; i < SLIDES.length; i++) {
      const sl = SLIDES[i];
      const show = layers[front];
      const hide = layers[1 - front];
      show.style.backgroundImage = `url("${sl.src}")`;
      show.classList.remove('kb-in', 'kb-out');
      show.classList.add('on', 'kb-in');
      hide.classList.remove('on');
      $('an-cap').textContent = sl.cap;
      $('an-cap').classList.remove('flick');
      void $('an-cap').offsetWidth;
      $('an-cap').classList.add('flick');
      front = 1 - front;
      await new Promise((r) => setTimeout(r, SLIDE_MS));
    }
    running = false;
    showPoster();
  }

  // ---------- 阶段 3：35 周年海报 + 校训动图 ----------
  function showPoster() {
    const s = stage();
    resetSkip();
    $('an-img-a').classList.remove('on');
    $('an-img-b').classList.remove('on');
    $('an-cap').classList.remove('on');
    const card = $('an-card');
    card.hidden = false;
    card.className = 'an-card phase-poster';
    $('an-card-img').src = '/anniv/poster.jpg';
    $('an-card-img').style.display = '';
    $('an-card-sub').textContent = '把每一个学生放在心上';
    const gif = $('an-gif');
    gif.src = '/anniv/badge-full.webp';
    gif.style.display = '';
    gif.onclick = () => shatter();
    const btn = $('an-btn');
    btn.textContent = '进入校园社区';
    btn.onclick = () => shatter();
    // 末页：点海报图不再触发任何播放（否则会重跑幻灯片形成死循环），只有按钮和校训动图能进入
    $('an-card-img').onclick = null;
    $('an-card-img').style.cursor = '';
    $('an-card').onclick = null;
    s.onclick = null;
  }

  // ---------- 阶段 4：玻璃破碎（从上往下逐行碎裂下落）----------
  let shattering = false;
  function shatter() {
    if (shattering) return;
    shattering = true;
    const s = stage();
    s.onclick = null;
    resetSkip();
    $('an-skip').style.display = 'none'; // 破碎中隐藏跳过按钮（一点即碎，无需再跳过）
    const cv = $('an-glass');
    const ctx = cv.getContext('2d');
    const W = cv.width = innerWidth;
    const H = cv.height = innerHeight;
    cv.style.display = 'block'; // 必须显式置 block：CSS 里是 display:none，置空字符串不生效
    // 抓当前海报画面（用海报图直接画，避免 html2canvas 依赖）
    const img = new Image();
    img.onload = () => {
      // 碎片：网格 + 随机扰动；delay 按行递增——从上往下碎
      const cols = 16, rows = 10;
      const cw = W / cols, ch = H / rows;
      const shards = [];
      for (let y = 0; y < rows; y++) {
        for (let x = 0; x < cols; x++) {
          shards.push({
            ox: x * cw, oy: y * ch, w: cw, h: ch,   // 取样原点（固定）
            x: x * cw, y: y * ch,                    // 当前绘制位置
            vx: (Math.random() - 0.5) * 2.6,
            vy: Math.random() * 1.2,                 // 初始速度向下
            g: 0.5 + Math.random() * 0.35,
            rot: (Math.random() - 0.5) * 0.35,
            alpha: 1,
            delay: y * 2.4 + Math.random() * 1.6,    // 越靠上的行越先裂
          });
        }
      }
      const draw = (sh, alpha) => {
        ctx.save();
        ctx.globalAlpha = Math.max(alpha, 0);
        ctx.translate(sh.x + sh.w / 2, sh.y + sh.h / 2);
        ctx.rotate(sh.rot);
        ctx.drawImage(
          img,
          (sh.ox / W) * img.width, (sh.oy / H) * img.height, (sh.w / W) * img.width, (sh.h / H) * img.height,
          -sh.w / 2, -sh.h / 2, sh.w, sh.h
        );
        ctx.restore();
      };
      // 白闪一帧 → 逐行碎裂下落
      ctx.fillStyle = 'rgba(255,255,255,.9)';
      ctx.fillRect(0, 0, W, H);
      let frame = 0;
      const tick = () => {
        ctx.clearRect(0, 0, W, H);
        let alive = 0;
        frame++;
        for (const sh of shards) {
          if (frame < sh.delay) { draw(sh, 1); alive++; continue; } // 未到时机：原样贴回，保持画面完整
          sh.vy += sh.g; sh.x += sh.vx; sh.y += sh.vy;
          sh.alpha -= 0.0105;
          if (sh.alpha <= 0 || sh.y > H + 120) continue;
          alive++;
          draw(sh, sh.alpha);
        }
        if (alive > 0) requestAnimationFrame(tick);
        else finish();
      };
      requestAnimationFrame(tick);
    };
    img.onerror = () => finish();
    img.src = '/anniv/poster.jpg';
    $('an-card').hidden = true;
  }

  // ---------- 收尾：揭開首页 ----------
  function finish() {
    const s = document.getElementById('anniv-stage');
    if (s) { s.classList.remove('on'); s.hidden = true; }
    resetSkip();
    markSeen();
    document.body.style.overflow = '';
  }

  // ---------- 入口 ----------
  function replay() {
    showInvitation();
  }
  function autoStart() {
    if (seen()) return;
    // 等封面图就绪再放邀请函，避免闪白
    preload([{ src: '/anniv/inv.jpg' }]).then(showInvitation);
  }

  // 页面加载后自动开始（免责门优先：等门关掉再播）
  function startWhenReady() {
    if (document.getElementById('dc-gate')) {
      const mo = new MutationObserver(() => {
        if (!document.getElementById('dc-gate')) { mo.disconnect(); setTimeout(autoStart, 400); }
      });
      mo.observe(document.body, { childList: true });
    } else {
      setTimeout(autoStart, 500);
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', startWhenReady);
  else startWhenReady();

  window.NW_ANNIV = { seen, replay, markSeen };
})();
