// 登录/注册独立页逻辑
(() => {
  const $ = (s) => document.querySelector(s);
  const GRADES = ['J29', 'J28', 'J27', 'J26', 'S29', 'S28', 'S27', 'S26'];
  const force = new URLSearchParams(location.search).get('force') === '1';

  function toast(msg, err) {
    const t = document.createElement('div');
    t.className = 'toast' + (err ? ' err' : '');
    t.textContent = msg;
    document.body.appendChild(t);
    setTimeout(() => t.remove(), 2600);
  }
  async function api(path, body) {
    const res = await fetch(path, {
      method: body ? 'POST' : 'GET',
      credentials: 'same-origin',
      headers: { 'Content-Type': 'application/json' },
      body: body ? JSON.stringify(body) : undefined,
    });
    const data = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(data.error || ('请求失败 ' + res.status));
    return data;
  }

  // 密码显隐
  document.querySelectorAll('.pw-toggle').forEach((b) => {
    b.addEventListener('click', () => {
      const inp = b.parentElement.querySelector('input');
      const show = inp.type === 'password';
      inp.type = show ? 'text' : 'password';
      b.textContent = show ? '隐藏' : '显示';
    });
  });

  // 标签切换
  const tabs = $('#auth-tabs');
  function showTab(name) {
    if (force) return;
    tabs.querySelectorAll('button').forEach((b) => b.classList.toggle('active', b.dataset.tab === name));
    $('#login-form').hidden = name !== 'login';
    $('#register-form').hidden = name !== 'register';
  }
  tabs.addEventListener('click', (e) => {
    const b = e.target.closest('button');
    if (b) showTab(b.dataset.tab);
  });

  // 登录
  $('#login-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    try {
      const d = await api('/api/auth/login', { username: f.username.value.trim(), password: f.password.value });
      if (d.must_change_pw) {
        $('#auth-tabs').style.display = 'none';
        $('#login-form').hidden = true;
        $('#register-form').hidden = true;
        $('#force-form').hidden = false;
        return;
      }
      location.href = '/#/';
    } catch (err) { toast(err.message, true); }
  });

  // 强制改密
  $('#force-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    if (f.new_password.value !== f.confirm.value) return toast('两次输入的新密码不一致', true);
    try {
      await api('/api/auth/change-password', { new_password: f.new_password.value });
      toast('密码已修改，正在进入');
      setTimeout(() => (location.href = '/#/'), 600);
    } catch (err) { toast(err.message, true); }
  });

  // 注册表单：组织下拉 + 班级下拉
  const orgSel = $('#reg-org');
  orgSel.innerHTML = '<option value="">暂不加入组织</option>';
  api('/api/orgs').then((d) => {
    for (const o of d.orgs || []) {
      const opt = document.createElement('option');
      opt.value = o.slug;
      opt.textContent = o.name + (o.join_mode === 'approval' ? '（需审核）' : '');
      orgSel.appendChild(opt);
    }
    orgSel.addEventListener('change', () => {
      $('#reg-org-fields').hidden = !orgSel.value;
    });
  }).catch(() => {});

  const gradeSel = $('#reg-grade');
  const classSel = $('#reg-class');
  for (const g of GRADES) {
    const opt = document.createElement('option');
    opt.value = g; opt.textContent = g + ' 级';
    gradeSel.appendChild(opt);
  }
  function fillClasses() {
    classSel.innerHTML = '';
    for (let i = 1; i <= 10; i++) {
      const cls = gradeSel.value + String(i).padStart(2, '0');
      const opt = document.createElement('option');
      opt.value = cls; opt.textContent = cls;
      classSel.appendChild(opt);
    }
  }
  gradeSel.addEventListener('change', fillClasses);
  fillClasses();

  // ---------- 加入说明（免责声明弹窗 + 至少阅读 5 秒，共用 disclaimer.js） ----------
  let readDone = false;
  $('#reg-read').addEventListener('click', () => {
    NW.openDisclaimer((done) => {
      readDone = true;
      $('#reg-read-stat').textContent = '✓ 已阅读';
      done();
    });
  });

  // ---------- 手写签名（本地威慑用，不提交、不存储） ----------
  const sign = NW.bindSignature($('#reg-sign'), () => { $('#reg-sign-hint').hidden = true; });
  $('#reg-sign-clear').addEventListener('click', () => {
    sign.clear();
    $('#reg-sign-stat').textContent = '尚未签名';
    $('#reg-sign-hint').hidden = false;
  });

  $('#register-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const f = e.target;
    if (f.password.value !== f.confirm.value) return toast('两次输入的密码不一致', true);
    if (!readDone) return toast('请先阅读《加入说明》', true);
    if (!sign.signed()) return toast('请在签名区完成签名', true);
    const body = {
      username: f.username.value.trim(),
      password: f.password.value,
      confirm: f.confirm.value,
      org_slug: f.org_slug.value || undefined,
      class_name: classSel.value,
      real_name: f.real_name.value.trim(),
      student_no: f.student_no.value.trim(),
      fingerprint: (window.__fp && window.__fp()) || '',
    };
    if (!f.org_slug.value) { delete body.class_name; delete body.real_name; delete body.student_no; }
    try {
      await api('/api/auth/register', body);
      toast('注册成功，正在进入');
      setTimeout(() => (location.href = '/#/'), 600);
    } catch (err) { toast(err.message, true); }
  });

  // 设备指纹（与 app.js 同算法）
  window.__fp = function () {
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
  };

  // 已登录访问登录页 → 回首页；强制改密模式
  api('/api/auth/me').then(() => { if (!force) location.href = '/#/'; }).catch(() => {});
  if (force) {
    $('#auth-tabs').style.display = 'none';
    $('#login-form').hidden = true;
    $('#register-form').hidden = true;
    $('#force-form').hidden = false;
  }
})();
