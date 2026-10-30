// wrangler 代理补丁：在 cli.js 加载前把 undici 全局 dispatcher 换成 ProxyAgent
// 用法：node --require ./scripts/proxy-patch.js node_modules/wrangler/bin/wrangler.js <args>
const undici = require('undici');
undici.setGlobalDispatcher(new undici.ProxyAgent(process.env.WRANGLER_PROXY || 'http://127.0.0.1:7890'));
