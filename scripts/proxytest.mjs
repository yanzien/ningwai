import { ProxyAgent, request } from 'undici';
const agent = new ProxyAgent('http://127.0.0.1:7890');
const t0 = Date.now();
try {
  const { statusCode } = await request('https://api.cloudflare.com/client/v4/user', { dispatcher: agent });
  console.log('api status:', statusCode, 'time:', Date.now() - t0, 'ms');
} catch (e) { console.log('api ERR:', e.message, '|', e.cause?.message, '| time:', Date.now() - t0, 'ms'); }
const t1 = Date.now();
try {
  const { statusCode } = await request('https://dash.cloudflare.com', { dispatcher: agent });
  console.log('dash status:', statusCode, 'time:', Date.now() - t1, 'ms');
} catch (e) { console.log('dash ERR:', e.message, '|', e.cause?.message, '| time:', Date.now() - t1, 'ms'); }
