// 手动刷新 wrangler OAuth token（沙箱内 wrangler 不会自动刷新 invalid token 的场景）
// 用法：node --require ./scripts/proxy-patch.js scripts/refresh-cf-token.mjs
import { readFileSync, writeFileSync, copyFileSync } from 'node:fs';
import { homedir } from 'node:os';
import { join } from 'node:path';

const CLIENT_ID = '54d11594-84e4-41aa-b438-e81b8fa78ee7';
const cfgPath = join(homedir(), '.wrangler', 'config', 'default.toml');
const raw = readFileSync(cfgPath, 'utf8');
const get = (k) => (raw.match(new RegExp(`^${k} = "([^"]*)"`, 'm')) || [])[1];
const refreshToken = get('refresh_token');
if (!refreshToken) { console.error('NO_REFRESH_TOKEN'); process.exit(1); }
console.log('current expiration:', get('expiration_time'));

const res = await fetch('https://auth.cloudflare.com/oauth/token', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ client_id: CLIENT_ID, grant_type: 'refresh_token', refresh_token: refreshToken }),
});
const text = await res.text();
console.log('status:', res.status);
let d;
try { d = JSON.parse(text); } catch { console.error('non-json:', text.slice(0, 300)); process.exit(1); }
if (!res.ok) { console.error('refresh failed:', JSON.stringify(d).slice(0, 400)); process.exit(1); }

const access = d.access_token || d.oauth_token;
const refresh = d.refresh_token || refreshToken;
const exp = new Date(Date.now() + (d.expires_in || 3600) * 1000).toISOString();
console.log('new access token:', access.slice(0, 12) + '…');
console.log('new expiration:', exp);
if (!access) { console.error('no access_token in response:', JSON.stringify(d).slice(0, 300)); process.exit(1); }

copyFileSync(cfgPath, cfgPath + '.bak.' + Date.now());
let out = raw
  .replace(/^oauth_token = "[^"]*"/m, `oauth_token = "${access}"`)
  .replace(/^refresh_token = "[^"]*"/m, `refresh_token = "${refresh}"`)
  .replace(/^expiration_time = "[^"]*"/m, `expiration_time = "${exp}"`);
writeFileSync(cfgPath, out);
console.log('✅ default.toml updated (backup saved)');
