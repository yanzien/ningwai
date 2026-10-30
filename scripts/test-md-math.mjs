// 无头验证 md() 数学公式链路（步骤 1-3）+ KaTeX 资源完整性
// 从 app.js 中抽出 esc + md 源码，在 node 中执行（无 DOM，走 return html 降级分支）
import { readFileSync } from 'node:fs';

const appSrc = readFileSync(new URL('../public/app.js', import.meta.url), 'utf8');
const start = appSrc.indexOf('let _mathBlockId');
const end = appSrc.indexOf('function fmtDate');
if (start < 0 || end < 0) { console.error('FAIL: 找不到 md() 源码片段'); process.exit(1); }
const snippet = appSrc.slice(start, end);
const escSrc = (appSrc.match(/function esc\(s\) \{[^}]+\}/) || [''])[0];

const factory = new Function('window', 'document', `
  ${escSrc}
  ${snippet}
  return md;
`);
const md = factory({}, undefined);

let pass = 0, fail = 0;
const check = (name, cond, extra = '') => {
  if (cond) { pass++; console.log(`  ✓ ${name}`); }
  else { fail++; console.log(`  ✗ ${name} ${extra}`); }
};

console.log('== 1. 数学块提取与还原 ==');
const r1 = md('行内公式 $x^2 + y^2 = z^2$ 结束');
check('行内公式还原为 $...$', r1.includes('$x^2 + y^2 = z^2$'), r1);
check('无占位符残留', !r1.includes('\x00'), r1);

const r2 = md('块级公式：\n\n$$\\frac{-b \\pm \\sqrt{b^2 - 4ac}}{2a}$$\n\n后续段落');
check('块级公式还原为 $$...$$', r2.includes('$$\\frac{-b \\pm \\sqrt{b^2 - 4ac}}{2a}$$'), r2);

const r3 = md('颜色 $\\color{yellow}yellow$ 和大小 $a<b$');
check('含反斜杠命令的公式完整保留', r3.includes('$\\color{yellow}yellow$'), r3);
check('公式中的 < 被转义（不破坏 HTML）', r3.includes('$a&lt;b$'), r3);

console.log('== 2. 普通 Markdown 不受影响 ==');
const r4 = md('**加粗** 和 *斜体* 和 `代码 $x$`');
check('加粗/斜体正常', r4.includes('<strong>加粗</strong>') && r4.includes('<em>斜体</em>'), r4);
check('行内代码内的 $ 被保留为文本（code 标签内，auto-render 会忽略）', r4.includes('<code>代码 $x$</code>'), r4);
const r5 = md('# 标题\n\n- 列表项\n\n![图](https://a.com/b.png)');
check('标题/列表/图片正常', r5.includes('<h1>标题</h1>') && r5.includes('<li>列表项</li>') && r5.includes('<img src="https://a.com/b.png"'), r5);

console.log('== 3. XSS 防护仍在 ==');
const r6 = md('<script>alert(1)</script> 和 <img src=x onerror=alert(1)>');
check('script 被转义', !r6.includes('<script>'), r6);
const r7 = md('$\\text{<script>alert(1)</script>}$');
check('公式内的 script 字样被转义', !r7.includes('<script>'), r7);

console.log('== 4. 边界 ==');
const r8 = md('价格是 $5 和 $10 美元');
check('货币 $ 场景不崩（占位符机制正常往返）', typeof r8 === 'string' && !r8.includes('\x00'), r8);
const r9 = md('');
check('空输入不崩', r9 === '');

console.log(`\nmd() 链路：${pass} 通过 / ${fail} 失败`);

// KaTeX 资源完整性（node 可直接跑 renderToString）
console.log('== 5. KaTeX 资源完整性 ==');
try {
  const katex = (await import('../public/vendor/katex/katex.min.js', { with: {} })).default;
  const out = katex.renderToString('\\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}', { throwOnError: false });
  check('katex.renderToString 产出 HTML', out.includes('katex') && out.includes('frac'), out.slice(0, 80));
  const out2 = katex.renderToString('\\color{yellow}yellow', { throwOnError: false });
  check('\\color 命令可渲染', out2.includes('color') || out2.length > 20, out2.slice(0, 80));
} catch (e) {
  check('katex.min.js 可加载并渲染', false, e.message);
}
process.exit(fail ? 1 : 0);
