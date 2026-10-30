/* 宁外八一 · 主题引擎：CSS 变量应用 + 主题编辑器 + 主题商店（参考洛谷主题编辑器） */
(function () {
  'use strict';

  // 本地工具（app.js 是 IIFE，内部函数不外泄；这里自带一份轻量实现）
  const $ = (s, el) => (el || document).querySelector(s);
  const $$ = (s, el) => [...(el || document).querySelectorAll(s)];
  function fmtDate(s) { return s ? String(s).replace('T', ' ').slice(0, 16) : ''; }
  // 路由 query 可能是字符串（"code=XXX&a=1"）或对象，统一成对象
  const parseQS = (q) => {
    if (!q) return {};
    if (typeof q === 'object') return q;
    const o = {};
    for (const kv of String(q).split('&')) {
      const i = kv.indexOf('=');
      if (i > 0) {
        try { o[decodeURIComponent(kv.slice(0, i))] = decodeURIComponent(kv.slice(i + 1)); }
        catch { o[kv.slice(0, i)] = kv.slice(i + 1); }
      }
    }
    return o;
  };

  const LS_KEY = 'nw_theme_v1';

  // 默认「宁外专属」主题（与 D1 预置 id=1 一致）
  const DEFAULT_THEME = {
    name: '宁外专属',
    nav_bg: '#1e3a5f', nav_text: '#e9c959', logo_color: 'color',
    bg: '#edf2f8', mid: '#d6e2ef', gradient_angle: 180,
    primary: '#9e1b1b', accent: '#c9a227',
    mid_image: '', mid_repeat: 'no-repeat', mid_size: 'cover',
    mid_x: 50, mid_y: 100, mid_brightness: 100,
    mid_blur: 100, mid_img_blur: 0, mid_scroll: 'fullscreen',
  };

  // 中景图片预设（校园实景，来自校庆开放日推文）
  const IMG_PRESETS = [
    ['/anniv/wx-06.jpg', '浩汇湖'],
    ['/anniv/wx-07.jpg', '校园全景'],
    ['/anniv/wx-09.jpg', '黑天鹅'],
    ['/anniv/wx-25.jpg', '音乐厅'],
    ['/anniv/wx-26.jpg', '海岛农场'],
    ['/anniv/wx-27.jpg', '图书馆'],
    ['/anniv/wx-28.jpg', '校史广场'],
    ['/anniv/wx-29.jpg', '三思溪'],
    ['/anniv/wx-30.jpg', '濯缨湖'],
    ['/anniv/wx-31.jpg', '书海'],
    ['/anniv/wx-33.jpg', '宁心楼'],
    ['/anniv/wx-34.jpg', '浩汇水榭'],
  ];

  // ---------- 颜色工具 ----------
  function hex2rgb(h) {
    h = String(h || '').replace('#', '');
    if (h.length === 3) h = h.split('').map((c) => c + c).join('');
    const n = parseInt(h, 16);
    return { r: (n >> 16) & 255, g: (n >> 8) & 255, b: n & 255 };
  }
  function rgb2hex(r, g, b) {
    return '#' + [r, g, b].map((v) => Math.min(Math.max(Math.round(v), 0), 255).toString(16).padStart(2, '0')).join('');
  }
  function darken(hex, k) { const c = hex2rgb(hex); return rgb2hex(c.r * (1 - k), c.g * (1 - k), c.b * (1 - k)); }
  function tint(hex, k) { const c = hex2rgb(hex); return rgb2hex(c.r + (255 - c.r) * k, c.g + (255 - c.g) * k, c.b + (255 - c.b) * k); }
  function luminance(hex) { const c = hex2rgb(hex); return (0.299 * c.r + 0.587 * c.g + 0.114 * c.b) / 255; }
  // 中景图模糊：数字（px）或旧版字符串档位
  function imgBlurPx(v) {
    const n = Number(v);
    if (v !== '' && v != null && Number.isFinite(n)) return Math.min(Math.max(n, 0), 30);
    return v === 'standard' ? 3 : v === 'light' ? 1 : 0;
  }
  // 卡片透明度：数字（0-100 百分比）或旧版字符串档位
  function cardAlpha(v) {
    const n = Number(v);
    if (v !== '' && v != null && Number.isFinite(n)) return Math.min(Math.max(n, 0), 100);
    return v === 'standard' ? 100 : v === 'light' ? 100 : 100;
  }

  // ---------- 应用主题到 CSS 变量 ----------
  function apply(config) {
    const root = document.documentElement;
    const set = (k, v) => root.style.setProperty(k, v);
    const c = Object.assign({}, DEFAULT_THEME, config || {});
    if (c.nav_bg) set('--nav-bg', c.nav_bg);
    if (c.bg) set('--bg', c.bg);
    if (c.mid) set('--mid', c.mid);
    if (c.gradient_angle != null) set('--gradient-angle', c.gradient_angle + 'deg');
    if (c.primary) {
      set('--primary', c.primary);
      set('--primary-hover', darken(c.primary, 0.14));
      set('--primary-soft', tint(c.primary, 0.9));
    }
    if (c.accent) set('--accent', c.accent);
    if (c.mid_image) set('--mid-image', `url("${c.mid_image}")`);
    else set('--mid-image', 'none');
    if (c.mid_repeat) set('--mid-repeat', c.mid_repeat);
    if (c.mid_size === 'custom') set('--mid-size', `${c.mid_w || 100}% ${c.mid_h || 100}%`);
    else if (c.mid_size) set('--mid-size', c.mid_size);
    set('--mid-pos', `${c.mid_x != null ? c.mid_x : 50}% ${c.mid_y != null ? c.mid_y : 50}%`);
    set('--mid-brightness', String((c.mid_brightness != null ? c.mid_brightness : 100) / 100));
    set('--mid-img-blur', imgBlurPx(c.mid_img_blur) + 'px');
    // 卡片透明度（mid_blur 语义：内容卡片不透明度 0-100）
    set('--card-alpha', String(cardAlpha(c.mid_blur) / 100));
    if (c.logo_url) set('--logo-url', `url("${c.logo_url}")`);
    else set('--logo-url', 'none');
    // 中景滚动方式
    const layer = document.getElementById('mid-layer');
    if (layer) layer.classList.toggle('scroll', c.mid_scroll === 'bottom');
    // 导航配色：深底浅字 / 浅底深字，次级文字与悬停色随底色明暗自适应
    const navLum = luminance(c.nav_bg || '#1e3a5f');
    const light = navLum > 0.55;
    set('--nav-text', c.nav_text || (light ? '#16222e' : '#e9c959'));
    set('--nav-text-soft', light ? 'rgba(22, 34, 46, .72)' : 'rgba(233, 201, 89, .82)');
    set('--nav-hover', light ? 'rgba(22, 34, 46, .08)' : 'rgba(255, 255, 255, .12)');
    set('--nav-line', light ? 'rgba(22, 34, 46, .35)' : 'rgba(233, 201, 89, .45)');
    // 本地缓存（下次打开即时应用，免闪白）
    try { localStorage.setItem(LS_KEY, JSON.stringify(c)); } catch {}
    // 广播给导航（logo 显隐）
    window.dispatchEvent(new CustomEvent('nw-theme', { detail: c }));
  }

  // 启动时：先用本地缓存即时绘制，再由 /me 的服务端主题校正
  function bootSync() {
    let cached = null;
    try { cached = JSON.parse(localStorage.getItem(LS_KEY) || 'null'); } catch {}
    apply(cached || DEFAULT_THEME);
    // 中景图层
    if (!document.getElementById('mid-layer')) {
      const layer = document.createElement('div');
      layer.id = 'mid-layer';
      document.body.appendChild(layer);
    }
  }
  function bootFromServer(theme) {
    // 服务端主题优先；本地缓存仅用于首屏绘制
    try {
      const cached = JSON.parse(localStorage.getItem(LS_KEY) || 'null');
      const serverKey = JSON.stringify(theme?.config || null);
      if (JSON.stringify(cached || null) !== serverKey) apply(theme?.config || DEFAULT_THEME);
    } catch { apply(theme?.config || DEFAULT_THEME); }
  }

  // ---------- 编辑器辅助 ----------
  function esc(s) { return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;'); }
  const swatch = (c) => `<span class="tcfg-sw" style="background:${esc(c)}"></span>`;

  // ========== 主题工坊（编辑器；每套主题对应唯一页面 #/theme?id=N） ==========
  async function viewTheme(app, query) {
    const { api, toast, state } = window.NW;
    const q = parseQS(query);
    if (!state.user) { app.innerHTML = '<div class="card">请先登录后管理主题。<a href="/auth.html">去登录 →</a></div>'; return; }
    let mine;
    try { mine = await api('/api/themes/mine'); }
    catch (e) {
      app.innerHTML = `<div class="card">主题数据加载失败：${esc(e.message || '网络错误')}<div style="margin-top:10px"><button class="btn btn-outline btn-sm" id="t-retry">重试</button></div></div>`;
      $('#t-retry')?.addEventListener('click', () => viewTheme(app));
      return;
    }
    // ctx.editing 是唯一编辑态源：保存/应用都只改它 + 局部重绘，
    // 切换主题走 URL 跳转（#/theme?id=N），不再整页重渲染丢失编辑态
    const ctx = { list: mine.themes || [], activeId: mine.active_id || null, editing: null, tab: 'basic', shareUrl: '' };
    const pick = (id) => {
      const t = ctx.list.find((x) => x.id === id);
      return t ? { ...t.config, name: t.name, __id: t.id } : null;
    };
    const urlId = q.id ? +q.id : null;
    const foreign = urlId && !ctx.list.some((t) => t.id === urlId);
    ctx.editing = pick(urlId) || pick(ctx.activeId) || pick(ctx.list[0]?.id) || { ...DEFAULT_THEME };

    app.innerHTML = `
      <div class="theme-edit-head">
        <h2 class="page-title" style="margin:0">主题工坊</h2>
        <a class="btn btn-outline btn-sm" href="#/themes">← 主题商店</a>
      </div>
      <div class="theme-preview-tip">🎨 动态预览编辑模式——所有改动即时生效，别忘了保存。</div>
      ${foreign ? `<div class="card" style="border-color:var(--primary)">
        <div class="row" style="flex-wrap:wrap;gap:10px;align-items:center">
          <div>这套主题不是你创建的，不能直接修改。</div>
          <div class="spacer"></div>
          <button class="btn btn-sm" id="t-fork">另存为我的主题</button>
          <a class="btn btn-outline btn-sm" href="#/theme">打开我的工坊</a>
        </div>
      </div>` : ''}
      <div class="card">
        <div class="row" style="margin-bottom:14px;flex-wrap:wrap;gap:8px;align-items:center">
          <label class="field" style="margin:0;min-width:200px;flex:0 1 240px"><span>正在编辑</span>
            <select class="input" id="t-switch">
              ${ctx.list.map((t) => `<option value="${t.id}" ${t.id === ctx.editing.__id ? 'selected' : ''}>${esc(t.name)}${t.id === ctx.activeId ? '（使用中）' : ''}</option>`).join('') || '<option value="">（还没有主题）</option>'}
            </select>
          </label>
          <a class="btn btn-outline btn-sm" href="#/theme" id="t-new">＋ 新建主题</a>
          ${ctx.list.length ? '<span class="muted">每套主题都有独立页面，切换后地址栏随之变化</span>' : ''}
        </div>
        <div class="tabs" style="margin-bottom:16px">
          <button data-tab="basic" class="active">基本信息</button>
          <button data-tab="color">亮色配置</button>
        </div>
        <div id="theme-basic"></div>
        <div id="theme-color" hidden></div>
      </div>`;

    // ---- 切换主题：URL 跳转，每套主题对应唯一页面（#/theme?id=N）----
    const renderSwitch = () => {
      const sel = $('#t-switch');
      if (!sel) return;
      sel.innerHTML = ctx.list.map((t) => `<option value="${t.id}" ${t.id === ctx.editing.__id ? 'selected' : ''}>${esc(t.name)}${t.id === ctx.activeId ? '（使用中）' : ''}</option>`).join('') || '<option value="">（还没有主题）</option>';
      sel.onchange = (e) => { if (e.target.value) location.hash = '#/theme?id=' + e.target.value; };
    };
    renderSwitch();
    $('#t-new')?.addEventListener('click', (e) => {
      // 已在空白工坊时，链接不会触发路由变化，手动重置编辑器
      if (!location.hash.includes('id=')) { e.preventDefault(); ctx.editing = { ...DEFAULT_THEME }; ctx.shareUrl = ''; renderSwitch(); renderEditor(); }
    });
    // 他人主题入口：另存为副本（作者变为当前用户）
    $('#t-fork')?.addEventListener('click', async () => {
      try {
        const d = await api('/api/themes/' + urlId + '/fork', { method: 'POST', body: '{}' });
        toast('已另存为你的主题');
        location.hash = '#/theme?id=' + d.id;
      } catch (err) { toast(err.message, true); }
    });

    // ---- 编辑器面板：基本信息 + 亮色配置（按 ctx.editing 局部重绘）----
    const basicPanel = $('#theme-basic');
    const colorPanel = $('#theme-color');

    const renderEditor = () => {
      const e = ctx.editing;
      const rec = e.__id ? ctx.list.find((t) => t.id === e.__id) : null;
      // ---- 基本信息 ----
      basicPanel.innerHTML = `
        <div class="row" style="align-items:flex-end;gap:14px;flex-wrap:wrap">
          <label class="field" style="flex:1;min-width:220px;margin-bottom:0"><span>主题名称</span><input class="input" id="t-name" maxlength="30" value="${esc(e.name)}" placeholder="例如：宁外专属"></label>
          <button class="btn" id="t-save">${e.__id ? '保存修改' : '保存主题'}</button>
          <button class="btn btn-apply" id="t-apply">应用主题</button>
          <button class="btn btn-outline" id="t-saveas">另存为新主题</button>
          <button class="btn btn-outline" id="t-share">${rec?.share_code ? '分享链接' : '分享主题'}</button>
          <button class="btn btn-outline" id="t-reset">恢复默认</button>
          ${e.__id ? '<button class="btn btn-danger" id="t-del">删除主题</button>' : ''}
        </div>
        <div class="muted" style="margin-top:10px">作者：${esc(state.user.username)} · 我的主题共 ${ctx.list.length} 套${e.__id && rec ? ' · 创建于 ' + fmtDate(rec.created_at) + ' · 更新于 ' + fmtDate(rec.updated_at) : ' · 新主题'}</div>
        <div class="share-row" id="t-share-row"${ctx.shareUrl ? '' : ' hidden'}>
          <input class="input" id="t-share-url" readonly value="${esc(ctx.shareUrl)}">
          <button class="btn btn-outline btn-sm" id="t-share-copy">复制</button>
        </div>`;
      // ---- 亮色配置 ----
      const colorRow = (label, inner) => `<div class="tcfg-row"><label>${label}</label>${inner}</div>`;
      const colorInput = (key, val) => `${swatch(val)}<input type="color" id="c-${key}" value="${esc(val)}"><input type="text" id="c-${key}-txt" value="${esc(val)}" maxlength="20" style="flex:1;min-width:100px">`;
      // 编辑器字段中文名映射（不使用 key 的英文原文）
      const LABELS = {
        logo_color: 'Logo 配色', gradient_angle: '渐变角度', mid_brightness: '中景图亮度',
        mid_blur: '卡片透明度', mid_img_blur: '中景图模糊', mid_repeat: '平铺方式',
        mid_size: '图片尺寸', mid_scroll: '滚动方式', mid_x: '水平位置', mid_y: '垂直位置',
      };
      const lbl = (k) => LABELS[k] || k.replace(/_/g, ' ');
      const rangeRow = (key, val, min, max, unit, step) => `${colorRow(lbl(key), `<input type="range" id="c-${key}" min="${min}" max="${max}" step="${step || 1}" value="${val}"><span class="range-val" id="v-${key}">${val}${unit || ''}</span>`)}`;
      const radioRow = (key, val, opts) => `<div class="tcfg-row"><label>${lbl(key)}</label><div class="tcfg-radios" id="c-${key}">${opts.map(([v, l]) => `<label class="${v === val ? 'on' : ''}"><input type="radio" name="${key}" value="${v}" ${String(v) === String(val) ? 'checked' : ''}>${l}</label>`).join('')}</div></div>`;
      colorPanel.innerHTML = `
      <div class="tcfg-group">
        <h4>🧭 亮色导航</h4>
        ${colorRow('导航背景', colorInput('nav_bg', e.nav_bg || DEFAULT_THEME.nav_bg))}
        ${colorRow('文字颜色', colorInput('nav_text', e.nav_text || DEFAULT_THEME.nav_text))}
        ${radioRow('logo_color', e.logo_color || 'color', [['color', '彩色'], ['custom', '自定义']])}
      </div>
      <div class="tcfg-group">
        <h4>🎨 亮色主体</h4>
        ${colorRow('背景颜色', colorInput('bg', e.bg || DEFAULT_THEME.bg))}
        ${colorRow('中景颜色', colorInput('mid', e.mid || DEFAULT_THEME.mid))}
        ${rangeRow('gradient_angle', e.gradient_angle ?? 180, 0, 360, '°')}
        ${colorRow('主题色', colorInput('primary', e.primary || DEFAULT_THEME.primary))}
        ${colorRow('金色点缀', colorInput('accent', e.accent || DEFAULT_THEME.accent))}
      </div>
      <div class="tcfg-group">
        <h4>🏞 中景图片</h4>
        <div class="tcfg-row"><label>中景图片</label><label class="tcfg-switch"><input type="checkbox" id="c-mid_on" ${e.mid_image ? 'checked' : ''}><span></span></label><span class="muted">开启后展示校园图片或图片床动图</span></div>
        ${colorRow('图片地址', `<input type="text" id="c-mid_image" value="${esc(e.mid_image || '')}" placeholder="留空关闭中景图；支持站内路径或 https 图片床"><button class="btn btn-outline btn-sm" id="c-mid_image-clear">清除</button>`)}
        <div class="tcfg-img-picks" id="mid-picks">${IMG_PRESETS.map(([u, n]) => `<figure class="${e.mid_image === u ? 'on' : ''}" data-u="${u}"><img src="${u}" alt="${esc(n)}" loading="lazy"><figcaption>${esc(n)}</figcaption></figure>`).join('')}</div>
        ${rangeRow('mid_brightness', e.mid_brightness ?? 100, 0, 200, '%')}
        <div class="tcfg-row"><label>卡片透明度</label><input type="range" id="c-mid_blur" min="0" max="100" step="1" value="${cardAlpha(e.mid_blur ?? 100)}"><span class="range-val" id="v-mid_blur">${cardAlpha(e.mid_blur ?? 100)}%</span></div>
        <div class="tcfg-row"><label>透明度快捷档</label><div class="tcfg-radios" id="blur-quick">${[[100, '不透明'], [85, '微透'], [70, '半透'], [50, '透视']].map(([v, l]) => `<label class="${cardAlpha(e.mid_blur ?? 100) === v ? 'on' : ''}" data-v="${v}">${l}</label>`).join('')}</div></div>
        <div class="tcfg-row"><label>中景图模糊</label><input type="range" id="c-mid_img_blur" min="0" max="20" step="0.5" value="${imgBlurPx(e.mid_img_blur ?? 0)}"><span class="range-val" id="v-mid_img_blur">${imgBlurPx(e.mid_img_blur ?? 0)}px</span></div>
        ${radioRow('mid_repeat', e.mid_repeat || 'no-repeat', [['no-repeat', '不重复'], ['repeat', '全部重复'], ['repeat-x', '横向重复'], ['repeat-y', '纵向重复']])}
        ${radioRow('mid_size', e.mid_size || 'cover', [['auto', '自动'], ['cover', '填充'], ['contain', '适应'], ['custom', '自定义']])}
        <div class="tcfg-row" id="custom-size-row" ${e.mid_size === 'custom' ? '' : 'hidden'}><label>自定义尺寸</label>
          <input type="number" id="c-mid_w" min="10" max="500" value="${e.mid_w || 100}" style="width:80px"> %
          <input type="number" id="c-mid_h" min="10" max="500" value="${e.mid_h || 100}" style="width:80px"> %
        </div>
        ${rangeRow('mid_x', e.mid_x ?? 50, 0, 100, '%')}
        ${rangeRow('mid_y', e.mid_y ?? 50, 0, 100, '%')}
        ${radioRow('mid_scroll', e.mid_scroll || 'fullscreen', [['fullscreen', '全屏固定'], ['bottom', '从底部滚出']])}
      </div>`;
      basicPanel.hidden = ctx.tab !== 'basic';
      colorPanel.hidden = ctx.tab !== 'color';
      $$('.tabs [data-tab]').forEach((b) => b.classList.toggle('active', b.dataset.tab === ctx.tab));

      // ---- 实时预览绑定（写入 ctx.editing 并即时 apply）----
      const ed = () => ctx.editing;
      const bindColor = (key) => {
        const ci = $('#c-' + key), ct = $('#c-' + key + '-txt'), sw = ci?.previousElementSibling;
        if (!ci) return;
        const on = (v) => { ed()[key] = v; apply(ed()); if (ct && ct.value !== v) ct.value = v; if (sw) sw.style.background = v; };
        ci.addEventListener('input', () => on(ci.value));
        ct.addEventListener('input', () => { if (/^#[0-9a-fA-F]{3,8}$/.test(ct.value)) { ci.value = ct.value; on(ct.value); } });
      };
      ['nav_bg', 'nav_text', 'bg', 'mid', 'primary', 'accent'].forEach(bindColor);
      const bindRange = (key) => {
        const el = $('#c-' + key), v = $('#v-' + key);
        if (!el) return;
        el.addEventListener('input', () => {
          ed()[key] = key === 'mid_img_blur' ? +el.value : Math.round(+el.value);
          v.textContent = el.value + (key === 'gradient_angle' ? '°' : key === 'mid_img_blur' ? 'px' : '%');
          apply(ed());
          if (key === 'mid_blur') $$('#blur-quick label').forEach((l) => l.classList.toggle('on', +l.dataset.v === +el.value));
        });
      };
      ['gradient_angle', 'mid_x', 'mid_y', 'mid_brightness', 'mid_blur', 'mid_img_blur'].forEach(bindRange);
      $$('#blur-quick label').forEach((l) => l.addEventListener('click', () => {
        const v = +l.dataset.v;
        ed().mid_blur = v;
        $('#c-mid_blur').value = v;
        $('#v-mid_blur').textContent = v + '%';
        $$('#blur-quick label').forEach((x) => x.classList.toggle('on', x === l));
        apply(ed());
      }));
      const bindRadio = (key) => {
        const box = $('#c-' + key);
        if (!box) return;
        box.querySelectorAll('input').forEach((r) => r.addEventListener('change', () => {
          ed()[key] = r.value;
          box.querySelectorAll('label').forEach((l) => l.classList.toggle('on', l.querySelector('input').checked));
          if (key === 'mid_size') $('#custom-size-row').hidden = r.value !== 'custom';
          apply(ed());
        }));
      };
      ['logo_color', 'mid_repeat', 'mid_size', 'mid_scroll'].forEach(bindRadio);
      // 中景图开关 + 地址 + 预设
      $('#c-mid_on')?.addEventListener('change', (ev) => {
        if (ev.target.checked) { if (!ed().mid_image) { ed().mid_image = IMG_PRESETS[0][0]; $('#c-mid_image').value = ed().mid_image; $$('#mid-picks figure').forEach((f) => f.classList.toggle('on', f.dataset.u === ed().mid_image)); } }
        else { ed().mid_image = ''; $('#c-mid_image').value = ''; $$('#mid-picks figure').forEach((f) => f.classList.remove('on')); }
        apply(ed());
      });
      $('#c-mid_image')?.addEventListener('input', (ev) => { ed().mid_image = ev.target.value.trim(); apply(ed()); $$('#mid-picks figure').forEach((f) => f.classList.toggle('on', f.dataset.u === ed().mid_image)); });
      $('#c-mid_image-clear')?.addEventListener('click', () => { ed().mid_image = ''; $('#c-mid_image').value = ''; $('#c-mid_on').checked = false; apply(ed()); $$('#mid-picks figure').forEach((f) => f.classList.remove('on')); });
      $$('#mid-picks figure').forEach((f) => f.addEventListener('click', () => { ed().mid_image = f.dataset.u; $('#c-mid_image').value = f.dataset.u; $('#c-mid_on').checked = true; apply(ed()); $$('#mid-picks figure').forEach((x) => x.classList.toggle('on', x === f)); }));
      $('#c-mid_w')?.addEventListener('input', (ev) => { ed().mid_w = +ev.target.value || 100; apply(ed()); });
      $('#c-mid_h')?.addEventListener('input', (ev) => { ed().mid_h = +ev.target.value || 100; apply(ed()); });

      // ---- 操作按钮（保存/应用后同步 ctx.list 并局部重绘）----
      const nowIso = () => new Date().toISOString();
      const syncRec = (id, patch) => { const i = ctx.list.findIndex((t) => t.id === id); if (i >= 0) ctx.list[i] = { ...ctx.list[i], ...patch }; };
      const pushNew = (id, name, cfg) => { ctx.list.push({ id, name, config: cfg, active: false, share_code: null, use_count: 0, created_at: nowIso(), updated_at: nowIso() }); };
      const collect = () => {
        ed().name = $('#t-name').value.trim() || '我的主题';
        const cfg = {};
        for (const k of Object.keys(DEFAULT_THEME)) if (ed()[k] !== undefined && ed()[k] !== '') cfg[k] = ed()[k];
        return cfg;
      };
      $('#t-save').addEventListener('click', async () => {
        const cfg = collect();
        try {
          if (ed().__id) {
            await api('/api/themes/' + ed().__id, { method: 'PUT', body: JSON.stringify({ name: ed().name, config: cfg }) });
            syncRec(ed().__id, { name: ed().name, config: cfg, updated_at: nowIso() });
            toast('已保存');
          } else {
            const d = await api('/api/themes', { method: 'POST', body: JSON.stringify({ name: ed().name, config: cfg }) });
            ed().__id = d.id;
            pushNew(d.id, ed().name, cfg);
            toast('已保存');
            location.hash = '#/theme?id=' + d.id; // 保存后落户唯一页面
            return;
          }
          renderSwitch();
          renderEditor();
        } catch (err) { toast(err.message, true); }
      });
      $('#t-apply').addEventListener('click', async () => {
        const cfg = collect();
        try {
          let id = ed().__id;
          if (!id) {
            const d = await api('/api/themes', { method: 'POST', body: JSON.stringify({ name: ed().name, config: cfg }) });
            id = d.id; ed().__id = d.id;
            pushNew(d.id, ed().name, cfg);
          }
          await api('/api/themes/' + id + '/apply', { method: 'POST', body: '{}' });
          apply(cfg);
          ctx.activeId = id;
          toast('已应用');
          renderSwitch();
          renderEditor();
        } catch (err) { toast(err.message, true); }
      });
      $('#t-saveas').addEventListener('click', async () => {
        const cfg = collect();
        try {
          const d = await api('/api/themes', { method: 'POST', body: JSON.stringify({ name: ed().name + ' 副本', config: cfg }) });
          pushNew(d.id, ed().name + ' 副本', cfg);
          ctx.editing = { ...cfg, name: ed().name + ' 副本', __id: d.id };
          ctx.shareUrl = '';
          toast('已另存为');
          location.hash = '#/theme?id=' + d.id; // 副本也是独立主题，唯一页面
        } catch (err) { toast(err.message, true); }
      });
      $('#t-reset').addEventListener('click', () => {
        ctx.editing = { ...DEFAULT_THEME, name: ctx.editing.name, __id: ctx.editing.__id };
        apply(ctx.editing);
        renderEditor();
        toast('已恢复默认参数（记得保存）');
      });
      $('#t-del')?.addEventListener('click', async () => {
        if (!confirm('确定删除这套主题？')) return;
        const wasActive = ctx.activeId === ed().__id;
        try {
          await api('/api/themes/' + ed().__id, { method: 'DELETE', body: '{}' });
          ctx.list = ctx.list.filter((t) => t.id !== ed().__id);
          if (wasActive) { ctx.activeId = null; apply(DEFAULT_THEME); }
          const nextId = ctx.list[0]?.id || null;
          ctx.editing = pick(nextId) || { ...DEFAULT_THEME };
          ctx.shareUrl = '';
          toast('已删除');
          if (nextId) location.hash = '#/theme?id=' + nextId;
          else if (location.hash.includes('id=')) location.hash = '#/theme';
          else { renderSwitch(); renderEditor(); }
        } catch (err) { toast(err.message, true); }
      });
      $('#t-share').addEventListener('click', async () => {
        try {
          if (!ed().__id) { toast('请先保存主题再分享', true); return; }
          const d = await api('/api/themes/' + ed().__id + '/share', { method: 'POST', body: '{}' });
          ctx.shareUrl = location.origin + '/#/themes/' + ed().__id;
          syncRec(ed().__id, { share_code: d.code });
          renderSwitch();
          renderEditor();
          toast('分享链接已生成');
        } catch (err) { toast(err.message, true); }
      });
      $('#t-share-copy').addEventListener('click', () => { $('#t-share-url').select(); document.execCommand('copy'); toast('已复制'); });
    }

    // tab 切换（只绑定一次，tabs 按钮在骨架里，不随 renderEditor 重建）
    $$('.tabs [data-tab]').forEach((b) => b.addEventListener('click', () => {
      ctx.tab = b.dataset.tab;
      $$('.tabs [data-tab]').forEach((x) => x.classList.toggle('active', x === b));
      basicPanel.hidden = ctx.tab !== 'basic';
      colorPanel.hidden = ctx.tab !== 'color';
    }));

    renderSwitch();
    renderEditor();
  }

  // ========== 主题商店 ==========
  async function viewThemes(app, query) {
    const { api, toast, state } = window.NW;
    const code = parseQS(query).code;
    const logged = !!state.user;
    app.innerHTML = `
      <h2 class="page-title">主题商店</h2>
      <div class="card">
        <div class="row" style="flex-wrap:wrap;gap:8px">
          <input class="input" id="store-code" placeholder="有分享码？输入直达" style="flex:1;min-width:180px" value="${esc(code || '')}">
          <button class="btn btn-sm" id="store-go">查找</button>
          <div class="spacer"></div>
          <a class="btn btn-outline btn-sm" href="#/theme">我的主题工坊 →</a>
        </div>
      </div>
      <div class="tabs theme-tabs" style="margin-top:16px">
        <button data-tab="store" class="active">主题商店</button>
        <button data-tab="mine">我创建的${logged ? '' : '（需登录）'}</button>
      </div>
      <div id="tab-store"><div class="theme-cards" id="store-grid"><div class="empty">加载中…</div></div></div>
      <div id="tab-mine" hidden><div class="empty">加载中…</div></div>`;

    const store = await api('/api/themes/store');
    const mine = logged ? await api('/api/themes/mine') : { themes: [], active_id: null };

    // ---- Tab 1：商店（全部已分享主题，卡片）----
    const grid = $('#store-grid');
    const renderStore = (list, highlightId) => {
      if (!list.length) { grid.innerHTML = '<div class="empty">商店里还没有分享的主题，去主题工坊分享你的第一套吧。</div>'; return; }
      grid.innerHTML = `<div class="muted" style="margin-bottom:10px">共 ${list.length} 套分享主题</div>` + list.map((t) => {
        const c = t.config || {};
        const isMine = mine.themes.some((m) => m.id === t.id);
        const isCur = mine.active_id === t.id;
        return `<div class="theme-card${highlightId === t.id ? ' current' : ''}" data-goto="${t.id}" style="cursor:pointer">
          <div class="tc-preview" style="background:linear-gradient(${c.gradient_angle || 180}deg, ${esc(c.bg || '#edf2f8')}, ${esc(c.mid || '#d6e2ef')})">
            <div class="tc-nav" style="background:${esc(c.nav_bg || '#1e3a5f')}"></div>
            ${c.mid_image ? `<div class="tc-mid" style="background-image:url('${esc(c.mid_image)}');opacity:.85"></div>` : ''}
            <div class="tc-chip" style="background:${esc(c.primary || '#9e1b1b')}"></div>
          </div>
          <div class="tc-body">
            <div class="tc-name">${esc(t.name)}${isCur ? '<span class="theme-badge-cur">使用中</span>' : ''}${isMine ? '<span class="theme-badge-cur" style="background:var(--muted)">我的</span>' : ''}</div>
            <div class="tc-meta">作者：${esc(t.author)} · ${t.use_count} 人使用${t.share_code ? ' · 码 ' + esc(t.share_code) : ''}</div>
            <div class="tc-ops">
              ${logged ? `<button class="btn btn-sm" data-use="${t.id}">${isCur ? '再次应用' : '使用'}</button>` : '<a class="btn btn-outline btn-sm" href="/auth.html">登录后使用</a>'}
              ${t.share_code ? `<button class="btn btn-outline btn-sm" data-copy="${esc(t.share_code)}">复制分享码</button>` : ''}
            </div>
          </div>
        </div>`;
      }).join('');
      $$('#store-grid [data-goto]').forEach((el) => el.addEventListener('click', () => { location.hash = '#/themes/' + el.dataset.goto; }));
      $$('#store-grid [data-use]').forEach((b) => b.addEventListener('click', async (e) => {
        e.stopPropagation();
        try { await api('/api/themes/' + b.dataset.use + '/apply', { method: 'POST', body: '{}' }); toast('已应用，正在刷新…'); setTimeout(() => location.reload(), 600); }
        catch (e) { toast(e.message, true); }
      }));
      $$('#store-grid [data-copy]').forEach((b) => b.addEventListener('click', () => {
        const url = location.origin + '/#/themes?code=' + b.dataset.copy;
        navigator.clipboard?.writeText(url).then(() => toast('分享链接已复制'), () => toast('复制失败', true));
      }));
    };
    renderStore(store.themes);

    // ---- Tab 2：我创建的（表格，可多套）----
    const mineBox = $('#tab-mine');
    const renderMine = () => {
      if (!logged) { mineBox.innerHTML = '<div class="card">登录后即可创建、保存和管理多套主题。<a href="/auth.html">去登录 →</a></div>'; return; }
      if (!mine.themes.length) {
        mineBox.innerHTML = `<div class="card"><div class="row" style="flex-wrap:wrap;gap:10px"><div>你还没有创建主题。</div><div class="spacer"></div><a class="btn btn-sm" href="#/theme">＋ 创建新主题</a></div></div>`;
        return;
      }
      mineBox.innerHTML = `
        <div class="card">
          <div class="row" style="margin-bottom:12px"><b>我创建的主题</b><span class="muted">共 ${mine.themes.length} 套</span><div class="spacer"></div><a class="btn btn-sm" href="#/theme">＋ 创建新主题</a></div>
          <div class="theme-table-wrap">
            <table class="theme-table">
              <thead><tr><th>主题色</th><th>主题名称</th><th>作者</th><th>更新日期</th><th>使用人数</th><th>操作</th></tr></thead>
              <tbody>
                ${mine.themes.map((t) => `<tr>
                  <td><span class="tcfg-sw tcfg-sw-lg" style="background:linear-gradient(135deg, ${esc(t.config.nav_bg || '#1e3a5f')}, ${esc(t.config.mid || '#d6e2ef')})"></span></td>
                  <td><b>${esc(t.name)}</b>${t.active ? '<span class="theme-badge-cur">使用中</span>' : ''}${t.share_code ? ' <span class="muted" title="已分享">🔗</span>' : ''}</td>
                  <td>${esc(state.user.username)}</td>
                  <td class="muted">${fmtDate(t.updated_at)}</td>
                  <td>${t.use_count} 人</td>
                  <td class="tc-ops">
                    <a class="btn btn-outline btn-sm" href="#/themes/${t.id}">查看</a>
                    <a class="btn btn-outline btn-sm" href="#/theme?id=${t.id}">编辑</a>
                    ${t.active ? '' : `<button class="btn btn-sm" data-apply="${t.id}">应用</button>`}
                    ${t.share_code ? `<button class="btn btn-outline btn-sm" data-copy="${esc(t.share_code)}">复制链接</button>` : `<button class="btn btn-outline btn-sm" data-share="${t.id}">分享</button>`}
                    <button class="btn btn-danger btn-sm" data-del="${t.id}">删除</button>
                  </td>
                </tr>`).join('')}
              </tbody>
            </table>
          </div>
        </div>`;
      $$('#tab-mine [data-apply]').forEach((b) => b.addEventListener('click', async () => {
        try { await api('/api/themes/' + b.dataset.apply + '/apply', { method: 'POST', body: '{}' }); toast('已应用，正在刷新…'); setTimeout(() => location.reload(), 600); }
        catch (e) { toast(e.message, true); }
      }));
      $$('#tab-mine [data-share]').forEach((b) => b.addEventListener('click', async () => {
        try {
          const d = await api('/api/themes/' + b.dataset.share + '/share', { method: 'POST', body: '{}' });
          const url = location.origin + '/#/themes/' + b.dataset.share;
          navigator.clipboard?.writeText(url).then(() => toast('已分享，链接已复制'), () => toast('已分享：' + url));
          setTimeout(() => viewThemes(app, {}), 400);
        } catch (e) { toast(e.message, true); }
      }));
      $$('#tab-mine [data-copy]').forEach((b) => b.addEventListener('click', () => {
        const url = location.origin + '/#/themes/' + b.dataset.copy;
        navigator.clipboard?.writeText(url).then(() => toast('分享链接已复制'), () => toast('复制失败', true));
      }));
      $$('#tab-mine [data-del]').forEach((b) => b.addEventListener('click', async () => {
        if (!confirm('确定删除这套主题？')) return;
        try { await api('/api/themes/' + b.dataset.del, { method: 'DELETE', body: '{}' }); toast('已删除'); viewThemes(app, {}); }
        catch (e) { toast(e.message, true); }
      }));
    };
    renderMine();

    // ---- tab 切换 ----
    $$('.theme-tabs [data-tab]').forEach((b) => b.addEventListener('click', () => {
      $$('.theme-tabs [data-tab]').forEach((x) => x.classList.toggle('active', x === b));
      $('#tab-store').hidden = b.dataset.tab !== 'store';
      $('#tab-mine').hidden = b.dataset.tab !== 'mine';
    }));

    // ---- 分享码查找：直达该主题的唯一页面 ----
    const lookup = () => {
      const c = $('#store-code').value.trim();
      if (!c) return;
      api('/api/themes/shared/' + encodeURIComponent(c))
        .then((d) => { location.hash = '#/themes/' + d.theme.id; })
        .catch((e) => { toast(e.message, true); renderStore([]); });
    };
    $('#store-go').addEventListener('click', lookup);
    $('#store-code').addEventListener('keydown', (e) => { if (e.key === 'Enter') lookup(); });
    // 邀请链接直达：URL 带 code 时自动定位该主题
    if (code) lookup();
  }

  // ========== 主题详情（每套主题唯一页面 #/themes/:id） ==========
  async function viewThemeDetail(app, idArg) {
    const { api, toast, state } = window.NW;
    const id = +idArg;
    app.innerHTML = '<div class="empty">加载中…</div>';
    let d;
    try { d = await api('/api/themes/public/' + id); }
    catch (e) {
      app.innerHTML = `<div class="card">主题不存在或未分享。<div style="margin-top:10px"><a class="btn btn-outline btn-sm" href="#/themes">← 返回主题商店</a></div></div>`;
      return;
    }
    const t = d.theme;
    const c = t.config || {};
    const logged = !!state.user;
    const isAdm = logged && state.user.role === 'website_admin';

    app.innerHTML = `
      <div class="theme-edit-head">
        <h2 class="page-title" style="margin:0">主题详情</h2>
        <a class="btn btn-outline btn-sm" href="#/themes">← 主题商店</a>
      </div>
      <div class="theme-detail">
        <div class="td-preview" style="background:linear-gradient(${c.gradient_angle || 180}deg, ${esc(c.bg || '#edf2f8')}, ${esc(c.mid || '#d6e2ef')})">
          <div class="td-nav" style="background:${esc(c.nav_bg || '#1e3a5f')}"></div>
          ${c.mid_image ? `<div class="td-mid" style="background-image:url('${esc(c.mid_image)}');opacity:.85"></div>` : ''}
          <div class="td-chip" style="background:${esc(c.primary || '#9e1b1b')}"></div>
          <div class="td-fake-card" style="border-color:${esc(c.primary || '#9e1b1b')}"></div>
        </div>
        <div class="td-info">
          <h3 style="margin:0 0 6px">${esc(t.name)}<span id="td-cur"></span>${t.is_mine ? '<span class="theme-badge-cur" style="background:var(--muted)">我的</span>' : ''}</h3>
          <div class="muted" style="margin-bottom:4px">作者：<b>${t.is_mine ? '我' : esc(t.author)}</b> · ${t.use_count} 人使用 · 创建于 ${fmtDate(t.created_at)}${t.updated_at !== t.created_at ? ' · 更新于 ' + fmtDate(t.updated_at) : ''}</div>
          <div class="row" style="flex-wrap:wrap;gap:8px;margin-top:12px">
            ${logged
              ? `<button class="btn" id="td-use">${t.is_mine ? '应用' : '使用这套主题'}</button>`
              : '<a class="btn" href="/auth.html">登录后使用</a>'}
            ${t.is_mine || isAdm ? `<a class="btn btn-outline" href="#/theme?id=${t.id}">编辑</a>` : ''}
            ${logged && !t.is_mine ? '<button class="btn btn-outline" id="td-fork">另存为再编辑</button>' : ''}
            ${t.is_mine ? `<button class="btn btn-outline" id="td-share">${t.share_code ? '复制分享链接' : '分享主题'}</button>` : (t.share_code ? `<button class="btn btn-outline" id="td-share">复制分享链接</button>` : '')}
            ${t.is_mine ? '<button class="btn btn-danger" id="td-del">删除</button>' : ''}
          </div>
          <div class="share-row" id="td-share-row" hidden>
            <input class="input" id="td-share-url" readonly value="">
            <button class="btn btn-outline btn-sm" id="td-share-copy">复制</button>
          </div>
          <div class="muted" style="margin-top:14px">应用后与原作者和其他使用者打开的是同一套主题；想改成自己的版本，点「另存为再编辑」，副本的作者就是你。</div>
        </div>
      </div>`;

    // 当前是否正应用中
    let curActiveId = null;
    if (logged) {
      try { const a = await api('/api/themes/active'); curActiveId = a.theme?.id || null; } catch {}
    }
    const cur = $('#td-cur');
    if (cur && curActiveId === t.id) cur.innerHTML = '<span class="theme-badge-cur">使用中</span>';

    $('#td-use')?.addEventListener('click', async () => {
      try {
        await api('/api/themes/' + t.id + '/apply', { method: 'POST', body: '{}' });
        apply(c);
        toast('已应用');
        viewThemeDetail(app, idArg); // 局部刷新徽章与使用人数
      } catch (e) { toast(e.message, true); }
    });
    $('#td-fork')?.addEventListener('click', async () => {
      try {
        const f = await api('/api/themes/' + t.id + '/fork', { method: 'POST', body: '{}' });
        toast('已另存为你的主题，打开编辑');
        location.hash = '#/theme?id=' + f.id;
      } catch (e) { toast(e.message, true); }
    });
    $('#td-del')?.addEventListener('click', async () => {
      if (!confirm('确定删除这套主题？删除后所有使用者的该主题会回到默认。')) return;
      try {
        await api('/api/themes/' + t.id, { method: 'DELETE', body: '{}' });
        toast('已删除');
        location.hash = '#/themes';
      } catch (e) { toast(e.message, true); }
    });
    const showShare = (code) => {
      $('#td-share-row').hidden = false;
      $('#td-share-url').value = location.origin + '/#/themes/' + t.id;
    };
    $('#td-share')?.addEventListener('click', async () => {
      try {
        if (!t.share_code) {
          const s = await api('/api/themes/' + t.id + '/share', { method: 'POST', body: '{}' });
          t.share_code = s.code;
        }
        showShare(t.share_code);
        toast('分享链接已生成');
      } catch (e) { toast(e.message, true); }
    });
    $('#td-share-copy')?.addEventListener('click', () => { $('#td-share-url').select(); document.execCommand('copy'); toast('已复制'); });
  }

  window.NW_THEME = { DEFAULT_THEME, IMG_PRESETS, apply, bootSync, bootFromServer, viewTheme, viewThemes, viewThemeDetail };

  // 启动：本地缓存即时绘制 + 中景图层
  bootSync();
})();
