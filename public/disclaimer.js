// 加入说明：文案 + 弹窗 + 手写签名（注册页 auth.js 与主站强制门 app.js 共用）
window.NW = window.NW || {};

NW.DISCLAIMER_HTML = `
  <p class="dc-lead">加入本网站，即代表你明白以下内容：</p>
  <ol>
    <li>在站内发布同学的隐私、黑历史、CP 等内容，可能产生不良后果，包括但不限于线下暴力解决。</li>
    <li>相应地，其他人也可能发布与你相关的内容。为了两边平衡，建议加入后多一些忍耐；但如果对方确有越界，务必联系我们解决（联系方式见下方）。</li>
    <li>你应当对自己发布的内容负责。</li>
    <li>网站可能存在各种问题，希望你能接受，并适当提供反馈。</li>
    <li>加入组织时须填写真实身份信息，否则愿意接受一切处罚。我们保证不向外透露隐私，收集该信息只为确认身份。</li>
  </ol>
  <p class="dc-lead">明确不允许的行为：</p>
  <ul>
    <li>过度暴露同学隐私（如身份证号，明确禁止；对方不想透露的手机号、家庭背景等）</li>
    <li>挑拨离间</li>
    <li>网络暴力（绝对禁止，玩过界可能被帽子叔叔抓到橘子🍊里去）</li>
  </ul>
  <p class="dc-contact">联系方式：组织内事务请联系组织管理员；站点问题请联系网站管理员。</p>`;

// 打开加入说明弹窗；onAccept(done) 里调用 done() 关闭（默认 5 秒后可确认）
// opts.dismissible = false 时遮罩点击不关闭（强制门用）
// opts.noWait = true 时跳过 5 秒倒计时、按钮即点即关（「我的」页重看模式）
NW.openDisclaimer = function (onAccept, opts = {}) {
  const dismissible = opts.dismissible !== false;
  const noWait = opts.noWait === true;
  const mask = document.createElement('div');
  mask.className = 'modal-mask';
  mask.innerHTML = `<div class="modal" style="max-width:520px">
    <h3>加入说明</h3>
    <div class="disclaimer">${NW.DISCLAIMER_HTML}</div>
    <div class="row" style="justify-content:flex-end">
      <button class="btn" id="dc-ok"${noWait ? '' : ' disabled'}>${noWait ? '我知道了' : '我已阅读并理解（5）'}</button>
    </div>
  </div>`;
  document.body.appendChild(mask);
  const btn = mask.querySelector('#dc-ok');
  let timer = null;
  const close = () => { if (timer) clearInterval(timer); mask.remove(); };
  if (!noWait) {
    let left = 5;
    timer = setInterval(() => {
      left--;
      if (left <= 0) { clearInterval(timer); btn.disabled = false; btn.textContent = '我已阅读并理解'; }
      else btn.textContent = `我已阅读并理解（${left}）`;
    }, 1000);
  }
  if (dismissible) mask.addEventListener('click', (e) => { if (e.target === mask) close(); });
  btn.addEventListener('click', () => { if (onAccept) onAccept(close); else close(); });
  return { close };
};

// 绑定手写签名画布（鼠标/触屏）。返回 { signed(), clear() }
NW.bindSignature = function (canvas, onSigned) {
  const ctx = canvas.getContext('2d');
  let signing = false, signed = false;
  ctx.lineWidth = 2.5;
  ctx.lineCap = 'round';
  ctx.lineJoin = 'round';
  ctx.strokeStyle = '#3a2e22';
  const pos = (e) => {
    const r = canvas.getBoundingClientRect();
    return { x: (e.clientX - r.left) * (canvas.width / r.width), y: (e.clientY - r.top) * (canvas.height / r.height) };
  };
  canvas.addEventListener('pointerdown', (e) => {
    e.preventDefault();
    try { canvas.setPointerCapture(e.pointerId); } catch {}
    signing = true;
    const p = pos(e);
    ctx.beginPath();
    ctx.moveTo(p.x, p.y);
    ctx.lineTo(p.x + .01, p.y); // 点一下也留痕
    ctx.stroke();
  });
  canvas.addEventListener('pointermove', (e) => {
    if (!signing) return;
    e.preventDefault();
    const p = pos(e);
    ctx.lineTo(p.x, p.y);
    ctx.stroke();
    if (!signed) { signed = true; if (onSigned) onSigned(); }
  });
  ['pointerup', 'pointercancel'].forEach((ev) => canvas.addEventListener(ev, () => { signing = false; }));
  return {
    signed() { return signed; },
    clear() { ctx.clearRect(0, 0, canvas.width, canvas.height); signed = false; },
  };
};
