// 宁外八一 · CF Pages 单 Worker 入口（Hono）
import { Hono } from 'hono';
import authRoutes from './lib/auth-routes.js';
import orgRoutes from './lib/org-routes.js';
import wikiRoutes from './lib/wiki-routes.js';
import newsRoutes from './lib/news-routes.js';
import adminRoutes from './lib/admin-routes.js';
import changelogRoutes from './lib/changelog-routes.js';
import themeRoutes from './lib/theme-routes.js';
import forumRoutes from './lib/forum-routes.js';
import notificationRoutes from './lib/notification-routes.js';
import searchRoutes from './lib/search-routes.js';

const app = new Hono();

app.onError((err, c) => {
  console.error('WORKER_ERROR', err?.message || err);
  return c.json({ error: '服务器内部错误，请稍后再试' }, 500);
});

// ===== 安全响应头 =====
app.use('*', async (c, next) => {
  await next();
  c.header('X-Content-Type-Options', 'nosniff');
  c.header('X-Frame-Options', 'DENY');
  c.header('Referrer-Policy', 'same-origin');
  c.header('Content-Security-Policy', "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; connect-src 'self'; frame-ancestors 'none'; base-uri 'self'; form-action 'self'");
});

// ===== API 路由 =====
app.route('/api/auth', authRoutes);
app.route('/api/orgs', orgRoutes);
app.route('/api/wiki', wikiRoutes);
app.route('/api/news', newsRoutes);
app.route('/api/admin', adminRoutes);
app.route('/api/changelog', changelogRoutes);
app.route('/api/themes', themeRoutes);
app.route('/api/forum', forumRoutes);
app.route('/api/notifications', notificationRoutes);
app.route('/api/search', searchRoutes);

// ===== 静态资源 + SPA 回退 =====
app.get('*', async (c) => {
  const url = new URL(c.req.url);
  let p = url.pathname;
  if (p === '/login' || p === '/register') p = '/auth.html';
  const res = await c.env.ASSETS.fetch(new Request(new URL(p, url.origin), c.req));
  if (res.status === 404 && !p.startsWith('/api')) {
    return c.env.ASSETS.fetch(new Request(new URL('/index.html', url.origin), c.req));
  }
  return res;
});

export default app;
