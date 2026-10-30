// ===== 主题系统：自定义主题 CRUD / 应用 / 分享 / 商店 =====
import { Hono } from 'hono';
import { auth, ok, jsonErr, randomToken, isWebsiteAdmin } from './common.js';

const r = new Hono();

// 主题配置字段白名单（防脏数据）
const KEYS = [
  'nav_bg', 'nav_text', 'logo_color', 'bg', 'mid', 'gradient_angle',
  'primary', 'accent', 'mid_image', 'mid_repeat', 'mid_size', 'mid_w', 'mid_h',
  'mid_x', 'mid_y', 'mid_brightness', 'mid_blur', 'mid_img_blur', 'mid_scroll', 'logo_url',
];
const COLORS = ['nav_bg', 'nav_text', 'bg', 'mid', 'primary', 'accent'];
const REPEATS = ['no-repeat', 'repeat', 'repeat-x', 'repeat-y'];
const SIZES = ['auto', 'cover', 'contain', 'custom'];
const BLURS = ['none', 'standard', 'light'];
const SCROLLS = ['fullscreen', 'bottom'];

function cleanConfig(raw) {
  const c = {};
  if (!raw || typeof raw !== 'object') return c;
  for (const k of KEYS) {
    const v = raw[k];
    if (v === undefined || v === null || v === '') continue;
    if (COLORS.includes(k)) {
      if (typeof v === 'string' && /^#[0-9a-fA-F]{3,8}$/.test(v)) c[k] = v.toLowerCase();
    } else if (k === 'gradient_angle' || k === 'mid_x' || k === 'mid_y' || k === 'mid_w' || k === 'mid_h') {
      const n = Math.round(Number(v));
      if (Number.isFinite(n)) c[k] = Math.min(Math.max(n, 0), k === 'gradient_angle' ? 360 : 500);
    } else if (k === 'mid_brightness') {
      const n = Math.round(Number(v));
      if (Number.isFinite(n)) c[k] = Math.min(Math.max(n, 0), 200);
    } else if (k === 'mid_repeat') { if (REPEATS.includes(v)) c[k] = v; }
    else if (k === 'mid_size') { if (SIZES.includes(v)) c[k] = v; }
    else if (k === 'mid_blur') {
      // 卡片透明度 0-100（百分比）；兼容旧版档位字符串
      const n = Number(v);
      if (v !== '' && v != null && Number.isFinite(n)) c[k] = Math.min(Math.max(n, 0), 100);
      else if (BLURS.includes(v)) c[k] = v;
    }
    else if (k === 'mid_img_blur') {
      // 中景图模糊 0-30px
      const n = Number(v);
      if (v !== '' && v != null && Number.isFinite(n)) c[k] = Math.min(Math.max(n, 0), 30);
    }
    else if (k === 'mid_scroll') { if (SCROLLS.includes(v)) c[k] = v; }
    else if (k === 'logo_color') { if (v === 'color' || v === 'custom' || /^#[0-9a-fA-F]{3,8}$/.test(String(v))) c[k] = v; }
    else if (k === 'mid_image') {
      // 只允许站内相对路径或 https 图床
      const s = String(v).slice(0, 500);
      if (/^\/(?!\/)/.test(s) || /^https:\/\//i.test(s)) c[k] = s;
    }
  }
  return c;
}

// 我的主题列表
r.get('/mine', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const rows = await c.env.db.prepare(
    'SELECT id, name, config, share_code, shared, use_count, created_at, updated_at FROM themes WHERE user_id = ? ORDER BY updated_at DESC'
  ).bind(user.id).all();
  const active = await c.env.db.prepare('SELECT active_theme_id FROM users WHERE id = ?').bind(user.id).first();
  return ok(c, {
    themes: (rows.results || []).map((t) => ({ ...t, config: JSON.parse(t.config || '{}'), active: t.id === active?.active_theme_id })),
    active_id: active?.active_theme_id || null,
  });
});

// 当前应用的主题（登录返回自己的；未登录返回 NULL 走默认）
r.get('/active', async (c) => {
  const user = await auth(c);
  if (!user) return ok(c, { theme: null });
  const u = await c.env.db.prepare('SELECT active_theme_id FROM users WHERE id = ?').bind(user.id).first();
  if (!u?.active_theme_id) return ok(c, { theme: null });
  const t = await c.env.db.prepare('SELECT id, name, config FROM themes WHERE id = ?').bind(u.active_theme_id).first();
  if (!t) return ok(c, { theme: null });
  return ok(c, { theme: { id: t.id, name: t.name, config: JSON.parse(t.config || '{}') } });
});

// 新建主题
r.post('/', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const body = await c.req.json().catch(() => ({}));
  const name = String(body.name || '').trim().slice(0, 30) || '我的主题';
  const config = cleanConfig(body.config);
  if (!Object.keys(config).length) return jsonErr(c, '主题配置为空');
  const cnt = await c.env.db.prepare('SELECT COUNT(*) AS n FROM themes WHERE user_id = ?').bind(user.id).first();
  if ((cnt?.n || 0) >= 20) return jsonErr(c, '每人最多保存 20 套主题');
  const res = await c.env.db.prepare('INSERT INTO themes (user_id, name, config) VALUES (?,?,?)')
    .bind(user.id, name, JSON.stringify(config)).run();
  return ok(c, { id: res.meta.last_row_id, name, config });
});

// 更新主题
r.put('/:id', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const t = await c.env.db.prepare('SELECT id, user_id FROM themes WHERE id = ?').bind(c.req.param('id')).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  if (t.user_id !== user.id && !(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  const body = await c.req.json().catch(() => ({}));
  const config = cleanConfig(body.config);
  if (!Object.keys(config).length) return jsonErr(c, '主题配置为空');
  const name = String(body.name || '').trim().slice(0, 30);
  await c.env.db.prepare("UPDATE themes SET config = ?, name = COALESCE(NULLIF(?, ''), name), updated_at = datetime('now') WHERE id = ?")
    .bind(JSON.stringify(config), name, t.id).run();
  return ok(c, { ok: true });
});

// 删除主题
r.delete('/:id', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const t = await c.env.db.prepare('SELECT id, user_id FROM themes WHERE id = ?').bind(c.req.param('id')).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  if (t.user_id !== user.id && !(await isWebsiteAdmin(user))) return jsonErr(c, '无权限', 403);
  await c.env.db.prepare('DELETE FROM themes WHERE id = ?').bind(t.id).run();
  await c.env.db.prepare('UPDATE users SET active_theme_id = NULL WHERE active_theme_id = ?').bind(t.id).run();
  return ok(c, { ok: true });
});

// 应用主题（写入 users.active_theme_id）
// v2.2：应用他人主题不再复制——所有人共享同一份主题实例（同一 id/同一链接），
// 详情页看到作者是原作者；想改就「另存为」（POST /:id/fork），副本作者变为当前用户。
r.post('/:id/apply', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const t = await c.env.db.prepare('SELECT id, user_id FROM themes WHERE id = ?').bind(c.req.param('id')).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  const cur = await c.env.db.prepare('SELECT active_theme_id FROM users WHERE id = ?').bind(user.id).first();
  await c.env.db.prepare('UPDATE users SET active_theme_id = ? WHERE id = ?').bind(t.id, user.id).run();
  // 使用人数：从别的主题切到本主题才 +1（重复应用同一主题不重复计）
  if (cur?.active_theme_id !== t.id) {
    await c.env.db.prepare('UPDATE themes SET use_count = use_count + 1 WHERE id = ?').bind(t.id).run();
  }
  return ok(c, { ok: true, id: t.id });
});

// 另存为（fork）：把他人的主题复制一份到自己名下，作者变为当前用户
r.post('/:id/fork', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const t = await c.env.db.prepare('SELECT id, user_id, name, config FROM themes WHERE id = ?').bind(c.req.param('id')).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  if (t.user_id === user.id) return jsonErr(c, '这是你自己的主题，直接编辑即可');
  const cnt = await c.env.db.prepare('SELECT COUNT(*) AS n FROM themes WHERE user_id = ?').bind(user.id).first();
  if ((cnt?.n || 0) >= 20) return jsonErr(c, '每人最多保存 20 套主题，请先删除一些');
  const res = await c.env.db.prepare('INSERT INTO themes (user_id, name, config) VALUES (?,?,?)')
    .bind(user.id, t.name, t.config).run();
  return ok(c, { id: res.meta.last_row_id, name: t.name });
});

// 取消应用（回到默认主题）
r.post('/reset', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  await c.env.db.prepare('UPDATE users SET active_theme_id = NULL WHERE id = ?').bind(user.id).run();
  return ok(c, { ok: true });
});

// 分享主题（生成分享码）
r.post('/:id/share', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const t = await c.env.db.prepare('SELECT id, user_id, share_code FROM themes WHERE id = ?').bind(c.req.param('id')).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  if (t.user_id !== user.id) return jsonErr(c, '只能分享自己的主题', 403);
  let code = t.share_code;
  if (!code) {
    code = randomToken(6);
    for (let i = 0; i < 5; i++) {
      const dup = await c.env.db.prepare('SELECT id FROM themes WHERE share_code = ?').bind(code).first();
      if (!dup) break;
      code = randomToken(6);
    }
  }
  await c.env.db.prepare('UPDATE themes SET share_code = ?, shared = 1, updated_at = datetime("now") WHERE id = ?').bind(code, t.id).run();
  return ok(c, { code });
});

// 取消分享
r.post('/:id/unshare', async (c) => {
  const user = await auth(c);
  if (!user) return jsonErr(c, '未登录', 401);
  const t = await c.env.db.prepare('SELECT id, user_id FROM themes WHERE id = ?').bind(c.req.param('id')).first();
  if (!t || t.user_id !== user.id) return jsonErr(c, '无权限', 403);
  await c.env.db.prepare('UPDATE themes SET shared = 0, share_code = NULL WHERE id = ?').bind(t.id).run();
  return ok(c, { ok: true });
});

// 主题商店（公开分享的主题）
r.get('/store', async (c) => {
  const rows = await c.env.db.prepare(`
    SELECT t.id, t.name, t.config, t.share_code, t.use_count, t.updated_at, u.username AS author
    FROM themes t JOIN users u ON u.id = t.user_id
    WHERE t.shared = 1 ORDER BY t.use_count DESC, t.updated_at DESC LIMIT 60`).all();
  return ok(c, { themes: (rows.results || []).map((t) => ({ ...t, config: JSON.parse(t.config || '{}') })) });
});

// 按分享码查看（公开）
r.get('/shared/:code', async (c) => {
  const t = await c.env.db.prepare(`
    SELECT t.id, t.name, t.config, t.use_count, u.username AS author
    FROM themes t JOIN users u ON u.id = t.user_id
    WHERE t.share_code = ? AND t.shared = 1`).bind(c.req.param('code')).first();
  if (!t) return jsonErr(c, '分享码无效或主题已取消分享', 404);
  return ok(c, { theme: { ...t, config: JSON.parse(t.config || '{}') } });
});

// 主题详情（公开）：任何已分享主题可看；未分享的仅作者本人或管理员可见
r.get('/public/:id', async (c) => {
  const t = await c.env.db.prepare(`
    SELECT t.id, t.name, t.config, t.share_code, t.use_count, t.shared, t.created_at, t.updated_at,
           t.user_id, u.username AS author
    FROM themes t JOIN users u ON u.id = t.user_id
    WHERE t.id = ?`).bind(c.req.param('id')).first();
  if (!t) return jsonErr(c, '主题不存在', 404);
  const user = await auth(c);
  const isMine = !!user && user.id === t.user_id;
  const isAdm = !!user && (await isWebsiteAdmin(user));
  if (!t.shared && !isMine && !isAdm) return jsonErr(c, '主题未分享', 404);
  return ok(c, { theme: { ...t, config: JSON.parse(t.config || '{}'), is_mine: isMine } });
});

export default r;
