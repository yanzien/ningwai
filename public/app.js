// 宁外八一 · 主 SPA
(() => {
'use strict';
const $ = (s, el) => (el || document).querySelector(s);
const $$ = (s, el) => [...(el || document).querySelectorAll(s)];
const app = $('#app');
const state = { user: null, memberships: [], route: '#/', settings: {} };
const GRADES = ['J29', 'J28', 'J27', 'J26', 'S29', 'S28', 'S27', 'S26'];

// ---------- 基础工具 ----------
async function api(path, opts = {}) {
  const res = await fetch(path, { credentials: 'same-origin', headers: { 'Content-Type': 'application/json' }, ...opts });
  let data = {};
  try { data = await res.json(); } catch {}
  if (res.status === 401) { openLogin(); throw new Error('请先登录'); }
  if (res.status === 403 && data.code === 'must_change_pw') { location.href = '/auth.html?force=1'; throw new Error('请先修改初始密码'); }
  if (!res.ok) throw new Error(data.error || ('请求失败 ' + res.status));
  return data;
}
function toast(msg, err) {
  const t = document.createElement('div');
  t.className = 'toast' + (err ? ' err' : '');
  t.textContent = msg;
  $('#toast-root').appendChild(t);
  setTimeout(() => t.remove(), 2800);
}
function esc(s) { return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;'); }
function fp() {
  const parts = [navigator.userAgent, screen.width + 'x' + screen.height, screen.colorDepth, new Date().getTimezoneOffset(), navigator.language];
  try {
    const cv = document.createElement('canvas');
    const ctx = cv.getContext('2d');
    ctx.textBaseline = 'top'; ctx.font = '14px Arial'; ctx.fillText('ningwai', 2, 2);
    parts.push(cv.toDataURL().slice(-64));
  } catch {}
  let h = 0;
  const s = parts.join('|');
  for (let i = 0; i < s.length; i++) h = ((h << 5) - h + s.charCodeAt(i)) | 0;
  return 'fp' + Math.abs(h).toString(36) + s.length.toString(36);
}
// 数学公式占位符计数器（跨次调用递增，避免并发/嵌套冲突）
let _mathBlockId = 0;
// Markdown 渲染：先转义后解析，禁用 raw HTML（防 XSS）；支持 $...$ / $$...$$ 数学公式（KaTeX，移植自 mdqp 方案）
function md(src) {
  // 第 1 步：提取数学块用占位符保护（反斜杠序列不能被行解析/转义吞掉）
  const mathBlocks = [];
  const protectedSrc = String(src || '')
    .replace(/\$\$([\s\S]+?)\$\$/g, (_, body) => {
      mathBlocks.push({ body, display: true });
      return '\x00MATH' + (mathBlocks.length - 1) + 'D\x00';
    })
    .replace(/\$([^\$\n]+?)\$/g, (_, body) => {
      mathBlocks.push({ body, display: false });
      return '\x00MATH' + (mathBlocks.length - 1) + 'I\x00';
    });
  const lines = esc(protectedSrc).split('\n');
  let html = '', inCode = false, listType = null, para = [];
  const inline = (t) => t
    .replace(/`([^`]+)`/g, '<code>$1</code>')
    .replace(/~~+(.+?)~~+/g, '<del>$1</del>')
    .replace(/!\[([^\]]*)\]\(([^)\s]+)\)/g, (m, alt, url) => {
      const safe = /^https?:\/\//i.test(url) || /^\/(?!\/)/.test(url) ? url : '';
      return safe ? `<img src="${safe}" alt="${alt}" loading="lazy">` : alt;
    })
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
    .replace(/\*([^*\n]+)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\((https?:\/\/[^)\s]+)\)/g, '<a href="$2" target="_blank" rel="noopener noreferrer">$1</a>');
  const flushPara = () => { if (para.length) { html += '<p>' + para.map(inline).join('<br>') + '</p>'; para = []; } };
  const closeList = () => { if (listType) { html += listType === 'ul' ? '</ul>' : '</ol>'; listType = null; } };
  for (const line of lines) {
    if (/^```/.test(line.trim())) {
      if (inCode) { html += '</code></pre>'; inCode = false; }
      else { flushPara(); closeList(); html += '<pre><code>'; inCode = true; }
      continue;
    }
    if (inCode) { html += line + '\n'; continue; }
    const h = line.match(/^(#{1,4})\s+(.*)/);
    if (h) { flushPara(); closeList(); html += `<h${h[1].length}>${inline(h[2])}</h${h[1].length}>`; continue; }
    if (/^\s*[-*+]\s+/.test(line)) { flushPara(); if (listType !== 'ul') { closeList(); html += '<ul>'; listType = 'ul'; } html += '<li>' + inline(line.replace(/^\s*[-*+]\s+/, '')) + '</li>'; continue; }
    if (/^\s*\d+\.\s+/.test(line)) { flushPara(); if (listType !== 'ol') { closeList(); html += '<ol>'; listType = 'ol'; } html += '<li>' + inline(line.replace(/^\s*\d+\.\s+/, '')) + '</li>'; continue; }
    if (/^\s*>\s?/.test(line)) { flushPara(); closeList(); html += '<blockquote>' + inline(line.replace(/^\s*>\s?/, '')) + '</blockquote>'; continue; }
    if (/^\s*-{3,}\s*$/.test(line)) { flushPara(); closeList(); html += '<hr>'; continue; }
    if (!line.trim()) { flushPara(); closeList(); continue; }
    para.push(line);
  }
  if (inCode) html += '</code></pre>';
  flushPara(); closeList();
  // 第 3 步：还原数学定界符（转义后放回，auto-render 按文本节点识别；< > & 不会破坏 HTML 结构）
  html = html.replace(/\x00MATH(\d+)([DI])\x00/g, (_, num, type) => {
    const b = mathBlocks[+num];
    if (!b) return '';
    return type === 'D' ? '$$' + esc(b.body) + '$$' : '$' + esc(b.body) + '$';
  });
  // 第 4 步：KaTeX 渲染（忽略代码块/行内代码；渲染失败保留源码，不影响正文）
  if (window.renderMathInElement) {
    const tmp = document.createElement('div');
    tmp.innerHTML = html;
    try {
      window.renderMathInElement(tmp, {
        delimiters: [
          { left: '$$', right: '$$', display: true },
          { left: '$', right: '$', display: false },
          { left: '\\(', right: '\\)', display: false },
          { left: '\\[', right: '\\]', display: true },
        ],
        ignoredTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code'],
        throwOnError: false,
      });
    } catch { /* 数学渲染失败不影响正文 */ }
    return tmp.innerHTML;
  }
  return html;
}
function fmtDate(s) { return s ? String(s).replace('T', ' ').slice(0, 16) : ''; }

// ---------- 弹窗 ----------
function modal(html, onMount) {
  const root = $('#modal-root');
  root.innerHTML = `<div class="modal-mask"><div class="modal">${html}</div></div>`;
  const mask = $('.modal-mask', root);
  const box = $('.modal', root);
  const close = () => (root.innerHTML = '');
  mask.addEventListener('click', (e) => { if (e.target === mask) close(); });
  if (onMount) onMount(box, close);
  return box;
}
function openLogin() {
  modal(`
    <h3>登录</h3>
    <form id="m-login">
      <label class="field"><span>用户名</span><input class="input" name="username" required></label>
      <label class="field"><span>密码</span><input class="input" name="password" type="password" required></label>
      <div class="row" style="justify-content:space-between">
        <a href="/auth.html" class="muted">还没有账号？去注册</a>
        <button class="btn" type="submit">登录</button>
      </div>
    </form>`, async (box, close) => {
    $('#m-login', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        const d = await api('/api/auth/login', { username: f.username.value.trim(), password: f.password.value });
        if (d.must_change_pw) { location.href = '/auth.html?force=1'; return; }
        close(); toast('登录成功');
        await loadMe(); renderNav(); render(); checkDisclaimerGate();
      } catch (err) { toast(err.message, true); }
    });
  });
}

// ---------- 顶栏 ----------
function renderNav() {
  const right = $('#nav-right');
  const isSiteAdmin = state.user?.role === 'website_admin';
  const isAnyAdmin = isSiteAdmin || state.memberships.some((m) => m.role === 'org_admin' && m.status === 'approved');
  $('#nav-admin').hidden = !isAnyAdmin;
  const tg = $('#nav-toggle');
  if (tg) tg.onclick = () => document.body.classList.toggle('nav-open');
  if (state.user) {
    right.innerHTML = `
      <span class="bell-wrap" id="bell-wrap">
        <button class="nav-bell" id="btn-bell" title="消息通知" aria-label="消息通知">🔔<span class="bell-dot" id="bell-dot" hidden></span></button>
        <div class="bell-panel" id="bell-panel" hidden>
          <div class="bell-head"><strong>消息通知</strong><button class="btn btn-outline btn-sm" id="bell-read-all">全部已读</button></div>
          <div class="bell-list" id="bell-list"></div>
        </div>
      </span>
      <a class="who" href="#/me" title="进入个人中心">${esc(state.user.display_name || state.user.username)}</a>
      <a class="btn btn-outline btn-sm" href="#/me">我的</a>
      <button class="btn btn-outline btn-sm" id="btn-logout">退出</button>`;
    $('#btn-logout').addEventListener('click', async () => {
      stopBell();
      await api('/api/auth/logout', { method: 'POST', body: '{}' }).catch(() => {});
      state.user = null; state.memberships = [];
      renderNav(); render();
    });
    initBell();
  } else {
    right.innerHTML = `<a class="btn btn-outline btn-sm" href="/login">登录</a><a class="btn btn-sm" href="/register">注册</a>`;
    const bp = $('#bell-panel'); if (bp) bp.hidden = true;
  }
  // 页脚「个人中心」入口（登录时才显示）
  const fm = $('#foot-me');
  if (fm) fm.innerHTML = state.user ? '<a href="#/me">个人中心</a> &nbsp;·&nbsp; ' : '';
  const name = parseRoute().name;
  $$('.nav-links a').forEach((a) => a.classList.toggle('active', a.dataset.nav === name));
}

// ---------- 消息通知（v2.3：铃铛 + 未读红点 + 90s 轮询） ----------
let bellTimer = null;
const NOTIFY_ICON = { wiki_approved: '✅', wiki_rejected: '🚫', forum_reply: '💬' };

async function bellRefreshUnread() {
  if (!state.user) return;
  try {
    const d = await api('/api/notifications');
    $('#bell-dot').hidden = !d.unread;
  } catch { /* 轮询失败静默，下次再试 */ }
}

async function bellRenderList() {
  const box = $('#bell-list');
  try {
    const d = await api('/api/notifications');
    $('#bell-dot').hidden = !d.unread;
    if (!d.items.length) {
      box.innerHTML = '<div class="bell-empty">暂时没有消息</div>';
      return;
    }
    box.innerHTML = d.items.map((n) => `
      <div class="bell-item${n.is_read ? '' : ' unread'}" data-id="${n.id}" data-link="${esc(n.link || '')}">
        <span class="bell-ico">${NOTIFY_ICON[n.type] || '📬'}</span>
        <div class="bell-txt">
          <div class="bell-title">${esc(n.title)}</div>
          ${n.body ? `<div class="bell-body">${esc(n.body)}</div>` : ''}
          <div class="bell-time">${relTime(n.created_at)}</div>
        </div>
      </div>`).join('');
    $$('#bell-list .bell-item').forEach((el) => el.addEventListener('click', async () => {
      const id = +el.dataset.id;
      api('/api/notifications/read', { method: 'POST', body: JSON.stringify({ id }) }).catch(() => {});
      el.classList.remove('unread');
      const dot = $('#bell-dot');
      const d = await api('/api/notifications').catch(() => null);
      if (d) dot.hidden = !d.unread;
      if (el.dataset.link) location.hash = el.dataset.link;
    }));
  } catch {
    box.innerHTML = '<div class="bell-empty">加载失败，稍后重试</div>';
  }
}

function initBell() {
  const btn = $('#btn-bell');
  const panel = $('#bell-panel');
  if (!btn) return;
  btn.addEventListener('click', (e) => {
    e.stopPropagation();
    panel.hidden = !panel.hidden;
    if (!panel.hidden) bellRenderList();
  });
  document.addEventListener('click', (e) => {
    if (!panel.hidden && !panel.contains(e.target) && e.target !== btn) panel.hidden = true;
  });
  $('#bell-read-all').addEventListener('click', async (e) => {
    e.stopPropagation();
    await api('/api/notifications/read', { method: 'POST', body: JSON.stringify({ all: true }) }).catch(() => {});
    bellRenderList();
  });
  bellRefreshUnread();
  if (bellTimer) clearInterval(bellTimer);
  bellTimer = setInterval(bellRefreshUnread, 90000);
}
function stopBell() { if (bellTimer) { clearInterval(bellTimer); bellTimer = null; } }

// 相对时间（通知列表用）
function relTime(ts) {
  if (!ts) return '';
  const then = new Date(ts.replace(' ', 'T') + 'Z').getTime();
  const diff = Date.now() - then;
  if (diff < 60e3) return '刚刚';
  if (diff < 3600e3) return Math.floor(diff / 60e3) + ' 分钟前';
  if (diff < 86400e3) return Math.floor(diff / 3600e3) + ' 小时前';
  return Math.floor(diff / 86400e3) + ' 天前';
}

// ---------- 全站搜索（v2.3） ----------
async function viewSearch(args, query) {
  const qs = new URLSearchParams(query || '');
  const q = (qs.get('q') || '').trim();
  app.innerHTML = `
    <h2 class="page-title">搜索</h2>
    <form class="search-page-box" id="sp-form">
      <input class="input" id="sp-q" name="q" value="${esc(q)}" placeholder="搜索词条 / 资讯 / 帖子" maxlength="50" autofocus>
      <button class="btn" type="submit">搜索</button>
    </form>
    <div id="sp-result"><div class="muted">输入关键词开始搜索</div></div>`;
  $('#sp-form').addEventListener('submit', (e) => {
    e.preventDefault();
    const v = $('#sp-q').value.trim();
    if (v) location.hash = '#/search?q=' + encodeURIComponent(v);
  });
  if (!q) return;
  const box = $('#sp-result');
  box.innerHTML = '<div class="muted">搜索中…</div>';
  let d;
  try { d = await api('/api/search?q=' + encodeURIComponent(q)); }
  catch (e) { box.innerHTML = `<div class="card">搜索失败：${esc(e.message || '网络错误')}</div>`; return; }
  const total = d.wiki.length + d.news.length + d.forum.length;
  if (!total) {
    box.innerHTML = `<div class="card">没有找到与「${esc(q)}」相关的内容</div>`;
    return;
  }
  const KIND_LABEL = { page: '词条', folder: '目录', grade: '年级', class: '班级', teacher: '教师' };
  box.innerHTML = `
    <div class="muted" style="margin-bottom:12px">找到 ${total} 条与「${esc(q)}」相关的结果</div>
    ${d.wiki.length ? `<div class="card" style="margin-bottom:14px">
      <h3 style="margin-bottom:10px">📄 档案库（${d.wiki.length}）</h3>
      ${d.wiki.map((w) => `
        <div class="sp-row"><a href="#/wiki/${encodeURIComponent(w.slug)}">${esc(w.title)}</a>
          <span class="badge badge-gray">${KIND_LABEL[w.kind] || w.kind}</span>
          ${w.grade ? `<span class="muted" style="font-size:12.5px">${esc(w.grade)}${esc(w.class_name || '')}</span>` : ''}
        </div>`).join('')}
    </div>` : ''}
    ${d.news.length ? `<div class="card" style="margin-bottom:14px">
      <h3 style="margin-bottom:10px">📰 资讯（${d.news.length}）</h3>
      ${d.news.map((n) => `
        <div class="sp-row"><a href="#/news/${n.id}">${esc(n.title)}</a>
          ${n.summary ? `<span class="muted" style="font-size:12.5px">${esc(n.summary.slice(0, 40))}${n.summary.length > 40 ? '…' : ''}</span>` : ''}
        </div>`).join('')}
    </div>` : ''}
    ${d.forum.length ? `<div class="card" style="margin-bottom:14px">
      <h3 style="margin-bottom:10px">💬 论坛（${d.forum.length}）</h3>
      ${d.forum.map((t) => `
        <div class="sp-row"><a href="#/forum/t/${t.id}">${esc(t.title)}</a>
          <span class="muted" style="font-size:12.5px">${t.reply_count} 帖</span>
        </div>`).join('')}
    </div>` : ''}`;
}

async function loadMe() {
  try {
    const res = await fetch('/api/auth/me', { credentials: 'same-origin' });
    // 401 = 确实未登录，清空；5xx/网络错 = 服务端抖动（如 D1 限额），保留现有登录态，
    // 避免管理员身份被误清导致删除/管理等入口全部消失（v1.6 修复「删除功能不能用」表象）。
    if (res.status === 401) { state.user = null; state.memberships = []; return; }
    if (!res.ok) throw new Error('server error');
    const d = await res.json();
    state.user = d.user; state.memberships = d.memberships || [];
    NW_THEME.bootFromServer(d.theme); // 服务端主题覆盖本地缓存
  } catch { /* 保留原状；未登录用户本就是 null */ }
}

// ---------- 加入说明强制门（未阅读过的登录用户，刷新后弹出，不完成不能用站） ----------
function checkDisclaimerGate() {
  if (!state.user || state.user.disclaimer_ok) return;
  if (document.getElementById('dc-gate')) return;
  const gate = document.createElement('div');
  gate.id = 'dc-gate';
  gate.style.cssText = 'position:fixed;inset:0;z-index:300;display:flex;align-items:center;justify-content:center;background:rgba(34,29,22,.55);backdrop-filter:blur(2px);padding:20px';
  document.body.appendChild(gate);
  const box = document.createElement('div');
  box.className = 'modal';
  box.style.maxWidth = '520px';
  box.innerHTML = `
    <h3>加入说明</h3>
    <div class="muted" style="margin-bottom:10px">站规已更新，阅读并签名后才能继续使用</div>
    <div class="disclaimer">${window.NW.DISCLAIMER_HTML}</div>
    <div class="field" style="margin:14px 0 0">
      <span>签名（请用鼠标或触屏手写签名）</span>
      <div class="sign-wrap"><canvas id="dc-sign" width="600" height="140"></canvas><span class="sign-hint" id="dc-sign-hint">在此签名</span></div>
    </div>
    <div class="row" style="justify-content:flex-end">
      <button class="btn" id="dc-gate-ok" disabled>我已阅读并理解（5）</button>
    </div>`;
  gate.appendChild(box);
  const btn = box.querySelector('#dc-gate-ok');
  let left = 5;
  const timer = setInterval(() => {
    left--;
    if (left <= 0) { clearInterval(timer); btn.disabled = false; btn.textContent = '我已阅读并理解'; }
    else btn.textContent = `我已阅读并理解（${left}）`;
  }, 1000);
  const sign = NW.bindSignature(box.querySelector('#dc-sign'), () => { box.querySelector('#dc-sign-hint').hidden = true; });
  btn.addEventListener('click', async () => {
    if (!sign.signed()) { toast('请在签名区完成签名', true); return; }
    try {
      await api('/api/auth/disclaimer-accept', { method: 'POST', body: '{}' });
      state.user.disclaimer_ok = 1;
      gate.remove();
      toast('感谢阅读，欢迎继续使用');
    } catch (err) { toast(err.message, true); }
  });
}

// ---------- 路由 ----------
function parseRoute() {
  const h = location.hash.replace(/^#\/?/, '');
  const qi = h.indexOf('?');
  const path = qi >= 0 ? h.slice(0, qi) : h;
  const query = qi >= 0 ? h.slice(qi + 1) : '';
  const parts = path.split('/').filter(Boolean);
  return { name: parts[0] || 'home', args: parts.slice(1), query };
}
async function render() {
  const { name, args, query } = parseRoute();
  // 路由切换即收起移动端菜单/抽屉（点导航链接或目录词条都会走这里）
  document.body.classList.remove('nav-open', 'side-open');
  renderNav();
  // 档案库走全屏文档站布局（脱离 .container 宽度限制）
  app.classList.remove('wiki-mode');
  document.body.classList.toggle('wiki-route', name === 'wiki');
  const views = { home: viewHome, news: viewNews, orgs: viewOrgs, wiki: viewWiki, me: viewMe, admin: viewAdmin, manage: viewManage, privacy: viewPrivacy, changelog: viewChangelog, forum: viewForum, search: viewSearch, theme: (a, q) => NW_THEME.viewTheme(app, q), themes: (a, q) => (a[0] ? NW_THEME.viewThemeDetail(app, a[0], q) : NW_THEME.viewThemes(app, q)) };
  const fn = views[name] || viewHome;
  try { await fn(args, query); } catch (e) { if (e.message !== '请先登录') app.innerHTML = `<div class="card">加载失败：${esc(e.message)}</div>`; }
  if (name !== 'wiki') window.scrollTo(0, 0);
}

// ---------- 首页 ----------
async function viewHome() {
  app.innerHTML = '<div class="empty">加载中…</div>';
  const [home, settings] = await Promise.all([api('/api/admin/home'), api('/api/admin/settings')]);
  state.settings = settings.settings || {};
  const s = state.settings;
  app.innerHTML = `
    <div class="hero">
      <img class="hero-logo" src="/logo.png" alt="宁外八一">
      <h1>${esc(s.site_name || '宁外八一')}</h1>
      <div class="hero-sub">宁波外国语学校 · 浙江省八一学校</div>
      <p class="hero-desc">资讯、档案库与组织，共建我们的数字校园。加入组织，与同学一起维护属于我们自己的校园档案。</p>
      <div class="row">
        <a class="btn" href="#/wiki">进入档案库</a>
        <a class="btn btn-outline" href="#/orgs">浏览组织</a>
      </div>
    </div>
    ${s.announcement ? `<div class="announce">📢 ${esc(s.announcement)}</div>` : ''}
    ${state.user ? `<div class="user-bar">
      <span>👋 你好，<b>${esc(state.user.display_name || state.user.username)}</b></span>
      <div class="spacer"></div>
      <a class="btn btn-outline btn-sm" href="#/me">个人中心</a>
      <a class="btn btn-outline btn-sm" href="#/orgs">我的组织</a>
    </div>` : ''}
    <div class="anniv-cta" id="anniv-cta" hidden>
      <span>🎂 宁外八一 35 周年校庆进行中</span>
      <button class="btn btn-sm" id="anniv-replay">再看校庆动画</button>
    </div>
    <div class="stat-row">
      <div class="stat"><b>${home.page_count}</b><span>档案页面</span></div>
      <div class="stat"><b>${home.user_count}</b><span>注册用户</span></div>
      <div class="stat"><b>${home.org_count}</b><span>公开组织</span></div>
      <div class="stat"><b>${home.news.length}</b><span>最新资讯</span></div>
    </div>
    <div class="grid2">
      <div class="card">
        <div class="row" style="margin-bottom:12px"><h3>最新资讯</h3><div class="spacer"></div><a href="#/news" class="muted">全部 →</a></div>
        ${home.news.length ? home.news.map((n) => `
          <div style="padding:8px 0;border-bottom:1px solid #f0ece1">
            ${n.pinned ? '<span class="badge badge-amber">置顶</span> ' : ''}
            <a href="#/news/${n.id}">${esc(n.title)}</a>
            <div class="muted">${fmtDate(n.published_at)}</div>
          </div>`).join('') : '<div class="muted">暂无资讯</div>'}
      </div>
      <div class="card">
        <div class="row" style="margin-bottom:12px"><h3>档案库动态</h3><div class="spacer"></div><a href="#/wiki" class="muted">去编辑 →</a></div>
        ${home.recent.length ? home.recent.map((p) => `
          <div style="padding:8px 0;border-bottom:1px solid #f0ece1">
            <a href="#/wiki/${encodeURIComponent(p.slug)}">${esc(p.title)}</a>
            <div class="muted">${esc(p.grade)}${p.class_name ? ' · ' + esc(p.class_name) : ''} · ${fmtDate(p.updated_at)}</div>
          </div>`).join('') : '<div class="muted">暂无动态</div>'}
      </div>
    </div>
    <div class="card">
      <div class="row" style="margin-bottom:12px"><h3>论坛热帖</h3><div class="spacer"></div><a href="#/forum" class="muted">进论坛 →</a></div>
      ${home.hot.length ? home.hot.map((t) => `
        <div style="padding:8px 0;border-bottom:1px solid #f0ece1">
          <a href="#/forum/t/${t.id}">${esc(t.title)}</a>
          <span class="badge badge-gray">${esc(t.category)}</span>
          ${t.featured ? '<span class="badge badge-feat">精华</span>' : ''}
          <div class="muted">${t.reply_count} 回复 · ${t.views} 浏览</div>
        </div>`).join('') : '<div class="muted">论坛还没有主题，<a href="#/forum">去发第一帖</a></div>'}
    </div>`;
  // 校庆动画 CTA：看过动画的用户显示「再看一次」
  if (window.NW_ANNIV?.seen()) {
    $('#anniv-cta').hidden = false;
    $('#anniv-replay').addEventListener('click', () => window.NW_ANNIV.replay());
  }
}

// ---------- 资讯 ----------
async function viewNews(args, query) {
  // 数字参数 = 资讯 ID（简洁链接）；非数字 = 旧版 slug 链接（兼容已分享的地址）
  if (args[0]) {
    if (/^\d+$/.test(args[0])) return viewNewsDetail(args[0]);
    let slug = args[0];
    try { slug = decodeURIComponent(slug); } catch (e) { /* 非编码串原样使用 */ }
    return viewNewsDetail(slug);
  }
  const page = Math.max(parseInt((query.match(/page=(\d+)/) || [])[1]) || 1, 1);
  const d = await api('/api/news?page=' + page);
  const totalPages = Math.max(1, Math.ceil(d.total / d.size));
  app.innerHTML = `
    <h2 class="page-title">站点资讯</h2>
    ${d.news.map((n) => `
      <div class="card">
        <div class="news-head">
          ${n.pinned ? '<span class="badge badge-amber">置顶</span>' : ''}<a class="news-title" href="#/news/${n.id}">${esc(n.title)}</a>
        </div>
        ${n.summary ? `<p class="muted" style="margin-bottom:8px">${esc(n.summary)}</p>` : ''}
        <div class="muted">${fmtDate(n.published_at)} · ${esc(n.author)}</div>
      </div>`).join('') || '<div class="empty">暂无资讯</div>'}
    <div class="row" style="justify-content:center;margin-top:16px">
      <button class="btn btn-outline btn-sm" id="pg-prev" ${page <= 1 ? 'disabled' : ''}>上一页</button>
      <span class="muted">${page} / ${totalPages}</span>
      <button class="btn btn-outline btn-sm" id="pg-next" ${page >= totalPages ? 'disabled' : ''}>下一页</button>
    </div>`;
  const go = (p) => (location.hash = '#/news?page=' + p);
  if (page > 1) $('#pg-prev').addEventListener('click', () => go(page - 1));
  if (page < totalPages) $('#pg-next').addEventListener('click', () => go(page + 1));
}
async function viewNewsDetail(idOrSlug) {
  const path = /^\d+$/.test(idOrSlug) ? '/api/news/id/' + idOrSlug : '/api/news/' + encodeURIComponent(idOrSlug);
  const { news } = await api(path);
  const canDel = state.user?.role === 'website_admin';
  app.innerHTML = `
    <div class="card">
      <div class="row" style="margin-bottom:4px">
        ${news.pinned ? '<span class="badge badge-amber">置顶</span>' : ''}
        <h2>${esc(news.title)}</h2>
        <div class="spacer"></div>
        ${canDel ? `<button class="btn btn-danger btn-sm" id="news-del">删除</button>` : ''}
      </div>
      <div class="muted" style="margin-bottom:14px">${fmtDate(news.published_at)} · ${esc(news.author)}</div>
      <div class="md">${md(news.content)}</div>
    </div>
    <a href="#/news" class="muted">← 返回资讯列表</a>`;
  if (canDel) $('#news-del').addEventListener('click', async () => {
    if (!confirm('确定删除这条资讯？')) return;
    try {
      await api('/api/admin/news/' + news.id + '/delete', { method: 'POST', body: '{}' });
      toast('已删除'); location.hash = '#/news';
    } catch (err) { toast(err.message, true); }
  });
}

// ---------- 组织 ----------
async function viewOrgs() {
  app.innerHTML = `
    <h2 class="page-title">组织</h2>
    <div class="card">
      <div class="row">
        <input class="input" id="org-q" placeholder="搜索组织名称 / 简介" style="flex:1;min-width:200px">
        <button class="btn" id="org-search">搜索</button>
        <div class="spacer"></div>
        <button class="btn btn-outline" id="invite-btn">使用邀请码加入</button>
      </div>
    </div>
    <div id="org-list"><div class="empty">加载中…</div></div>`;
  const load = async (q) => {
    const d = await api('/api/orgs' + (q ? '?q=' + encodeURIComponent(q) : ''));
    const list = $('#org-list');
    if (!d.orgs.length) { list.innerHTML = '<div class="empty">没有找到公开组织</div>'; return; }
    list.innerHTML = d.orgs.map((o) => `
      <div class="card">
        <div class="row">
          <b>${esc(o.name)}</b>
          ${o.type === 'private' ? '<span class="badge badge-gray">私有</span>' : '<span class="badge badge-green">公开</span>'}
          ${o.join_mode === 'approval' ? '<span class="badge badge-amber">需审核</span>' : ''}
          <div class="spacer"></div>
          <button class="btn btn-sm" data-join="${esc(o.slug)}">加入</button>
        </div>
        ${o.description ? `<p class="muted" style="margin-top:6px">${esc(o.description)}</p>` : ''}
      </div>`).join('');
    $$('[data-join]', list).forEach((b) => b.addEventListener('click', () => joinOrg(b.dataset.join)));
  };
  await load('');
  $('#org-search').addEventListener('click', () => load($('#org-q').value.trim()));
  $('#org-q').addEventListener('keydown', (e) => { if (e.key === 'Enter') load($('#org-q').value.trim()); });
  $('#invite-btn').addEventListener('click', () => {
    modal(`
      <h3>邀请码加入</h3>
      <form id="m-invite">
        <label class="field"><span>邀请码</span><input class="input" name="code" required></label>
        <div class="row" style="justify-content:flex-end"><button class="btn" type="submit">加入</button></div>
      </form>`, async (box, close) => {
      $('#m-invite', box).addEventListener('submit', async (e) => {
        e.preventDefault();
        try {
          await api('/api/orgs/join-invite', { method: 'POST', body: JSON.stringify({ code: e.target.code.value.trim() }) });
          close(); toast('已加入组织'); await loadMe(); renderNav();
        } catch (err) { toast(err.message, true); }
      });
    });
  });
}
function joinOrg(slug) {
  if (!state.user) return openLogin();
  modal(`
    <h3>加入组织</h3>
    <form id="m-join">
      <label class="field"><span>班级</span>
        <div class="row">
          <select class="input" id="j-grade" style="flex:1"></select>
          <select class="input" id="j-class" style="flex:1"></select>
        </div>
      </label>
      <label class="field"><span>姓名</span><input class="input" name="real_name" required maxlength="30" placeholder="张三"></label>
      <label class="field"><span>学号</span><input class="input" name="student_no" required maxlength="2" placeholder="01"></label>
      <div class="muted" style="margin-bottom:10px">信息仅对同组织成员与管理员可见</div>
      <div class="row" style="justify-content:flex-end"><button class="btn" type="submit">提交</button></div>
    </form>`, async (box, close) => {
    const g = $('#j-grade', box), c = $('#j-class', box);
    GRADES.forEach((x) => { const o = document.createElement('option'); o.value = x; o.textContent = x + ' 级'; g.appendChild(o); });
    const fill = () => { c.innerHTML = ''; for (let i = 1; i <= 10; i++) { const cls = g.value + String(i).padStart(2, '0'); const o = document.createElement('option'); o.value = cls; o.textContent = cls; c.appendChild(o); } };
    g.addEventListener('change', fill); fill();
    $('#m-join', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        const d = await api('/api/orgs/' + encodeURIComponent(slug) + '/join', {
          method: 'POST', body: JSON.stringify({ class_name: c.value, real_name: f.real_name.value.trim(), student_no: f.student_no.value.trim() }),
        });
        close();
        toast(d.status === 'pending' ? '已提交，等待组织管理员审核' : '加入成功');
        await loadMe(); renderNav();
      } catch (err) { toast(err.message, true); }
    });
  });
}

// ---------- 档案库（全屏文档站：左文件树 / 右正文 / 右上搜索）----------
const WIKI_ICON = { folder: '📁', grade: '🎓', class: '🏫', student: '🧑‍🎓', teacher: '👨‍🏫', page: '📄' };
const WIKI_LABEL = { folder: '文件夹', grade: '年级页', class: '班级页', student: '学生页', teacher: '老师页', page: '词条' };
const WIKI_ORDER = { folder: 0, grade: 1, class: 2, page: 3, student: 4, teacher: 5 };
let wikiTree = null; // 树缓存；结构变更（建/移/删）后置空重取
let wikiPerm = 'create_edit_review'; // 当前组织的普通用户权限（随树缓存一起刷新）
let wikiOpen = new Set(); // 树的展开态（跨导航保留；手动折叠也会记住）
let wikiStudents = new Map(); // 班级名 -> 学生节点数组（tree 默认不含学生，展开班级时按需拉取）
let wikiStudentLoading = new Map(); // 班级名 -> Promise（同班并发去重）
function wikiInvalidate() { wikiTree = null; wikiStudents = new Map(); }
// 按需拉取某班学生名单并缓存。返回本次是否新拉取了数据（调用方负责合入树与重绘）。
// 失败不写缓存（下次展开/打开会重试）；同班并发共享同一个 Promise。
async function wikiEnsureStudents(classNode) {
  if (!classNode || classNode.kind !== 'class' || !classNode.class_name) return false;
  if (wikiStudents.has(classNode.class_name)) return false;
  if (wikiStudentLoading.has(classNode.class_name)) {
    await wikiStudentLoading.get(classNode.class_name).catch(() => {});
    return false; // 并发等待：由先到的调用负责合入与重绘
  }
  const p = api('/api/wiki/pages?kind=student&class=' + encodeURIComponent(classNode.class_name) + '&size=all')
    .then((st) => { wikiStudents.set(classNode.class_name, st.pages || []); })
    .finally(() => { wikiStudentLoading.delete(classNode.class_name); });
  wikiStudentLoading.set(classNode.class_name, p);
  await p.catch(() => {}); // 失败不缓存，允许下次重试
  return true;
}
// 把已缓存的学生节点合并进树。判重以 nodes 数组现场构建 id Set（不用调用方的 byId——
// 并发展开多个班级时，旧 ctx 的 byId 可能漏掉其他请求刚合入的节点，导致同 id 重复 push，
// 树里同一文档显示多遍）。有变化时返回新 childMap，否则原样返回。
function wikiMergeStudents(nodes, childMap) {
  const have = new Set(nodes.map((n) => n.id));
  let changed = false;
  for (const stus of wikiStudents.values()) {
    for (const s of stus) {
      if (!have.has(s.id)) { nodes.push(s); have.add(s.id); changed = true; }
    }
  }
  return changed ? wikiChildMap(nodes) : childMap;
}
// 合并学生后同步 byId（原地 mutate，保持 ctx.byId 引用有效）
function wikiSyncById(nodes, byId) {
  for (const n of nodes) if (!byId.has(n.id)) byId.set(n.id, n);
}
function fmtSize(b) { return b < 1024 ? b + ' B' : b < 1048576 ? (b / 1024).toFixed(1) + ' KB' : (b / 1048576).toFixed(2) + ' MB'; }
function wikiChildMap(nodes) {
  const m = new Map();
  for (const n of nodes) {
    const pid = n.parent_id || 0;
    if (!m.has(pid)) m.set(pid, []);
    m.get(pid).push(n);
  }
  for (const arr of m.values()) arr.sort((a, b) => (WIKI_ORDER[a.kind] ?? 9) - (WIKI_ORDER[b.kind] ?? 9) || a.title.localeCompare(b.title, 'zh'));
  return m;
}
// 目录下拉选项（缩进表示层级；banned 中的节点不可选）
function parentOptions(nodes, selectedId, banned) {
  const m = wikiChildMap(nodes);
  const out = ['<option value="">— 根目录 —</option>'];
  const walk = (pid, depth) => {
    for (const n of m.get(pid) || []) {
      if (banned?.has(n.id)) continue;
      out.push(`<option value="${n.id}"${n.id === selectedId ? ' selected' : ''}>${'　'.repeat(Math.min(depth, 6))}${WIKI_ICON[n.kind] || '📄'} ${esc(n.title)}</option>`);
      walk(n.id, depth + 1);
    }
  };
  walk(0, 0);
  return out.join('');
}
function classOptions(nodes) {
  return nodes.filter((n) => n.kind === 'class')
    .sort((a, b) => a.class_name.localeCompare(b.class_name))
    .map((n) => `<option value="${esc(n.class_name)}">${esc(n.title)}</option>`).join('') || '<option value="">（尚无班级页）</option>';
}

async function viewWiki(args) {
  const slug = args[0] ? decodeURIComponent(args[0]) : null;
  app.classList.add('wiki-mode');
  let fresh = false;
  let treeErr = null;
  if (!wikiTree) {
    try { const t = await api('/api/wiki/tree'); wikiTree = t.nodes || []; wikiPerm = t.perm || 'create_edit_review'; }
    catch (err) { wikiTree = []; treeErr = err; }
    fresh = true;
  }
  const nodes = wikiTree;
  const byId = new Map(nodes.map((n) => [n.id, n]));
  let childMap = wikiChildMap(nodes);
  // 当前页的祖先链 + 自身（有子节点时）自动展开；展开态跨导航保留
  const activeNode = slug ? nodes.find((n) => n.slug === slug) : null;
  // 班级页首次打开：按需拉学生名单（tree 默认不含学生，避免每次全量 3689 行）
  if (activeNode?.kind === 'class' && await wikiEnsureStudents(activeNode)) {
    const m = wikiMergeStudents(nodes, childMap);
    if (m !== childMap) { childMap = m; wikiSyncById(nodes, byId); }
    if (!wikiStudents.get(activeNode.class_name)?.length) toast('学生名单加载失败，再次打开本页可重试', true);
  }
  if (activeNode && (activeNode.kind === 'class' || (childMap.get(activeNode.id) || []).length)) wikiOpen.add(activeNode.id);
  let cur = activeNode;
  while (cur && cur.parent_id) { wikiOpen.add(cur.parent_id); cur = byId.get(cur.parent_id); }
  const isAdmin = state.user?.role === 'website_admin' || state.memberships.some((m) => m.role === 'org_admin' && m.status === 'approved');
  const ctx = { nodes, byId, childMap, isAdmin, activeNode, slug, perm: wikiPerm };

  if (!$('#wiki-shell') || fresh) {
    app.innerHTML = `
      <div class="wiki-shell" id="wiki-shell">
        <div class="wiki-mask" id="wiki-mask"></div>
        <aside class="wiki-side" id="wiki-side"></aside>
        <div class="wiki-main">
          <div class="wiki-topbar">
            <button class="wiki-side-toggle" id="wiki-side-toggle" aria-label="打开目录">☰ 目录</button>
            <div class="wiki-crumb" id="wiki-crumb"></div>
            <div class="wiki-search"><input class="input" id="wiki-search" placeholder="搜索词条…" autocomplete="off"></div>
          </div>
          <div class="wiki-scroll" id="wiki-scroll">
            <div class="wiki-cols">
              <article class="wiki-article" id="wiki-article"></article>
              <aside class="wiki-toc" id="wiki-toc"></aside>
            </div>
          </div>
        </div>
      </div>`;
    renderWikiSide(ctx);
    if (treeErr) {
      const wt = $('#wiki-side .wt');
      if (wt) wt.innerHTML = `<div class="empty" style="padding:12px">目录加载失败：${esc(treeErr.message)}<br><button class="btn btn-outline btn-sm" id="wiki-tree-retry" style="margin-top:8px">重试</button></div>`;
      $('#wiki-tree-retry')?.addEventListener('click', () => { wikiTree = null; render(); });
    }
    const search = $('#wiki-search');
    let timer;
    search.addEventListener('input', () => { clearTimeout(timer); timer = setTimeout(() => wikiSearch(search.value.trim(), ctx), 300); });
    search.addEventListener('keydown', (e) => { if (e.key === 'Enter') { clearTimeout(timer); wikiSearch(search.value.trim(), ctx); } });
    $('#wiki-scroll').addEventListener('scroll', () => wikiScrollSpy(), { passive: true });
    // 移动端目录抽屉：开 / 遮罩点击关
    $('#wiki-side-toggle').onclick = () => document.body.classList.toggle('side-open');
    $('#wiki-mask').onclick = () => document.body.classList.remove('side-open');
  } else {
    // 壳已存在：只同步展开态与高亮，不重建 DOM
    wikiSyncOpen();
    $$('#wiki-side .wt-link').forEach((a) => a.classList.toggle('active', a.dataset.slug === slug));
  }
  await wikiRenderPane(ctx);
}

// 左侧文件树：标题链接 = 跳转右侧；chevron 按钮 = 展开/折叠（展开时同时打开右侧页面）
function renderWikiSide(ctx) {
  const { childMap, slug, nodes, isAdmin } = ctx;
  const renderNode = (n) => {
    const kids = childMap.get(n.id) || [];
    const icon = WIKI_ICON[n.kind] || '📄';
    const active = slug === n.slug;
    const link = `<a class="wt-link ${active ? 'active' : ''}" data-slug="${esc(n.slug)}" href="#/wiki/${encodeURIComponent(n.slug)}">${icon} <span class="wt-name">${esc(n.title)}</span></a>`;
    // 班级页默认不带学生子节点（tree 不含学生），但仍渲染 chevron：首次展开时懒加载
    if (kids.length || n.kind === 'class') {
      return `<div class="wt-node" data-id="${n.id}">
        <div class="wt-row">
          <button type="button" class="wt-toggle" data-toggle="${n.id}" aria-label="展开/折叠 ${esc(n.title)}"></button>
          ${link}
          ${kids.length ? `<span class="wt-count">${kids.length}</span>` : ''}
        </div>
        <div class="wt-kids">${kids.map(renderNode).join('')}</div>
      </div>`;
    }
    return `<div class="wt-row"><span class="wt-toggle leaf" aria-hidden="true"></span>${link}</div>`;
  };
  const roots = childMap.get(0) || [];
  const defParent = ctx.activeNode ? (ctx.activeNode.kind === 'folder' ? ctx.activeNode.id : ctx.activeNode.parent_id) : null;
  // 按钮可见性跟随组织权限：all=可建文件夹；all_review=普通用户不可新建
  const canCreate = !!state.user && (isAdmin || wikiPerm !== 'all_review');
  const canFolder = isAdmin || wikiPerm === 'all';
  const addBtns = !state.user
    ? '<span class="login-hint">登录后可新建词条</span>'
    : (canCreate ? '<button class="btn btn-sm" id="wiki-new-page">＋ 新词条</button>' : '')
      + (canFolder ? '<button class="btn btn-outline btn-sm" id="wiki-new-folder">＋ 文件夹</button>' : '')
      + (!canCreate && !canFolder ? '<span class="login-hint">当前组织为「全部需审核」，仅管理员可新建</span>' : '');
  $('#wiki-side').innerHTML = `
    <div class="wiki-side-head">
      <div class="wiki-side-title">📚 档案库</div>
      <div class="tree-add">${addBtns}</div>
    </div>
    <div class="wt">${roots.map(renderNode).join('') || '<div class="muted" style="padding:8px">暂无内容</div>'}</div>`;
  wikiSyncOpen();
  // chevron 只负责展开/折叠，不跳转页面；跳转由标题链接完成（跳转后自动展开目标节点）
  $$('#wiki-side .wt-toggle[data-toggle]').forEach((b) => b.addEventListener('click', async () => {
    const id = +b.dataset.toggle;
    if (wikiOpen.has(id)) { wikiOpen.delete(id); wikiSyncOpen(); return; }
    wikiOpen.add(id);
    // 班级节点首次展开：按需拉学生名单合入树后整体重绘（展开态由 wikiOpen 保留）。
    // 判重以 nodes 现场 Set 为准，并发展开多个班级也不会重复插入。
    const node = ctx.byId.get(id);
    if (node?.kind === 'class' && await wikiEnsureStudents(node)) {
      const m = wikiMergeStudents(ctx.nodes, ctx.childMap);
      if (m !== ctx.childMap) { ctx.childMap = m; wikiSyncById(ctx.nodes, ctx.byId); }
      renderWikiSide(ctx);
      if (!wikiStudents.get(node.class_name)?.length) toast('学生名单加载失败，再次点击可重试', true);
      return;
    }
    wikiSyncOpen();
  }));
  $('#wiki-new-page')?.addEventListener('click', () => wikiNewDialog(ctx, defParent));
  $('#wiki-new-folder')?.addEventListener('click', () => wikiFolderDialog(ctx, defParent));
}

// 按 wikiOpen 同步所有节点的展开/折叠与 chevron 旋转
function wikiSyncOpen() {
  $$('#wiki-side .wt-node').forEach((node) => {
    const open = wikiOpen.has(+node.dataset.id);
    const kids = node.querySelector(':scope > .wt-kids');
    const tgl = node.querySelector(':scope > .wt-row > .wt-toggle');
    if (kids) kids.hidden = !open;
    tgl?.classList.toggle('open', open);
  });
}

// 渲染右栏（面包屑 + 正文/首页/搜索结果）
async function wikiRenderPane(ctx) {
  const { slug, activeNode } = ctx;
  const crumb = $('#wiki-crumb');
  const search = $('#wiki-search');
  if (slug) {
    if (search.value) search.value = '';
    // 接口瞬断时不再抛出（否则路由层会把整个文档站替换成错误卡）——
    // 页内显示错误 + 重试按钮，左侧树与界面保持可用。
    let d;
    try {
      d = await api('/api/wiki/pages/' + encodeURIComponent(slug));
    } catch (err) {
      crumb.innerHTML = `<b>${esc(activeNode?.title || slug)}</b>`;
      $('#wiki-toc').innerHTML = '';
      $('#wiki-article').innerHTML = `
        <div class="empty">
          <p>页面加载失败：${esc(err.message)}</p>
          <button class="btn btn-outline btn-sm" id="wiki-retry">重试</button>
        </div>`;
      $('#wiki-retry').addEventListener('click', () => wikiRenderPane(ctx));
      return;
    }
    wikiRenderCrumb(crumb, d.ancestors, d.page);
    wikiRenderArticle(ctx, d);
    wikiBuildToc();
  } else if (search.value.trim()) {
    await wikiSearch(search.value.trim(), ctx);
  } else {
    crumb.innerHTML = '<b>档案库</b>';
    await wikiRenderHome(ctx);
    $('#wiki-toc').innerHTML = '';
  }
}

function wikiRenderCrumb(el, ancestors, page) {
  const parts = ['<a href="#/wiki">档案库</a>'];
  for (const a of ancestors) parts.push(`<a href="#/wiki/${encodeURIComponent(a.slug)}">${esc(a.title)}</a>`);
  parts.push(`<b>${esc(page.title)}</b>`);
  el.innerHTML = parts.join('<span class="sep">/</span>');
}

// 档案库首页（无 slug）：简介 + 最近更新
async function wikiRenderHome(ctx) {
  const art = $('#wiki-article');
  const canCreate = !!state.user && (ctx.isAdmin || ctx.perm !== 'all_review');
  const canFolder = ctx.isAdmin || ctx.perm === 'all';
  art.innerHTML = `
    <h1>📚 档案库</h1>
    <div class="wiki-meta">
      <span>左侧是文件树。${canFolder ? '任何登录用户都可以新建词条、编辑页面、上传附件；普通用户也可以新建文件夹。' : canCreate ? '任何登录用户都可以新建词条、编辑页面、上传附件。' : '当前组织权限为「全部需审核」，普通用户可提交修改供管理员审核。'}</span>
    </div>
    <div class="wiki-actions" style="margin-bottom:8px">
      ${canCreate ? '<button class="btn btn-sm" id="wh-new">＋ 新建词条</button>' : ''}
      ${canFolder ? '<button class="btn btn-outline btn-sm" id="wh-folder">＋ 新建文件夹</button>' : ''}
    </div>
    <section class="wiki-sec" style="margin-top:22px">
      <div class="wiki-sec-h">🕐 最近更新</div>
      <div class="wiki-sec-b" id="wh-recent"><div class="muted">加载中…</div></div>
    </section>`;
  $('#wh-new')?.addEventListener('click', () => wikiNewDialog(ctx, null));
  $('#wh-folder')?.addEventListener('click', () => wikiFolderDialog(ctx, null));
  const recent = await api('/api/wiki/pages');
  $('#wh-recent').innerHTML = recent.pages.length ? `<div class="chip-grid">${recent.pages.slice(0, 18).map((p) => `
    <a class="chip" href="#/wiki/${encodeURIComponent(p.slug)}">${WIKI_ICON[p.kind] || '📄'} <span class="wt-name">${esc(p.title)}</span></a>`).join('')}</div>
    <div class="muted" style="margin-top:10px">使用右上角搜索可快速定位词条</div>` : '<div class="muted">暂无页面</div>';
}

// 词条正文页
async function wikiRenderArticle(ctx, d) {
  const p = d.page;
  const isFolder = p.kind === 'folder';
  // 正文以「# 标题」开头时去掉，避免与页面大标题重复
  let body = d.content || '';
  const lead = '# ' + p.title;
  if (body.trim().startsWith(lead)) body = body.trim().slice(lead.length).trim();
  const actions = [];
  // 编辑是否免审：管理员 always；普通用户按组织权限（all/create_edit 免审，其余待审）
  const directEdit = d.is_admin || ctx.perm === 'all' || ctx.perm === 'create_edit';
  if (!isFolder) actions.push(d.can_edit ? `<button class="btn btn-sm" id="wiki-edit">${directEdit ? '编辑' : '提交修改'}</button>` : '<button class="btn btn-outline btn-sm" id="wiki-edit">登录后编辑</button>');
  actions.push('<button class="btn btn-outline btn-sm" id="wiki-history">历史</button>');
  if (d.is_admin) {
    if (!isFolder && !directEdit) actions.push('<button class="btn btn-outline btn-sm" id="wiki-save">直接保存</button>');
    actions.push('<button class="btn btn-outline btn-sm" id="wiki-move">移动</button>');
    actions.push('<button class="btn btn-danger btn-sm" id="wiki-del">删除</button>');
  }
  const meta = [`<span class="badge badge-gray">${WIKI_LABEL[p.kind] || p.kind}</span>`];
  if (p.grade) meta.push(esc(p.grade));
  if (p.class_name) meta.push(esc(p.class_name));
  meta.push(d.current_rev ? '最后修订：' + esc(d.current_rev.username) + ' @ ' + fmtDate(d.current_rev.created_at) : '尚未有内容');
  if (p.has_pending) meta.push('<span class="badge badge-amber">有待审修改</span>');

  const sec = (icon, title, count, inner, extra = '') => `
    <section class="wiki-sec">
      <div class="wiki-sec-h">${icon} ${esc(title)}${count != null ? `<span class="wt-count">${count}</span>` : ''}<span class="spacer"></span>${extra}</div>
      <div class="wiki-sec-b">${inner}</div>
    </section>`;

  let studentsHtml = '';
  let stus = [];
  if (p.kind === 'class') {
    // 学生名单在 viewWiki 打开本页时已按需拉取并缓存，此处直接复用，不重复请求
    if (!wikiStudents.has(p.class_name)) await wikiEnsureStudents(p);
    stus = wikiStudents.get(p.class_name) || [];
    studentsHtml = stus.length ? sec('🧑‍🎓', '学生', stus.length, `
      <div class="chip-grid" id="stu-grid">${stus.map((s) => `
        <span class="chip stu-chip"><a href="#/wiki/${encodeURIComponent(s.slug)}"><span class="wt-name">${esc(s.title.replace(p.class_name + ' · ', ''))}</span></a>${d.is_admin ? `<button type="button" class="stu-del" data-slug="${esc(s.slug)}" title="删除该学生页">×</button>` : ''}</span>`).join('')}</div>
      ${d.is_admin ? `<div class="row" style="margin-top:10px"><button class="btn btn-outline btn-sm" id="stu-manage">批量管理</button><span class="muted" style="font-size:12px">勾选后批量删除学生页</span></div>` : ''}`) : '';
  }
  const teachersHtml = p.teachers?.length ? sec('👨‍🏫', '任教老师', p.teachers.length, p.teachers.map((t) => `
    <div style="padding:4px 0"><a href="#/wiki/${encodeURIComponent(t.slug)}">👤 ${esc(t.title)}</a></div>`).join('')) : '';
  // 班级页的「目录内容」只列非学生子节点（学生已在上面单独成区）
  const childList = p.kind === 'class' ? p.children.filter((ch) => ch.kind !== 'student') : p.children;
  const childrenHtml = childList.length ? sec('📂', '目录内容', childList.length, `<div class="chip-grid">${childList.map((ch) => `
    <a class="chip" href="#/wiki/${encodeURIComponent(ch.slug)}">${WIKI_ICON[ch.kind] || '📄'} <span class="wt-name">${esc(ch.title)}</span></a>`).join('')}</div>`) : '';
  const canDelFile = (f) => d.is_admin || (state.user && f.uploader_id === state.user.id);
  const filesHtml = sec('📎', '附件', p.files.length, `
    ${p.files.length ? `<div class="tbl-wrap"><table class="tbl"><tr><th>文件</th><th>大小</th><th>上传者</th><th>时间</th><th></th></tr>${p.files.map((f) => `
      <tr>
        <td><span class="wt-name">${esc(f.filename)}</span></td><td class="muted">${fmtSize(f.size)}</td><td>${esc(f.uploader)}</td><td class="muted">${fmtDate(f.created_at)}</td>
        <td style="white-space:nowrap"><a class="btn btn-outline btn-sm" href="/api/wiki/files/${f.id}">下载</a>${canDelFile(f) ? ` <button class="btn btn-outline btn-sm" data-delfile="${f.id}">删除</button>` : ''}</td>
      </tr>`).join('')}</table></div>` : '<div class="muted">暂无附件</div>'}
    <div class="muted" style="margin-top:8px">单文件上限 1MB，文件保存在站点数据库中。</div>`,
    d.can_edit ? '<label class="btn btn-outline btn-sm" for="wiki-file-input">上传文件</label><input type="file" id="wiki-file-input" hidden>' : '');

  $('#wiki-article').innerHTML = `
    <h1>${WIKI_ICON[p.kind] || '📄'} ${esc(p.title)}</h1>
    <div class="wiki-meta">${meta.join('<span class="dot">·</span>')}<span class="spacer"></span><span class="wiki-actions">${actions.join('')}</span></div>
    ${isFolder ? '<div class="muted">文件夹用于组织词条，本身没有正文内容。</div>' : `<div class="md">${body ? md(body) : '<div class="empty">本页暂无内容，点击「编辑」提交第一版吧。</div>'}</div>`}
    ${teachersHtml}${studentsHtml}${childrenHtml}${filesHtml}`;
  if (!isFolder) $('#wiki-edit')?.addEventListener('click', () => {
    if (!state.user) return openLogin();
    wikiEditor(ctx.slug, d.content, d.is_admin, directEdit);
  });
  $('#wiki-history').addEventListener('click', () => wikiHistory(ctx.slug, d.is_admin));
  if (d.is_admin && !isFolder) $('#wiki-save')?.addEventListener('click', () => wikiEditor(ctx.slug, d.content, true, true));
  $('#wiki-move')?.addEventListener('click', () => wikiMoveDialog(ctx.slug, p, ctx));
  $('#wiki-del')?.addEventListener('click', () => wikiDeleteDialog(ctx.slug, p));
  const fi = $('#wiki-file-input');
  fi?.addEventListener('change', () => uploadWikiFile(fi, ctx.slug));
  $$('[data-delfile]').forEach((b) => b.addEventListener('click', async () => {
    if (!confirm('确定删除该附件？')) return;
    try { await api('/api/wiki/files/' + b.dataset.delfile, { method: 'DELETE', body: '{}' }); toast('已删除'); render(); }
    catch (err) { toast(err.message, true); }
  }));
  // 学生管理（班级页 + 管理员）：单删与批量删
  $$('.stu-del').forEach((b) => b.addEventListener('click', async () => {
    const name = b.closest('.stu-chip').querySelector('.wt-name').textContent;
    if (!confirm(`确定删除学生页「${name}」？删除后不可恢复，其修订记录和附件会一并删除。`)) return;
    try { await api('/api/wiki/pages/' + encodeURIComponent(b.dataset.slug), { method: 'DELETE', body: '{}' }); toast('已删除'); wikiInvalidate(); render(); }
    catch (err) { toast(err.message, true); }
  }));
  $('#stu-manage')?.addEventListener('click', () => {
    const box = $('#stu-manage').closest('.wiki-sec-b');
    const shortName = (s) => esc(s.title.replace(p.class_name + ' · ', ''));
    box.innerHTML = `
      <div class="row" style="margin-bottom:10px;flex-wrap:wrap;gap:6px">
        <button class="btn btn-outline btn-sm" id="stu-all">全选</button>
        <button class="btn btn-outline btn-sm" id="stu-none">取消全选</button>
        <div class="spacer"></div>
        <button class="btn btn-danger btn-sm" id="stu-bdel" disabled>删除所选（0）</button>
        <button class="btn btn-outline btn-sm" id="stu-done">退出管理</button>
      </div>
      <div class="chip-grid">${stus.map((s) => `
        <label class="chip stu-pick"><input type="checkbox" value="${esc(s.slug)}"> <span class="wt-name">${shortName(s)}</span></label>`).join('')}</div>`;
    const sync = () => {
      const n = box.querySelectorAll('input:checked').length;
      const btn = $('#stu-bdel');
      btn.textContent = `删除所选（${n}）`;
      btn.disabled = n === 0;
    };
    $('#stu-all').addEventListener('click', () => { box.querySelectorAll('input').forEach((i) => (i.checked = true)); sync(); });
    $('#stu-none').addEventListener('click', () => { box.querySelectorAll('input').forEach((i) => (i.checked = false)); sync(); });
    box.querySelectorAll('input').forEach((i) => i.addEventListener('change', sync));
    $('#stu-done').addEventListener('click', () => render());
    $('#stu-bdel').addEventListener('click', async () => {
      const slugs = [...box.querySelectorAll('input:checked')].map((i) => i.value);
      if (!confirm(`确定删除选中的 ${slugs.length} 个学生页？删除后不可恢复。`)) return;
      let okN = 0; const errs = [];
      for (const slug of slugs) {
        try { await api('/api/wiki/pages/' + encodeURIComponent(slug), { method: 'DELETE', body: '{}' }); okN++; }
        catch (e) { errs.push(e.message); }
      }
      toast(`已删除 ${okN} 个${errs.length ? `，失败 ${errs.length} 个（${errs[0]}）` : ''}`);
      if (okN) { wikiInvalidate(); render(); } else sync();
    });
  });
}

// 右侧目录（取自正文 h2/h3）+ 滚动高亮
function wikiBuildToc() {
  const toc = $('#wiki-toc');
  const heads = $$('#wiki-article .md h2, #wiki-article .md h3');
  if (!heads.length) { toc.innerHTML = ''; return; }
  heads.forEach((h, i) => { h.id = 'wsec-' + i; });
  toc.innerHTML = `<div class="wiki-toc-title">本页目录</div>` + heads.map((h) => `<a class="lv${h.tagName === 'H3' ? 3 : 2}" href="#wsec">${esc(h.textContent)}</a>`).join('');
  toc.querySelectorAll('a').forEach((a, i) => a.addEventListener('click', (e) => {
    e.preventDefault();
    const el = document.getElementById('wsec-' + i);
    $('#wiki-scroll').scrollTo({ top: el.offsetTop - 64, behavior: 'smooth' });
  }));
  wikiScrollSpy();
}
function wikiScrollSpy() {
  const links = $$('#wiki-toc a');
  if (!links.length) return;
  const heads = $$('#wiki-article .md h2, #wiki-article .md h3');
  let idx = -1;
  heads.forEach((h, i) => { if (h.getBoundingClientRect().top < 130) idx = i; });
  links.forEach((a, i) => a.classList.toggle('on', i === idx));
}

// 附件上传（base64 JSON，≤1MB）
async function uploadWikiFile(input, slug) {
  const file = input.files?.[0];
  if (!file) return;
  if (file.size > 1024 * 1024) { toast('文件超过 1MB 上限', true); input.value = ''; return; }
  const reader = new FileReader();
  reader.onload = async () => {
    const b64 = String(reader.result).replace(/^data:[^;]+;base64,/, '');
    try {
      toast('上传中…');
      await api(`/api/wiki/pages/${encodeURIComponent(slug)}/files`, {
        method: 'POST', body: JSON.stringify({ filename: file.name, mime: file.type || 'application/octet-stream', data: b64 }),
      });
      toast('上传成功'); render();
    } catch (err) { toast(err.message, true); }
    input.value = '';
  };
  reader.onerror = () => { toast('文件读取失败', true); input.value = ''; };
  reader.readAsDataURL(file);
}

// 新建词条（全员）
function wikiNewDialog(ctx, defParent) {
  if (!state.user) return openLogin();
  modal(`
    <h3>新建词条</h3>
    <form id="m-np">
      <label class="field"><span>类型</span>
        <select class="input" name="kind" id="np-kind">
          <option value="page">词条 · 通用页面</option>
          <option value="student">学生页</option>
          <option value="teacher">老师页</option>
        </select></label>
      <label class="field"><span>标题</span><input class="input" name="title" required maxlength="60" placeholder="例如：图书馆使用指南"></label>
      <label class="field"><span>所在目录</span><select class="input" name="parent_id">${parentOptions(ctx.nodes, defParent)}</select></label>
      <div id="np-cls" hidden><label class="field"><span>所属班级</span><select class="input" name="class_name">${classOptions(ctx.nodes)}</select></label></div>
      <label class="field"><span>初始内容（选填，支持 Markdown，不支持 HTML）</span><textarea name="content" placeholder="留空则创建空白词条，稍后点「编辑」补充"></textarea></label>
      <div class="row" style="justify-content:flex-end">
        <button class="btn btn-outline" type="button" id="np-cancel">取消</button>
        <button class="btn" type="submit">创建</button>
      </div>
    </form>`, (box, close) => {
    box.style.maxWidth = '560px';
    const kind = $('#np-kind', box), clsBox = $('#np-cls', box);
    const syncKind = () => { clsBox.hidden = kind.value !== 'student'; };
    kind.addEventListener('change', syncKind); syncKind();
    $('#np-cancel', box).addEventListener('click', close);
    $('#m-np', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        const d = await api('/api/wiki/pages', { method: 'POST', body: JSON.stringify({
          kind: f.kind.value, title: f.title.value.trim(),
          parent_id: f.parent_id.value ? parseInt(f.parent_id.value) : null,
          class_name: f.kind.value === 'student' ? f.class_name.value : '',
          content: f.content.value,
        }) });
        wikiInvalidate();
        close(); toast('已创建');
        location.hash = '#/wiki/' + encodeURIComponent(d.slug);
      } catch (err) { toast(err.message, true); }
    });
  });
}

// 新建文件夹（组织管理员）
function wikiFolderDialog(ctx, defParent) {
  modal(`
    <h3>新建文件夹</h3>
    <form id="m-nf">
      <label class="field"><span>名称</span><input class="input" name="title" required maxlength="60" placeholder="例如：校园活动"></label>
      <label class="field"><span>所在目录</span><select class="input" name="parent_id">${parentOptions(ctx.nodes, defParent)}</select></label>
      <div class="row" style="justify-content:flex-end">
        <button class="btn btn-outline" type="button" id="nf-cancel">取消</button>
        <button class="btn" type="submit">创建</button>
      </div>
    </form>`, (box, close) => {
    $('#nf-cancel', box).addEventListener('click', close);
    $('#m-nf', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        const d = await api('/api/wiki/folders', { method: 'POST', body: JSON.stringify({
          title: f.title.value.trim(), parent_id: f.parent_id.value ? parseInt(f.parent_id.value) : null,
        }) });
        wikiInvalidate();
        close(); toast('已创建');
        location.hash = '#/wiki/' + encodeURIComponent(d.slug);
      } catch (err) { toast(err.message, true); }
    });
  });
}

// 移动页面（组织管理员；禁止移入自身后代）
function wikiMoveDialog(slug, page, ctx) {
  const banned = new Set([page.id]);
  const m = wikiChildMap(ctx.nodes);
  const mark = (id) => { for (const ch of m.get(id) || []) { banned.add(ch.id); mark(ch.id); } };
  mark(page.id);
  modal(`
    <h3>移动「${esc(page.title)}」</h3>
    <form id="m-mv">
      <label class="field"><span>移动到</span><select class="input" name="parent_id">${parentOptions(ctx.nodes, page.parent_id, banned)}</select></label>
      <div class="row" style="justify-content:flex-end">
        <button class="btn btn-outline" type="button" id="mv-cancel">取消</button>
        <button class="btn" type="submit">移动</button>
      </div>
    </form>`, (box, close) => {
    $('#mv-cancel', box).addEventListener('click', close);
    $('#m-mv', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const btn = $('#m-mv button[type=submit]', box);
      btn.disabled = true; btn.textContent = '移动中…';
      try {
        await api(`/api/wiki/pages/${encodeURIComponent(slug)}/move`, { method: 'POST', body: JSON.stringify({ parent_id: e.target.parent_id.value ? parseInt(e.target.parent_id.value) : null }) });
        wikiInvalidate();
        close(); toast('已移动'); render();
      } catch (err) { btn.disabled = false; btn.textContent = '移动'; toast(err.message, true); }
    });
  });
}

// 删除页面（组织管理员）
function wikiDeleteDialog(slug, page) {
  modal(`
    <h3>删除「${esc(page.title)}」</h3>
    <p class="muted">删除后不可恢复，该页的所有修订记录和附件会一并删除。${page.kind === 'folder' ? '文件夹下还有内容时需先移走或删除。' : ''}</p>
    <div class="row" style="justify-content:flex-end">
      <button class="btn btn-outline" id="del-cancel">取消</button>
      <button class="btn btn-danger" id="del-ok">确认删除</button>
    </div>`, (box, close) => {
    $('#del-cancel', box).addEventListener('click', close);
    $('#del-ok', box).addEventListener('click', async () => {
      const btn = $('#del-ok', box);
      btn.disabled = true; btn.textContent = '删除中…';
      try {
        await api('/api/wiki/pages/' + encodeURIComponent(slug), { method: 'DELETE', body: '{}' });
        wikiInvalidate();
        close(); toast('已删除'); location.hash = '#/wiki';
      } catch (err) { btn.disabled = false; btn.textContent = '确认删除'; toast(err.message, true); }
    });
  });
}

// 档案库搜索（右上角）
async function wikiSearch(q, ctx) {
  if (!q) { render(); return; }
  const art = $('#wiki-article');
  art.innerHTML = '<div class="empty">搜索中…</div>';
  $('#wiki-toc').innerHTML = '';
  $('#wiki-crumb').innerHTML = `搜索 <b>“${esc(q)}”</b>`;
  const d = await api('/api/wiki/pages?q=' + encodeURIComponent(q));
  art.innerHTML = `
    <h1>🔍 搜索</h1>
    <div class="wiki-meta">“${esc(q)}” · 共 ${d.pages.length}${d.has_more ? '+' : ''} 个结果</div>
    ${d.pages.length ? `<div class="chip-grid">${d.pages.map((p) => `
      <a class="chip" href="#/wiki/${encodeURIComponent(p.slug)}">${WIKI_ICON[p.kind] || '📄'} <span class="wt-name">${esc(p.title)}</span></a>`).join('')}</div>` : '<div class="empty">没有找到相关词条</div>'}`;
}

function wikiEditor(slug, content, isAdmin, direct) {
  modal(`
    <h3>${direct ? '直接保存（免审核）' : '提交修改'}</h3>
    <form id="m-ed">
      <div class="ed-grid">
        <label class="field" style="margin-bottom:0"><span>内容（支持 Markdown，不支持 HTML）</span><textarea name="content" id="ed-content" required>${esc(content)}</textarea></label>
        <div class="field" style="margin-bottom:0"><span>实时预览</span><div class="md ed-preview" id="ed-preview"></div></div>
      </div>
      <label class="field" style="margin-top:12px"><span>修改说明（选填）</span><input class="input" name="message" maxlength="100" placeholder="例如：补充了获奖信息"></label>
      <div class="row" style="justify-content:flex-end">
        <button class="btn btn-outline" type="button" id="ed-cancel">取消</button>
        <button class="btn" type="submit">${direct ? '保存并发布' : '提交审核'}</button>
      </div>
    </form>`, async (box, close) => {
    box.style.maxWidth = '880px';
    const ta = $('#ed-content', box), pv = $('#ed-preview', box);
    const sync = () => { pv.innerHTML = md(ta.value) || '<div class="empty">暂无内容</div>'; };
    ta.addEventListener('input', sync);
    sync();
    $('#ed-cancel', box).addEventListener('click', close);
    $('#m-ed', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        // 管理员免审走 /save 直传；普通用户统一走 /revisions，由后端按组织权限决定直通还是待审
        const useSave = direct && isAdmin;
        const r = await api(`/api/wiki/pages/${encodeURIComponent(slug)}/${useSave ? 'save' : 'revisions'}`, {
          method: 'POST', body: JSON.stringify({ content: f.content.value, message: f.message.value.trim() }),
        });
        close(); toast(r.direct === false ? '已提交，等待审核' : '已保存'); render();
      } catch (err) { toast(err.message, true); }
    });
  });
}
async function wikiHistory(slug, isAdmin) {
  const d = await api('/api/wiki/pages/' + encodeURIComponent(slug) + '/history');
  modal(`
    <h3>修订历史 · ${esc(d.page.title)}</h3>
    <div class="tbl-wrap"><table class="tbl">
      <tr><th>时间</th><th>作者</th><th>说明</th><th>状态</th>${isAdmin ? '<th></th>' : ''}</tr>
      ${d.revisions.map((r) => `
        <tr>
          <td class="muted">${fmtDate(r.created_at)}</td>
          <td>${esc(r.author)}</td>
          <td>${esc(r.message || '')}</td>
          <td>${r.status === 'approved' ? '<span class="badge badge-green">已通过</span>' : r.status === 'rejected' ? '<span class="badge badge-red">已驳回</span>' : '<span class="badge badge-amber">待审</span>'}</td>
          ${isAdmin && r.status === 'approved' ? `<td style="white-space:nowrap"><button class="btn btn-outline btn-sm" data-rollback="${r.id}">回滚到此</button></td>` : isAdmin ? '<td></td>' : ''}
        </tr>`).join('')}
    </table></div>
    ${isAdmin ? '<div class="muted" style="margin-top:8px;font-size:12.5px">回滚会把该版本内容作为新的已通过修订写入，当前内容不会被直接覆盖，可随时再回滚回来。</div>' : ''}
    <div class="row" style="justify-content:flex-end"><button class="btn btn-outline" id="h-close">关闭</button></div>`, (box, close) => {
    $('#h-close', box).addEventListener('click', close);
    $$('[data-rollback]', box).forEach((b) => b.addEventListener('click', async () => {
      if (!confirm('确定回滚到这个版本？该版本内容将作为最新修订写入。')) return;
      b.disabled = true; b.textContent = '回滚中…';
      try {
        await api('/api/wiki/revisions/' + b.dataset.rollback + '/rollback', { method: 'POST', body: '{}' });
        wikiInvalidate();
        close(); toast('已回滚'); render();
      } catch (err) { b.disabled = false; b.textContent = '回滚到此'; toast(err.message, true); }
    }));
  });
}

// ---------- 我的 ----------
async function viewMe() {
  if (!state.user) { app.innerHTML = '<div class="card">请先登录。<a href="/login">去登录</a></div>'; return; }
  const u = state.user;
  app.innerHTML = `
    <h2 class="page-title">个人中心</h2>
    <div class="grid2">
      <div class="card">
        <h3 style="margin-bottom:14px">基本资料</h3>
        <form id="me-form">
          <label class="field"><span>用户名（不可改）</span><input class="input" value="${esc(u.username)}" disabled></label>
          <label class="field"><span>昵称</span><input class="input" name="display_name" value="${esc(u.display_name || '')}" maxlength="30"></label>
          <label class="field"><span>简介</span><textarea name="bio" style="min-height:90px" maxlength="500">${esc(u.bio || '')}</textarea></label>
          <button class="btn" type="submit">保存资料</button>
        </form>
      </div>
      <div class="card">
        <h3 style="margin-bottom:14px">修改密码</h3>
        <form id="pw-form">
          <label class="field"><span>原密码</span><input class="input" name="old_password" type="password" required></label>
          <label class="field"><span>新密码（至少 8 位）</span><input class="input" name="new_password" type="password" required></label>
          <label class="field"><span>确认新密码</span><input class="input" name="confirm" type="password" required></label>
          <button class="btn" type="submit">修改密码</button>
          <div class="muted" style="margin-top:8px">修改密码后所有已登录设备需重新登录</div>
        </form>
      </div>
    </div>
    <div class="card">
      <h3 style="margin-bottom:12px">站点须知</h3>
      <p class="muted" style="margin-bottom:12px">加入网站时阅读过的说明，可随时在这里再次查看。</p>
      <button class="btn btn-outline btn-sm" id="me-disclaimer">查看加入说明</button>
    </div>
    <div class="card">
      <h3 style="margin-bottom:12px">我的组织</h3>
      <div id="mem-box"></div>
    </div>`;
  const drawMemTable = () => {
    $('#mem-box').innerHTML = state.memberships.length ? `<div class="tbl-wrap"><table class="tbl">
      <tr><th>组织</th><th>班级</th><th>姓名</th><th>学号</th><th>身份</th><th>状态</th><th>操作</th></tr>
      ${state.memberships.map((m) => `
        <tr>
          <td><a href="#/orgs">${esc(m.org_name)}</a></td>
          <td>${esc(m.class_name || '—')}</td>
          <td>${esc(m.real_name || '—')}</td>
          <td>${esc(m.student_no || '—')}</td>
          <td>${m.role === 'org_admin' ? '<span class="badge">组织管理员</span>' : '<span class="badge badge-gray">成员</span>'}</td>
          <td>${m.status === 'approved' ? '<span class="badge badge-green">已加入</span>' : '<span class="badge badge-amber">审核中</span>'}</td>
          <td><button class="btn btn-outline btn-sm" data-edit="${m.id}">编辑</button></td>
        </tr>`).join('')}
    </table></div>
    <div class="muted" style="margin-top:8px">班级、姓名、学号填错了？点「编辑」自助更正，无需管理员审核。</div>` : '<div class="muted">还没有加入任何组织，<a href="#/orgs">去浏览组织</a></div>';
    $$('#mem-box [data-edit]').forEach((b) => b.addEventListener('click', () => {
      drawMemEdit(state.memberships.find((m) => String(m.id) === b.dataset.edit));
    }));
  };
  const drawMemEdit = (m) => {
    if (!m) return;
    const meForm = $('#me-form');
    const dn = meForm ? meForm.display_name.value.trim() : (u.display_name || '');
    const bio = meForm ? meForm.bio.value : (u.bio || '');
    $('#mem-box').innerHTML = `
      <form id="mem-form">
        <div class="row" style="align-items:flex-end">
          <label class="field" style="flex:1;min-width:120px;margin-bottom:0"><span>组织（不可改）</span><input class="input" value="${esc(m.org_name)}" disabled></label>
          <label class="field" style="min-width:170px;margin-bottom:0"><span>班级</span>
            <div class="row">
              <select class="input" id="me-grade" style="flex:1"></select>
              <select class="input" id="me-class" style="flex:1"></select>
            </div>
          </label>
          <label class="field" style="min-width:100px;margin-bottom:0"><span>姓名</span><input class="input" name="real_name" value="${esc(m.real_name || '')}" placeholder="张三" maxlength="30"></label>
          <label class="field" style="min-width:80px;margin-bottom:0"><span>学号</span><input class="input" name="student_no" value="${esc(m.student_no || '')}" placeholder="01" maxlength="2"></label>
        </div>
        <div class="row" style="justify-content:flex-end;margin-top:12px">
          <button class="btn btn-outline" type="button" id="mem-cancel">取消</button>
          <button class="btn" type="submit">保存</button>
        </div>
      </form>
      <div class="muted" style="margin-top:8px">班级格式如 J2804 / S2703，学号 01-45；老师与管理员的班级、学号可留空。实名信息仅同组织成员与管理员可见。</div>`;
    const g = $('#me-grade'), c = $('#me-class');
    GRADES.forEach((x) => { const o = document.createElement('option'); o.value = x; o.textContent = x + ' 级'; g.appendChild(o); });
    const cur = (m.class_name || '').toUpperCase();
    const fill = (preserve) => {
      c.innerHTML = '';
      const none = document.createElement('option');
      none.value = ''; none.textContent = '（不设置）';
      c.appendChild(none);
      for (let i = 1; i <= 10; i++) { const cls = g.value + String(i).padStart(2, '0'); const o = document.createElement('option'); o.value = cls; o.textContent = cls; c.appendChild(o); }
      if (preserve && cur && !GRADES.some((x) => cur.startsWith(x))) { const o = document.createElement('option'); o.value = cur; o.textContent = cur + '（原值）'; c.appendChild(o); }
      if (preserve) c.value = cur;
    };
    if (cur && GRADES.some((x) => cur.startsWith(x))) g.value = cur.slice(0, 3);
    fill(true);
    g.addEventListener('change', () => fill(false));
    $('#mem-cancel').addEventListener('click', drawMemTable);
    $('#mem-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        await api('/api/auth/me', { method: 'PATCH', body: JSON.stringify({
          display_name: dn, bio,
          membership: { id: m.id, class_name: c.value, real_name: f.real_name.value.trim(), student_no: f.student_no.value.trim() },
        }) });
        toast('组织资料已更新');
        await loadMe();
        drawMemTable();
      } catch (err) { toast(err.message, true); }
    });
  };
  drawMemTable();
  $('#me-disclaimer')?.addEventListener('click', () => {
    if (window.NW?.openDisclaimer) window.NW.openDisclaimer(null, { noWait: true });
    else toast('说明组件未加载', true);
  });
  $('#me-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    try {
      await api('/api/auth/me', { method: 'PATCH', body: JSON.stringify({ display_name: f.display_name.value.trim(), bio: f.bio.value }) });
      toast('已保存'); await loadMe(); renderNav();
    } catch (err) { toast(err.message, true); }
  });
  $('#pw-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    if (f.new_password.value !== f.confirm.value) return toast('两次输入的新密码不一致', true);
    try {
      await api('/api/auth/change-password', { method: 'POST', body: JSON.stringify({ old_password: f.old_password.value, new_password: f.new_password.value }) });
      toast('密码已修改，请重新登录'); await loadMe(); renderNav(); render();
    } catch (err) { toast(err.message, true); }
  });
}

// ---------- 隐私说明 ----------
function viewPrivacy() {
  app.innerHTML = `
    <div class="card md">
      <h2>隐私说明</h2>
      <p>宁外八一校园社区（下称"本站"）收集以下信息用于账号与组织管理：</p>
      <ul>
        <li><strong>账号信息</strong>：用户名、密码（加密存储）、昵称、简介。</li>
        <li><strong>组织信息</strong>：加入组织时填写的班级、姓名、学号。</li>
        <li><strong>注册限流</strong>：设备指纹与 IP 的哈希值，仅用于防止同一设备 1 小时内重复注册。</li>
      </ul>
      <p>班级、姓名、学号等实名信息<strong>默认仅对同组织成员与该组织的管理员、网站管理员可见</strong>，不会公开展示。档案库页面的正文内容对全站访客可见。</p>
      <p>如需更正或删除个人信息，请联系组织管理员或网站管理员。</p>
    </div>`;
}

// ---------- 更新日志 ----------
async function viewChangelog() {
  app.innerHTML = '<div class="empty">加载中…</div>';
  const d = await api('/api/changelog');
  const isAdmin = state.user?.role === 'website_admin';
  app.innerHTML = `
    <h2 class="page-title">更新日志</h2>
    ${d.entries.length ? d.entries.map((e) => `
      <div class="card">
        <div class="row" style="margin-bottom:6px">
          <span class="badge">${esc(e.version)}</span>
          <h3 style="font-size:17px">${esc(e.title)}</h3>
          <div class="spacer"></div>
          ${e.preview_url ? `<a class="btn btn-outline btn-sm" href="${esc(e.preview_url)}" target="_blank" rel="noopener">预览此版本 ↗</a>` : ''}
          ${isAdmin ? `<button class="btn btn-outline btn-sm" data-del="${e.id}">删除</button>` : ''}
        </div>
        <div class="muted" style="margin-bottom:8px">${fmtDate(e.published_at)}</div>
        ${e.content ? `<div class="md">${md(e.content)}</div>` : ''}
      </div>`).join('') : '<div class="empty">暂无更新记录</div>'}`;
  if (isAdmin) {
    $$('[data-del]').forEach((b) => b.addEventListener('click', async () => {
      if (!confirm('确定删除这条更新日志？')) return;
      try {
        await api('/api/changelog/' + b.dataset.del + '/delete', { method: 'POST', body: '{}' });
        toast('已删除'); viewChangelog();
      } catch (err) { toast(err.message, true); }
    }));
  }
}

// ---------- 管理后台 ----------
async function viewAdmin(args) {
  const isSiteAdmin = state.user?.role === 'website_admin';
  const myOrgs = state.memberships.filter((m) => m.role === 'org_admin' && m.status === 'approved');
  if (!state.user || (!isSiteAdmin && !myOrgs.length)) {
    app.innerHTML = '<div class="card">无权限访问，请以管理员账号登录。</div>'; return;
  }
  const tab = args[0] || (isSiteAdmin ? 'stats' : 'revisions');
  const tabs = [];
  if (isSiteAdmin) tabs.push(['stats', '数据看板'], ['users', '用户管理'], ['orgs', '组织管理'], ['news', '资讯发布'], ['changelog', '更新日志'], ['forum', '论坛管理'], ['revisions', '审核队列'], ['settings', '站点设置']);
  else tabs.push(['revisions', '审核队列'], ['forum', '论坛管理']);
  const myOrg = myOrgs[0];
  if (myOrg) tabs.splice(isSiteAdmin ? 4 : 1, 0, ['manage', '我的组织：' + myOrg.org_name]);
  app.innerHTML = `
    <h2 class="page-title">管理后台</h2>
    <div class="tabs">${tabs.map(([k, label]) => `<button data-tab="${k}" class="${tab === k ? 'active' : ''}">${esc(label)}</button>`).join('')}</div>
    <div id="admin-pane"><div class="empty">加载中…</div></div>`;
  $$('.tabs button').forEach((b) => b.addEventListener('click', () => { location.hash = '#/admin/' + b.dataset.tab; }));
  const pane = $('#admin-pane');
  if (tab === 'manage' && myOrg) return (location.hash = '#/manage/' + encodeURIComponent(myOrg.org_slug));
  if (tab === 'stats') {
    const s = await api('/api/admin/stats');
    pane.innerHTML = `<div class="stat-row">
      <div class="stat"><b>${s.users}</b><span>用户</span></div>
      <div class="stat"><b>${s.orgs}</b><span>组织</span></div>
      <div class="stat"><b>${s.pages}</b><span>档案页</span></div>
      <div class="stat"><b>${s.pending}</b><span>待审修订</span></div>
      <div class="stat"><b>${s.news}</b><span>资讯</span></div>
    </div>
    <div class="card"><h3>常用入口</h3>
      <div class="row" style="margin-top:10px">
        <a class="btn btn-sm" href="#/wiki">档案库</a>
        <a class="btn btn-sm btn-outline" href="#/admin/revisions">审核队列</a>
        <a class="btn btn-sm btn-outline" href="#/admin/news">发布资讯</a>
        ${myOrg ? `<a class="btn btn-sm btn-outline" href="#/manage/${encodeURIComponent(myOrg.org_slug)}">组织管理</a>` : ''}
      </div>
    </div>`;
  }
  if (tab === 'users') {
    const q = new URLSearchParams(location.hash.split('?')[1] || '').get('q') || '';
    pane.innerHTML = `
      <div class="card">
        <div class="row" style="margin-bottom:14px">
          <input class="input" id="u-q" placeholder="搜索用户名/昵称" value="${esc(q)}" style="flex:1;min-width:180px">
          <button class="btn" id="u-search">搜索</button>
        </div>
        <div id="u-list"><div class="muted">加载中…</div></div>
      </div>`;
    const loadUsers = async (query, page = 1) => {
      const d = await api('/api/admin/users?q=' + encodeURIComponent(query) + '&page=' + page);
      const totalPages = Math.max(1, Math.ceil(d.total / d.size));
      // v2.1 权限修复：站点创始人（owner_id）不可被封禁/降级；任免管理员仅创始人可操作
      const ownerId = d.owner_id || 0;
      const iAmOwner = state.user.id === ownerId;
      $('#u-list').innerHTML = `<div class="tbl-wrap"><table class="tbl">
        <tr><th>ID</th><th>用户名</th><th>昵称</th><th>角色</th><th>状态</th><th>注册时间</th><th>操作</th></tr>
        ${d.users.map((u) => {
          const isOwner = u.id === ownerId;
          const canBan = !isOwner && u.id !== state.user.id && u.role === 'user';
          const canRole = !isOwner && iAmOwner;
          return `
          <tr>
            <td>${u.id}</td><td>${esc(u.username)}</td><td>${esc(u.display_name || '')}</td>
            <td>${u.role === 'website_admin' ? '<span class="badge">网站管理员</span>' : '<span class="badge badge-gray">用户</span>'}${isOwner ? ' <span class="badge badge-feat">创始人</span>' : ''}</td>
            <td>${u.status === 'active' ? '<span class="badge badge-green">正常</span>' : '<span class="badge badge-red">封禁</span>'}</td>
            <td class="muted">${fmtDate(u.created_at)}</td>
            <td>
              ${u.id === state.user.id && !isOwner
                ? '<span class="muted">当前账号</span>'
                : isOwner
                  ? '<span class="muted">站点创始人</span>'
                  : `${canBan
                      ? (u.status === 'active'
                          ? `<button class="btn btn-outline btn-sm" data-act="ban" data-id="${u.id}">封禁</button>`
                          : `<button class="btn btn-outline btn-sm" data-act="unban" data-id="${u.id}">解封</button>`)
                      : (u.role === 'website_admin' ? '<span class="muted">管理员</span>' : '<span class="muted">封禁中</span>')}
                    ${canRole
                      ? (u.role === 'website_admin'
                          ? `<button class="btn btn-outline btn-sm" data-act="role" data-id="${u.id}" data-role="user">撤管理员</button>`
                          : `<button class="btn btn-outline btn-sm" data-act="role" data-id="${u.id}" data-role="website_admin">设为管理员</button>`)
                      : ''}`}
            </td>
          </tr>`;
        }).join('')}
      </table></div>
      <div class="row" style="justify-content:center;margin-top:12px">
        <button class="btn btn-outline btn-sm" id="u-prev" ${page <= 1 ? 'disabled' : ''}>上一页</button>
        <span class="muted">${page} / ${totalPages}</span>
        <button class="btn btn-outline btn-sm" id="u-next" ${page >= totalPages ? 'disabled' : ''}>下一页</button>
      </div>`;
      $$('[data-act]').forEach((b) => b.addEventListener('click', async () => {
        const { act, id, role } = b.dataset;
        if (act === 'role' && !confirm('站点创始人才可以任免管理员，确定调整该用户角色？')) return;
        if (act === 'ban' && !confirm('确定封禁该用户？封禁后其所有设备需重新登录。')) return;
        try {
          await api('/api/admin/users/' + id + '/' + act, { method: 'POST', body: JSON.stringify(act === 'role' ? { role } : {}) });
          toast('已操作'); loadUsers(query, page);
        } catch (err) { toast(err.message, true); }
      }));
      if (page > 1) $('#u-prev').addEventListener('click', () => loadUsers(query, page - 1));
      if (page < totalPages) $('#u-next').addEventListener('click', () => loadUsers(query, page + 1));
    };
    $('#u-search').addEventListener('click', () => loadUsers($('#u-q').value.trim()));
    await loadUsers(q);
  }
  if (tab === 'orgs') {
    const d = await api('/api/admin/orgs');
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:12px">创建组织</h3>
        <form id="org-create" class="row" style="align-items:flex-end">
          <label class="field" style="flex:1;min-width:140px;margin-bottom:0"><span>名称</span><input class="input" name="name" required maxlength="60"></label>
          <label class="field" style="flex:1;min-width:120px;margin-bottom:0"><span>slug（小写字母/数字/-）</span><input class="input" name="slug" required pattern="[a-z0-9-]{3,40}"></label>
          <label class="field" style="min-width:100px;margin-bottom:0"><span>类型</span><select class="input" name="type"><option value="public">公开</option><option value="private">私有</option></select></label>
          <label class="field" style="min-width:100px;margin-bottom:0"><span>加入方式</span><select class="input" name="join_mode"><option value="open">直接加入</option><option value="approval">需审核</option></select></label>
          <label class="field" style="flex:1;min-width:140px;margin-bottom:0"><span>简介</span><input class="input" name="description" maxlength="200"></label>
          <button class="btn" type="submit">创建</button>
        </form>
      </div>
      <div class="card">
        <div class="tbl-wrap"><table class="tbl">
          <tr><th>ID</th><th>名称</th><th>slug</th><th>类型</th><th>加入方式</th><th>成员数</th></tr>
          ${d.orgs.map((o) => `
            <tr>
              <td>${o.id}</td><td>${esc(o.name)}</td><td>${esc(o.slug)}</td>
              <td>${o.type === 'public' ? '<span class="badge badge-green">公开</span>' : '<span class="badge badge-gray">私有</span>'}</td>
              <td>${o.join_mode === 'open' ? '直接加入' : '需审核'}</td>
              <td>${o.member_count}</td>
            </tr>`).join('')}
        </table></div>
      </div>`;
    $('#org-create').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        await api('/api/admin/orgs', { method: 'POST', body: JSON.stringify({ name: f.name.value.trim(), slug: f.slug.value.trim(), type: f.type.value, join_mode: f.join_mode.value, description: f.description.value.trim() }) });
        toast('已创建'); viewAdmin(['orgs']);
      } catch (err) { toast(err.message, true); }
    });
  }
  if (tab === 'news') {
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:12px">发布资讯</h3>
        <form id="news-form">
          <label class="field"><span>标题</span><input class="input" name="title" required maxlength="100"></label>
          <label class="field"><span>摘要（选填）</span><input class="input" name="summary" maxlength="200"></label>
          <label class="field"><span>正文（Markdown）</span><textarea name="content" required style="min-height:200px"></textarea></label>
          <label class="row" style="margin-bottom:14px"><input type="checkbox" name="pinned" style="width:auto"><span class="muted">置顶</span></label>
          <button class="btn" type="submit">发布</button>
        </form>
      </div>
      <div class="card">
        <h3 style="margin-bottom:12px">最近发布</h3>
        <div id="news-admin-list"><div class="muted">加载中…</div></div>
      </div>`;
    const loadNews = async () => {
      const d = await api('/api/news');
      $('#news-admin-list').innerHTML = d.news.map((n) => `
        <div class="row" style="padding:6px 0;border-bottom:1px solid #f0ece1">
          ${n.pinned ? '<span class="badge badge-amber">顶</span>' : ''}
          <a href="#/news/${n.id}">${esc(n.title)}</a>
          <div class="spacer"></div>
          <span class="muted">${fmtDate(n.published_at)}</span>
        </div>`).join('') || '<div class="muted">暂无</div>';
    };
    await loadNews();
    $('#news-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        await api('/api/admin/news', { method: 'POST', body: JSON.stringify({ title: f.title.value.trim(), summary: f.summary.value.trim(), content: f.content.value, pinned: f.pinned.checked }) });
        toast('已发布'); f.reset(); loadNews();
      } catch (err) { toast(err.message, true); }
    });
  }
  if (tab === 'changelog') {
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:12px">发布更新日志</h3>
        <form id="cl-form">
          <div class="row" style="align-items:flex-end">
            <label class="field" style="width:120px;margin-bottom:0"><span>版本号</span><input class="input" name="version" required maxlength="20" placeholder="v1.2"></label>
            <label class="field" style="flex:1;min-width:200px;margin-bottom:0"><span>标题</span><input class="input" name="title" required maxlength="100" placeholder="例如：论坛模块上线"></label>
          </div>
          <label class="field" style="margin-top:14px"><span>更新内容（Markdown，选填）</span><textarea name="content" style="min-height:140px" placeholder="- 新增了xxx&#10;- 修复了xxx"></textarea></label>
          <label class="field"><span>版本预览链接（选填）</span><input class="input" name="preview_url" maxlength="200" placeholder="https://af207728.ningwai.pages.dev/"></label>
          <div class="muted" style="margin-bottom:12px">填写该次部署的哈希链接（形如 https://&lt;哈希&gt;.ningwai.pages.dev/），访客可在更新日志页一键回看旧版界面。每次部署后哈希可在部署完成信息里找到。</div>
          <button class="btn" type="submit">发布</button>
        </form>
      </div>
      <div class="card">
        <h3 style="margin-bottom:12px">已发布</h3>
        <div id="cl-admin-list"><div class="muted">加载中…</div></div>
      </div>`;
    const loadList = async () => {
      const d = await api('/api/changelog');
      $('#cl-admin-list').innerHTML = d.entries.map((e) => `
        <div class="row" style="padding:6px 0;border-bottom:1px solid #f0ece1">
          <span class="badge">${esc(e.version)}</span>
          <span>${esc(e.title)}</span>
          <div class="spacer"></div>
          <span class="muted">${fmtDate(e.published_at)}</span>
        </div>`).join('') || '<div class="muted">暂无</div>';
    };
    await loadList();
    $('#cl-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        await api('/api/changelog', { method: 'POST', body: JSON.stringify({
          version: f.version.value.trim(), title: f.title.value.trim(),
          content: f.content.value, preview_url: f.preview_url.value.trim(),
        }) });
        toast('已发布'); f.reset(); loadList();
      } catch (err) { toast(err.message, true); }
    });
  }
  if (tab === 'settings') {
    const d = await api('/api/admin/settings');
    pane.innerHTML = `
      <div class="card">
        <form id="set-form">
          <label class="field"><span>站点名称</span><input class="input" name="site_name" value="${esc(d.settings.site_name || '')}" maxlength="30"></label>
          <label class="field"><span>首页公告</span><textarea name="announcement" style="min-height:80px" maxlength="500">${esc(d.settings.announcement || '')}</textarea></label>
          <button class="btn" type="submit">保存</button>
        </form>
      </div>`;
    $('#set-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        await api('/api/admin/settings', { method: 'POST', body: JSON.stringify({ site_name: f.site_name.value.trim(), announcement: f.announcement.value.trim() }) });
        toast('已保存');
      } catch (err) { toast(err.message, true); }
    });
  }
  if (tab === 'forum') await renderForumAdmin(pane, isSiteAdmin, myOrgs);
  if (tab === 'revisions') await renderRevisions(pane);
}

// ---------- 论坛管理（网站管理员全站 / 组织管理员本组织板块）----------
async function renderForumAdmin(pane, isSiteAdmin, myOrgs) {
  const [pending, cats, setD] = await Promise.all([
    api('/api/admin/forum/pending').catch(() => ({ pending: [] })),
    api('/api/forum/categories'),
    api('/api/admin/settings').catch(() => ({ settings: {} })),
  ]);
  const reviewOn = setD.settings.forum_review === '1';
  const myOrg = myOrgs[0];
  pane.innerHTML = `
    <div class="card">
      <div class="row" style="margin-bottom:12px;flex-wrap:wrap;gap:8px">
        <h3>待审主题（${pending.pending.length}）</h3>
        <div class="spacer"></div>
        <label class="row" style="gap:6px;font-size:13px;cursor:pointer">
          <input type="checkbox" id="fg-review" ${reviewOn ? 'checked' : ''}> 新主题需审核后展示
        </label>
      </div>
      <p class="muted" style="margin-bottom:12px">关闭后新主题直接发布。开关对全站生效（仅网站管理员可改）。</p>
      ${pending.pending.length ? `<div class="tbl-wrap"><table class="tbl">
        <tr><th>标题</th><th>板块</th><th>作者</th><th>时间</th><th>操作</th></tr>
        ${pending.pending.map((t) => `
          <tr>
            <td><a href="#/forum/t/${t.id}" target="_blank">${esc(t.title)}</a></td>
            <td>${esc(t.category)}</td>
            <td>${esc(t.author)}</td>
            <td class="muted">${fmtDate(t.created_at)}</td>
            <td>
              <button class="btn btn-sm" data-ok="${t.id}">通过</button>
              <button class="btn btn-outline btn-sm" data-no="${t.id}">驳回</button>
            </td>
          </tr>`).join('')}
      </table></div>` : '<div class="empty">暂无待审主题</div>'}
    </div>
    <div class="card">
      <div class="row" style="margin-bottom:12px"><h3>板块管理</h3></div>
      <div class="tbl-wrap"><table class="tbl">
        <tr><th>ID</th><th>名称</th><th>说明</th><th>主题/帖数</th><th>操作</th></tr>
        ${cats.categories.map((cat) => `
          <tr>
            <td>${cat.id}</td><td>${esc(cat.name)}</td>
            <td class="muted">${esc(cat.description || '')}</td>
            <td class="muted">${cat.topic_count} / ${cat.post_count}</td>
            <td>${isSiteAdmin || (cat.org_id && myOrgs.some((m) => m.org_id === cat.org_id)) ? `<button class="btn btn-outline btn-sm" data-cat-del="${cat.id}">删除</button>` : ''}</td>
          </tr>`).join('')}
      </table></div>
      ${isSiteAdmin || myOrg ? `
        <form id="fg-cat-form" style="margin-top:14px">
          <div class="row" style="flex-wrap:wrap;gap:8px">
            <input class="input" name="name" placeholder="新板块名称（2–30 字）" maxlength="30" required style="flex:1;min-width:160px">
            <input class="input" name="description" placeholder="板块说明（可选）" maxlength="200" style="flex:2;min-width:200px">
            ${myOrg && !isSiteAdmin ? `<input type="hidden" name="org_id" value="${myOrg.org_id}">` : ''}
            <button class="btn" type="submit">新建板块</button>
          </div>
        </form>` : ''}
    </div>`;
  const reviewBox = $('#fg-review');
  if (reviewBox) reviewBox.addEventListener('change', async () => {
    try {
      await api('/api/admin/settings', { method: 'POST', body: JSON.stringify({ forum_review: reviewBox.checked ? '1' : '0' }) });
      toast(reviewBox.checked ? '已开启审核' : '已关闭审核，新主题直接发布');
    } catch (err) { toast(err.message, true); renderForumAdmin(pane, isSiteAdmin, myOrgs); }
  });
  $$('[data-ok]').forEach((b) => b.addEventListener('click', async () => {
    try {
      await api('/api/admin/forum/topics/' + b.dataset.ok + '/approve', { method: 'POST', body: '{}' });
      toast('已通过'); renderForumAdmin(pane, isSiteAdmin, myOrgs);
    } catch (err) { toast(err.message, true); }
  }));
  $$('[data-no]').forEach((b) => b.addEventListener('click', async () => {
    if (!confirm('驳回后主题不会展示，确定驳回？')) return;
    try {
      await api('/api/admin/forum/topics/' + b.dataset.no + '/reject', { method: 'POST', body: '{}' });
      toast('已驳回'); renderForumAdmin(pane, isSiteAdmin, myOrgs);
    } catch (err) { toast(err.message, true); }
  }));
  $$('[data-cat-del]').forEach((b) => b.addEventListener('click', async () => {
    if (!confirm('确定删除该板块？有主题的板块不能删除。')) return;
    try {
      await api('/api/admin/forum/categories/' + b.dataset.catDel + '/delete', { method: 'POST', body: '{}' });
      toast('已删除'); renderForumAdmin(pane, isSiteAdmin, myOrgs);
    } catch (err) { toast(err.message, true); }
  }));
  const catForm = $('#fg-cat-form');
  if (catForm) catForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    try {
      await api('/api/admin/forum/categories', {
        method: 'POST',
        body: JSON.stringify({ name: f.name.value.trim(), description: f.description.value.trim(), org_id: f.org_id ? parseInt(f.org_id.value) : null }),
      });
      f.name.value = ''; f.description.value = '';
      toast('已创建'); renderForumAdmin(pane, isSiteAdmin, myOrgs);
    } catch (err) { toast(err.message, true); }
  });
}

// ---------- 审核队列（网站管理员全站 / 组织管理员本组织）----------
async function renderRevisions(pane, page = 1) {
  const d = await api('/api/wiki/revisions?status=pending&page=' + page);
  const totalPages = Math.max(1, Math.ceil(d.total / d.size));
  pane.innerHTML = `
    <div class="card">
      <div class="row" style="margin-bottom:12px"><h3>待审修订（${d.total}）</h3></div>
      ${d.revisions.length ? `<div class="tbl-wrap"><table class="tbl">
        <tr><th>页面</th><th>提交人</th><th>说明</th><th>时间</th><th>操作</th></tr>
        ${d.revisions.map((r) => `
          <tr>
            <td><a href="#/wiki/${encodeURIComponent(r.slug)}" target="_blank">${esc(r.page_title)}</a><div class="muted">${esc(r.grade)}${r.class_name ? ' · ' + esc(r.class_name) : ''}</div></td>
            <td>${esc(r.author)}</td>
            <td>${esc(r.message || '')}</td>
            <td class="muted">${fmtDate(r.created_at)}</td>
            <td>
              <button class="btn btn-outline btn-sm" data-diff="${r.id}">对比</button>
              <button class="btn btn-sm" data-ok="${r.id}">通过</button>
              <button class="btn btn-outline btn-sm" data-no="${r.id}">驳回</button>
            </td>
          </tr>`).join('')}
      </table></div>
      <div class="row" style="justify-content:center;margin-top:12px">
        <button class="btn btn-outline btn-sm" id="rv-prev" ${page <= 1 ? 'disabled' : ''}>上一页</button>
        <span class="muted">${page} / ${totalPages}</span>
        <button class="btn btn-outline btn-sm" id="rv-next" ${page >= totalPages ? 'disabled' : ''}>下一页</button>
      </div>` : '<div class="empty">暂无待审修订</div>'}
    </div>`;
  $$('[data-ok]').forEach((b) => b.addEventListener('click', async () => {
    try {
      await api('/api/wiki/revisions/' + b.dataset.ok + '/approve', { method: 'POST', body: '{}' });
      toast('已通过'); renderRevisions(pane, page);
    } catch (err) { toast(err.message, true); }
  }));
  $$('[data-diff]').forEach((b) => b.addEventListener('click', () => showRevDiff(b.dataset.diff, pane, page)));
  $$('[data-no]').forEach((b) => b.addEventListener('click', async () => {
    const reason = prompt('驳回理由（将展示给提交者）', '内容不符合要求');
    if (reason === null) return;
    try {
      await api('/api/wiki/revisions/' + b.dataset.no + '/reject', { method: 'POST', body: JSON.stringify({ reason }) });
      toast('已驳回'); renderRevisions(pane, page);
    } catch (err) { toast(err.message, true); }
  }));
  if (page > 1) $('#rv-prev').addEventListener('click', () => renderRevisions(pane, page - 1));
  if (page < totalPages) $('#rv-next').addEventListener('click', () => renderRevisions(pane, page + 1));
}

// ---------- 行级 diff（LCS + 公共前后缀裁剪），返回 [[ '+'|'-'|'=', line ]] ----------
function diffLines(oldText, newText) {
  const a = String(oldText || '').split('\n');
  const b = String(newText || '').split('\n');
  const n = a.length, m = b.length;
  let start = 0;
  while (start < n && start < m && a[start] === b[start]) start++;
  let endA = n, endB = m;
  while (endA > start && endB > start && a[endA - 1] === b[endB - 1]) { endA--; endB--; }
  const A = a.slice(start, endA), B = b.slice(start, endB);
  const N = A.length, M = B.length;
  const mid = [];
  if (N && M) {
    const dp = Array.from({ length: N + 1 }, () => new Uint16Array(M + 1));
    for (let i = N - 1; i >= 0; i--)
      for (let j = M - 1; j >= 0; j--)
        dp[i][j] = A[i] === B[j] ? dp[i + 1][j + 1] + 1 : Math.max(dp[i + 1][j], dp[i][j + 1]);
    let i = 0, j = 0;
    while (i < N && j < M) {
      if (A[i] === B[j]) { mid.push(['=', A[i]]); i++; j++; }
      else if (dp[i + 1][j] >= dp[i][j + 1]) { mid.push(['-', A[i]]); i++; }
      else { mid.push(['+', B[j]]); j++; }
    }
    while (i < N) mid.push(['-', A[i++]]);
    while (j < M) mid.push(['+', B[j++]]);
  } else {
    if (!oldText) { for (const l of B) mid.push(['+', l]); }
    else { for (const l of A) mid.push(['-', l]); for (const l of B) mid.push(['+', l]); }
  }
  const out = [];
  for (let k = 0; k < start; k++) out.push(['=', a[k]]);
  out.push(...mid);
  for (let k = endA; k < n; k++) out.push(['=', a[k]]);
  return out;
}

// ---------- 修订对比弹窗（待审 vs 当前发布版） ----------
async function showRevDiff(id, pane, page) {
  let d;
  try { d = await api('/api/wiki/revisions/' + id + '/diff'); }
  catch (err) { toast(err.message, true); return; }
  const diff = diffLines(d.current, d.revision.content);
  const adds = diff.filter((x) => x[0] === '+').length;
  const dels = diff.filter((x) => x[0] === '-').length;
  modal(`
    <h3>修订对比 · ${esc(d.revision.page_title)}</h3>
    <div class="muted" style="margin-bottom:10px">提交人 ${esc(d.revision.author)} · ${fmtDate(d.revision.created_at)}${d.revision.message ? ' · ' + esc(d.revision.message) : ''}</div>
    <div class="diff-stat"><span class="diff-add">+${adds} 行</span><span class="diff-del">−${dels} 行</span><span class="muted">红色为当前版，绿色为待审修订</span></div>
    <div class="diff-box">${diff.map(([t, line]) => `<div class="diff-line ${t === '+' ? 'add' : t === '-' ? 'del' : 'ctx'}"><span class="diff-mark">${t === '=' ? ' ' : t}</span>${esc(line) || ' '}</div>`).join('') || '<div class="empty">两版内容一致</div>'}</div>
    <div class="row" style="justify-content:flex-end">
      <button class="btn btn-outline" type="button" id="df-close">关闭</button>
      <button class="btn btn-outline" type="button" id="df-no">驳回</button>
      <button class="btn" type="button" id="df-ok">通过并发布</button>
    </div>`, (box, close) => {
    box.style.maxWidth = '880px';
    $('#df-close', box).addEventListener('click', close);
    $('#df-ok', box).addEventListener('click', async () => {
      try {
        await api('/api/wiki/revisions/' + id + '/approve', { method: 'POST', body: '{}' });
        close(); toast('已通过'); renderRevisions(pane, page);
      } catch (err) { toast(err.message, true); }
    });
    $('#df-no', box).addEventListener('click', async () => {
      const reason = prompt('驳回理由（将展示给提交者）', '内容不符合要求');
      if (reason === null) return;
      try {
        await api('/api/wiki/revisions/' + id + '/reject', { method: 'POST', body: JSON.stringify({ reason }) });
        close(); toast('已驳回'); renderRevisions(pane, page);
      } catch (err) { toast(err.message, true); }
    });
  });
}

// ---------- 组织管理 ----------
async function viewManage(args) {
  const slug = decodeURIComponent(args[0] || '');
  const m = state.memberships.find((x) => x.org_slug === slug && x.role === 'org_admin' && x.status === 'approved');
  if (!m && state.user?.role !== 'website_admin') { app.innerHTML = '<div class="card">无权限管理该组织。</div>'; return; }
  const tab = args[1] || 'members';
  app.innerHTML = `
    <h2 style="margin-bottom:4px">组织管理 · ${esc(m?.org_name || slug)}</h2>
    <div class="muted" style="margin-bottom:16px">${esc(slug)}</div>
    <div class="tabs">
      <button data-tab="members" class="${tab === 'members' ? 'active' : ''}">成员</button>
      <button data-tab="invites" class="${tab === 'invites' ? 'active' : ''}">邀请码</button>
      <button data-tab="teachers" class="${tab === 'teachers' ? 'active' : ''}">老师关联</button>
      <button data-tab="perm" class="${tab === 'perm' ? 'active' : ''}">权限</button>
      <button data-tab="revisions" class="${tab === 'revisions' ? 'active' : ''}">审核队列</button>
    </div>
    <div id="mg-pane"><div class="empty">加载中…</div></div>`;
  $$('.tabs button').forEach((b) => b.addEventListener('click', () => { location.hash = '#/manage/' + encodeURIComponent(slug) + '/' + b.dataset.tab; }));
  const pane = $('#mg-pane');

  if (tab === 'members') {
    const d = await api('/api/orgs/' + encodeURIComponent(slug) + '/manage/members?status=pending');
    const all = await api('/api/orgs/' + encodeURIComponent(slug) + '/manage/members');
    const row = (mem, pend) => {
      const isSelf = mem.user_id === state.user.id;
      return `
      <tr>
        <td>${esc(mem.display_name || mem.username)}<div class="muted">@${esc(mem.username)}</div></td>
        <td>${esc(mem.class_name || '—')}</td>
        <td>${esc(mem.real_name || '—')}</td>
        <td>${esc(mem.student_no || '—')}</td>
        <td>${mem.role === 'org_admin' ? '<span class="badge">管理员</span>' : '<span class="badge badge-gray">成员</span>'}</td>
        <td>${pend ? '<span class="badge badge-amber">待审</span>' : '<span class="badge badge-green">已加入</span>'}</td>
        <td>
          ${pend ? `<button class="btn btn-sm" data-ap="${mem.id}">通过</button>` : ''}
          ${isSelf
            ? '<span class="muted">这是你</span>'
            : `<button class="btn btn-outline btn-sm" data-rm="${mem.id}">移除</button>
               ${!pend ? (mem.role === 'org_admin'
                 ? `<button class="btn btn-outline btn-sm" data-rl="${mem.id}" data-role="member">撤管理员</button>`
                 : `<button class="btn btn-outline btn-sm" data-rl="${mem.id}" data-role="org_admin">设管理员</button>`) : ''}`}
        </td>
      </tr>`;
    };
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:12px">待审成员（${d.members.length}）</h3>
        ${d.members.length ? `<div class="tbl-wrap"><table class="tbl"><tr><th>用户</th><th>班级</th><th>姓名</th><th>学号</th><th>身份</th><th>状态</th><th>操作</th></tr>${d.members.map((x) => row(x, true)).join('')}</table></div>` : '<div class="muted">暂无待审成员</div>'}
      </div>
      <div class="card">
        <h3 style="margin-bottom:12px">全部成员（${all.members.length}）</h3>
        <div class="tbl-wrap"><table class="tbl"><tr><th>用户</th><th>班级</th><th>姓名</th><th>学号</th><th>身份</th><th>状态</th><th>操作</th></tr>${all.members.map((x) => row(x, false)).join('')}</table></div>
      </div>`;
    const act = async (id, action, role) => {
      try {
        await api(`/api/orgs/${encodeURIComponent(slug)}/manage/members/${id}/${action}`, { method: 'POST', body: JSON.stringify(role ? { role } : {}) });
        toast('已操作'); viewManage([slug, 'members']);
      } catch (err) { toast(err.message, true); }
    };
    $$('[data-ap]').forEach((b) => b.addEventListener('click', () => act(b.dataset.ap, 'approve')));
    $$('[data-rm]').forEach((b) => b.addEventListener('click', () => { if (confirm('确定移除该成员？')) act(b.dataset.rm, 'remove'); }));
    $$('[data-rl]').forEach((b) => b.addEventListener('click', () => act(b.dataset.rl, 'role', b.dataset.role)));
  }

  if (tab === 'invites') {
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:12px">生成邀请码</h3>
        <form id="inv-form" class="row" style="align-items:flex-end">
          <label class="field" style="min-width:120px;margin-bottom:0"><span>可用次数</span><input class="input" name="max_uses" type="number" value="1" min="1" max="100"></label>
          <label class="field" style="min-width:120px;margin-bottom:0"><span>有效天数</span><input class="input" name="days" type="number" value="7" min="1" max="365"></label>
          <button class="btn" type="submit">生成</button>
        </form>
        <div id="inv-out" style="margin-top:12px"></div>
      </div>
      <div class="card muted">私有组织只能通过邀请码加入；邀请码为一次性随机串，请直接发给目标成员。</div>`;
    $('#inv-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        const d = await api('/api/orgs/' + encodeURIComponent(slug) + '/invites', {
          method: 'POST', body: JSON.stringify({ max_uses: parseInt(f.max_uses.value), days: parseInt(f.days.value) }),
        });
        $('#inv-out').innerHTML = `<div class="row"><span class="badge badge-green" style="font-size:15px;padding:8px 14px">${esc(d.code)}</span><span class="muted">有效期至 ${fmtDate(d.expires_at)} · 可用 ${d.max_uses} 次</span></div>`;
      } catch (err) { toast(err.message, true); }
    });
  }

  if (tab === 'teachers') {
    const d = await api('/api/orgs/' + encodeURIComponent(slug) + '/manage/teachers');
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:12px">创建老师页面</h3>
        <form id="tp-form" class="row" style="align-items:flex-end">
          <label class="field" style="flex:1;min-width:160px;margin-bottom:0"><span>老师姓名</span><input class="input" name="title" required maxlength="30" placeholder="张三老师"></label>
          <button class="btn" type="submit">创建</button>
        </form>
      </div>
      <div class="card">
        <h3 style="margin-bottom:12px">关联老师到班级</h3>
        <form id="tl-form" class="row" style="align-items:flex-end">
          <label class="field" style="flex:1;min-width:160px;margin-bottom:0"><span>班级</span><select class="input" name="class_page_id">${d.classes.map((c) => `<option value="${c.id}">${esc(c.title)}</option>`).join('')}</select></label>
          <label class="field" style="flex:1;min-width:160px;margin-bottom:0"><span>老师</span><select class="input" name="teacher_page_id">${d.teachers.map((t) => `<option value="${t.id}">${esc(t.title)}</option>`).join('')}</select></label>
          <button class="btn" type="submit">关联</button>
        </form>
      </div>
      <div class="card">
        <h3 style="margin-bottom:12px">已有关联（${d.links.length}）</h3>
        ${d.links.length ? `<div class="tbl-wrap"><table class="tbl"><tr><th>班级</th><th>老师</th><th></th></tr>${d.links.map((l) => `
          <tr><td><a href="#/wiki/${encodeURIComponent(l.class_slug)}">${esc(l.class_title)}</a></td>
          <td><a href="#/wiki/${encodeURIComponent(l.teacher_slug)}">👤 ${esc(l.teacher_title)}</a></td>
          <td><button class="btn btn-outline btn-sm" data-unlink="${l.id}">取消</button></td></tr>`).join('')}</table></div>` : '<div class="muted">暂无关联</div>'}
      </div>`;
    $('#tp-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      try {
        const r = await api('/api/wiki/teachers', { method: 'POST', body: JSON.stringify({ org_id: m.org_id, title: e.target.title.value.trim() }) });
        toast('已创建：' + r.slug); viewManage([slug, 'teachers']);
      } catch (err) { toast(err.message, true); }
    });
    $('#tl-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        await api('/api/orgs/' + encodeURIComponent(slug) + '/manage/teachers', {
          method: 'POST', body: JSON.stringify({ class_page_id: parseInt(f.class_page_id.value), teacher_page_id: parseInt(f.teacher_page_id.value) }),
        });
        toast('已关联'); viewManage([slug, 'teachers']);
      } catch (err) { toast(err.message, true); }
    });
    $$('[data-unlink]').forEach((b) => b.addEventListener('click', async () => {
      try {
        await api('/api/orgs/' + encodeURIComponent(slug) + '/manage/teachers/' + b.dataset.unlink + '/delete', { method: 'POST', body: '{}' });
        toast('已取消'); viewManage([slug, 'teachers']);
      } catch (err) { toast(err.message, true); }
    }));
  }

  if (tab === 'perm') {
    const org = await api('/api/orgs/' + encodeURIComponent(slug));
    const cur = org.org.wiki_perm || 'create_edit_review';
    const opts = [
      ['all', '所有', '可新建词条、编辑免审直接生效、可新建文件夹'],
      ['create_edit', '可新建可编辑', '可新建词条、编辑免审直接生效，不能新建文件夹'],
      ['create_edit_review', '可新建编辑需审核', '可新建词条，编辑提交后需管理员审核生效（默认）'],
      ['all_review', '全部需审核', '普通用户不能新建词条和文件夹，只能对已有词条提交待审修改'],
    ];
    pane.innerHTML = `
      <div class="card">
        <h3 style="margin-bottom:6px">普通用户权限</h3>
        <p class="muted" style="margin-bottom:14px">控制本组织普通成员（非管理员）在档案库中可以做什么。组织管理员与网站管理员不受此限制。</p>
        <form id="perm-form">
          ${opts.map(([v, label, desc]) => `
            <label class="perm-opt${cur === v ? ' on' : ''}">
              <input type="radio" name="perm" value="${v}"${cur === v ? ' checked' : ''}>
              <span><b>${label}</b><span class="muted" style="display:block;font-weight:400;margin-top:2px">${desc}</span></span>
            </label>`).join('')}
          <div class="row" style="justify-content:flex-end;margin-top:14px">
            <button class="btn" type="submit">保存</button>
          </div>
        </form>
      </div>`;
    $$('#perm-form .perm-opt input').forEach((r) => r.addEventListener('change', () => {
      $$('#perm-form .perm-opt').forEach((l) => l.classList.remove('on'));
      r.closest('.perm-opt').classList.add('on');
    }));
    $('#perm-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      const perm = $('#perm-form input[name=perm]:checked').value;
      try {
        await api('/api/orgs/' + encodeURIComponent(slug) + '/manage/perm', { method: 'POST', body: JSON.stringify({ perm }) });
        toast('已保存'); wikiInvalidate();
      } catch (err) { toast(err.message, true); }
    });
  }

  if (tab === 'revisions') await renderRevisions(pane);
}

// ---------- 论坛 ----------
// 路由：#/forum 板块列表 | #/forum/c/:catId?page=N 主题列表 | #/forum/t/:topicId?page=N 主题详情
async function viewForum(args, query) {
  if (!args[0]) return forumHome();
  if (args[0] === 'c' && args[1]) return forumCategory(args[1], query);
  if (args[0] === 't' && args[1]) return forumTopic(args[1], query);
  app.innerHTML = '<div class="empty">页面不存在 <a href="#/forum">返回论坛首页</a></div>';
}

async function forumHome() {
  const d = await api('/api/forum/categories');
  app.innerHTML = `
    <h2 class="page-title">论坛</h2>
    <p class="muted" style="margin-bottom:16px">文明发言，理性讨论。发帖与回复均需登录。</p>
    <div class="fg-cats">
      ${d.categories.map((cat) => `
        <a class="fg-cat" href="#/forum/c/${cat.id}">
          <div class="fg-cat-top">
            <span class="fg-cat-name">${esc(cat.name)}</span>
            ${cat.org_id ? '<span class="badge badge-gray">组织板块</span>' : ''}
          </div>
          ${cat.description ? `<div class="fg-cat-desc">${esc(cat.description)}</div>` : ''}
          <div class="fg-cat-meta">${cat.topic_count} 主题 · ${cat.post_count} 帖</div>
        </a>`).join('') || '<div class="empty">暂无板块</div>'}
    </div>`;
}

async function forumCategory(catId, query) {
  const page = Math.max(parseInt((query.match(/page=(\d+)/) || [])[1]) || 1, 1);
  const d = await api('/api/forum/categories/' + encodeURIComponent(catId) + '/topics?page=' + page);
  const cat = d.category;
  app.innerHTML = `
    <div class="row" style="margin-bottom:4px">
      <a href="#/forum" class="muted">← 全部板块</a>
      <div class="spacer"></div>
      <button class="btn btn-sm" id="fg-new">发新帖</button>
    </div>
    <h2 class="page-title">${esc(cat.name)}</h2>
    ${cat.description ? `<p class="muted" style="margin-bottom:14px">${esc(cat.description)}</p>` : ''}
    ${d.topics.length ? d.topics.map((t) => `
      <div class="fg-topic">
        <div class="fg-topic-main">
          ${t.pinned ? '<span class="badge badge-amber">置顶</span> ' : ''}
          ${t.featured ? '<span class="badge badge-feat">精华</span> ' : ''}
          ${t.status === 'pending' ? '<span class="badge badge-gray">待审</span> ' : ''}
          ${t.status === 'closed' ? '<span class="badge badge-red">已锁定</span> ' : ''}
          <a class="fg-topic-title" href="#/forum/t/${t.id}">${esc(t.title)}</a>
          <div class="muted fg-topic-meta">${esc(t.author_name || t.author)} · ${fmtDate(t.created_at)}${t.last_post_at && t.last_post_at !== t.created_at ? ' · 最后回复 ' + fmtDate(t.last_post_at) : ''}</div>
        </div>
        <div class="fg-topic-stat muted">${t.reply_count} 回复<br>${t.views} 浏览</div>
      </div>`).join('') : '<div class="empty">这个板块还没有主题，来发第一帖吧</div>'}
    <div class="row" style="justify-content:center;margin-top:16px">
      <button class="btn btn-outline btn-sm" id="fg-prev" ${page <= 1 ? 'disabled' : ''}>上一页</button>
      <span class="muted">${page}</span>
      <button class="btn btn-outline btn-sm" id="fg-next" ${!d.has_more ? 'disabled' : ''}>下一页</button>
    </div>`;
  $('#fg-new').addEventListener('click', () => forumNewTopic(cat.id));
  if (page > 1) $('#fg-prev').addEventListener('click', () => (location.hash = '#/forum/c/' + cat.id + '?page=' + (page - 1)));
  if (d.has_more) $('#fg-next').addEventListener('click', () => (location.hash = '#/forum/c/' + cat.id + '?page=' + (page + 1)));
}

async function forumTopic(topicId, query) {
  const page = Math.max(parseInt((query.match(/page=(\d+)/) || [])[1]) || 1, 1);
  const d = await api('/api/forum/topics/' + encodeURIComponent(topicId) + '?page=' + page);
  const t = d.topic, cat = d.category;
  const isAuthor = state.user?.id === t.author_id;
  const canManage = d.can_moderate;
  app.innerHTML = `
    <div class="row" style="margin-bottom:4px">
      <a href="#/forum/c/${cat.id}" class="muted">← ${esc(cat.name)}</a>
    </div>
    <div class="card">
      <div class="row" style="margin-bottom:4px">
        ${t.pinned ? '<span class="badge badge-amber">置顶</span> ' : ''}
        ${t.featured ? '<span class="badge badge-feat">精华</span> ' : ''}
        ${t.status === 'pending' ? '<span class="badge badge-gray">待审</span> ' : ''}
        ${t.status === 'closed' ? '<span class="badge badge-red">已锁定</span> ' : ''}
        <h2 style="font-size:20px">${esc(t.title)}</h2>
        <div class="spacer"></div>
        ${isAuthor || canManage ? `<button class="btn btn-danger btn-sm" id="fg-del">删除</button>` : ''}
      </div>
      <div class="muted" style="margin-bottom:14px">${esc(t.author_name || t.author)} · ${fmtDate(t.created_at)} · ${t.views} 次浏览</div>
      ${d.posts.map((p) => `
        <div class="fg-post" id="fg-floor-${p.floor}">
          <div class="fg-post-head">
            <span class="fg-floor">${p.floor} 楼</span>
            <b>${esc(p.author_name || p.author)}</b>
            <span class="muted">${fmtDate(p.created_at)}</span>
          </div>
          <div class="md">${md(p.content)}</div>
        </div>`).join('')}
      <div class="row" style="justify-content:center;margin-top:12px">
        <button class="btn btn-outline btn-sm" id="fg-pprev" ${page <= 1 ? 'disabled' : ''}>上一页</button>
        <span class="muted">${page}</span>
        <button class="btn btn-outline btn-sm" id="fg-pnext" ${!d.has_more ? 'disabled' : ''}>下一页</button>
      </div>
    </div>
    ${canManage ? `
      <div class="card">
        <h3 style="margin-bottom:10px">管理操作</h3>
        <div class="row" style="flex-wrap:wrap;gap:8px">
          <button class="btn btn-outline btn-sm" data-act="pin">置顶</button>
          <button class="btn btn-outline btn-sm" data-act="unpin">取消置顶</button>
          <button class="btn btn-outline btn-sm" data-act="feature">加精</button>
          <button class="btn btn-outline btn-sm" data-act="unfeature">取消加精</button>
          <button class="btn btn-outline btn-sm" data-act="lock">锁定</button>
          <button class="btn btn-outline btn-sm" data-act="unlock">解锁</button>
          ${t.status === 'pending' ? '<button class="btn btn-sm" data-act="approve">通过审核</button>' : ''}
          <button class="btn btn-danger btn-sm" data-act="delete">删除主题</button>
        </div>
      </div>` : ''}
    ${d.can_reply ? `
      <div class="card">
        <form id="fg-reply">
          <label class="field"><span>回复（${t.reply_count + 1} 楼）</span><textarea name="content" style="min-height:110px" maxlength="20000" required placeholder="支持 Markdown，请文明发言"></textarea></label>
          <div class="row" style="justify-content:flex-end"><button class="btn" type="submit">提交回复</button></div>
        </form>
      </div>` : state.user ? '<div class="card muted">该主题暂时不能回复。</div>' : '<div class="card"><a href="javascript:;" id="fg-login">登录后回复</a></div>'}`;
  if (page > 1) $('#fg-pprev').addEventListener('click', () => (location.hash = '#/forum/t/' + t.id + '?page=' + (page - 1)));
  if (d.has_more) $('#fg-pnext').addEventListener('click', () => (location.hash = '#/forum/t/' + t.id + '?page=' + (page + 1)));
  const loginBtn = $('#fg-login');
  if (loginBtn) loginBtn.addEventListener('click', openLogin);
  const delBtn = $('#fg-del');
  if (delBtn) delBtn.addEventListener('click', async () => {
    if (!confirm('确定删除这个主题？主题下的所有回复都会删除，不可恢复。')) return;
    try {
      await api('/api/forum/topics/' + t.id + '/delete', { method: 'POST', body: '{}' });
      toast('已删除'); location.hash = '#/forum/c/' + cat.id;
    } catch (err) { toast(err.message, true); }
  });
  $$('[data-act]').forEach((b) => b.addEventListener('click', async () => {
    const act = b.dataset.act;
    if (act === 'delete' && !confirm('确定删除这个主题？不可恢复。')) return;
    try {
      await api('/api/admin/forum/topics/' + t.id + '/' + act, { method: 'POST', body: '{}' });
      toast('已操作'); viewForum(['t', String(t.id)]);
    } catch (err) { toast(err.message, true); }
  }));
  const replyForm = $('#fg-reply');
  if (replyForm) replyForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    try {
      await api('/api/forum/topics/' + t.id + '/posts', { method: 'POST', body: JSON.stringify({ content: f.content.value }) });
      f.content.value = ''; toast('回复成功');
      viewForum(['t', String(t.id)], 'page=' + Math.max(1, Math.ceil((t.reply_count + 2) / 15)));
    } catch (err) { toast(err.message, true); }
  });
}

function forumNewTopic(catId) {
  if (!state.user) { openLogin(); return; }
  modal(`
    <h3>发布新主题</h3>
    <form id="fg-new-form">
      <label class="field"><span>标题</span><input class="input" name="title" maxlength="80" required placeholder="一句话说清你的话题（2–80 字）"></label>
      <label class="field"><span>内容</span><textarea name="content" style="min-height:170px" maxlength="20000" required placeholder="支持 Markdown 语法"></textarea></label>
      <div class="row" style="justify-content:flex-end"><button class="btn" type="submit">发布</button></div>
    </form>`, async (box, close) => {
    $('#fg-new-form', box).addEventListener('submit', async (e) => {
      e.preventDefault();
      const f = e.target;
      try {
        const d = await api('/api/forum/categories/' + catId + '/topics', {
          method: 'POST', body: JSON.stringify({ title: f.title.value.trim(), content: f.content.value }),
        });
        close();
        toast(d.status === 'pending' ? '已提交，等待管理员审核' : '发布成功');
        location.hash = '#/forum/t/' + d.id;
      } catch (err) { toast(err.message, true); }
    });
  });
}

// ---------- 启动 ----------
(async function boot() {
  await loadMe();
  renderNav();
  render();
  checkDisclaimerGate();
})();
window.addEventListener('hashchange', render);
// Markdown 图片点击放大（事件委托，编辑器实时预览里插入的图同样生效）
document.addEventListener('click', (e) => {
  const im = e.target;
  if (!(im && im.tagName === 'IMG' && im.closest('.md'))) return;
  const ov = document.createElement('div');
  ov.className = 'img-zoom';
  const big = document.createElement('img');
  big.src = im.currentSrc || im.src;
  big.alt = im.alt || '';
  ov.appendChild(big);
  ov.addEventListener('click', () => ov.remove());
  document.body.appendChild(ov);
});
// 暴露内部工具给独立脚本（theme.js / anniv.js 等 IIFE 外的模块调用）
window.NW = { $, $$, api, toast, modal, esc, fmtDate, state, render, loadMe, openLogin };
})();
