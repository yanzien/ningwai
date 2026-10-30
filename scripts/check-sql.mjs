// 静态扫描：db.prepare(SQL) 的 ? 占位符数 vs .bind() 参数数
import { readdirSync, readFileSync } from 'fs';
const dir = 'src/lib';
for (const f of readdirSync(dir)) {
  if (!f.endsWith('.js')) continue;
  const src = readFileSync(`${dir}/${f}`, 'utf8');
  const lines = src.split('\n');
  lines.forEach((line, i) => {
    if (!/db\.prepare\(/.test(line)) return;
    // 拼接后续行直到 .bind( 或语句结束
    let stmt = line; let j = i;
    while (!/\.bind\(/.test(stmt) && j < lines.length - 1) { j++; stmt += '\n' + lines[j]; }
    if (!/\.bind\(/.test(stmt)) return;
    const sqlMatch = stmt.match(/prepare\(\s*[`'"]([\s\S]*?)[`'"]\s*,?\s*\)/);
    if (!sqlMatch) return;
    const sql = sqlMatch[1];
    if (/^\s*(SELECT|DELETE|INSERT|UPDATE|CREATE)/i.test(sql) === false) return;
    const qCount = (sql.match(/\?/g) || []).length;
    const bindMatch = stmt.match(/\.bind\(([\s\S]*?)\)\s*\.run|\.bind\(([\s\S]*?)\)\s*\.first|\.bind\(([\s\S]*?)\)\s*\.all|\.bind\(([\s\S]*?)\)\s*\.batch/);
    if (!bindMatch) return;
    const bindArgs = (bindMatch[1] || bindMatch[2] || bindMatch[3] || bindMatch[4] || '').trim();
    // 数顶层逗号
    let depth = 0, count = bindArgs === '' ? 0 : 1;
    for (const ch of bindArgs) {
      if (ch === '(' || ch === '[' || ch === '{') depth++;
      else if (ch === ')' || ch === ']' || ch === '}') depth--;
      else if (ch === ',' && depth === 0) count++;
    }
    if (bindArgs.includes('...')) { console.log(`⚠️  ${f}:${i + 1} 展开传参无法静态核对 (SQL需${qCount}个?)`); return; }
    if (count !== qCount) console.log(`❌ ${f}:${i + 1} SQL需 ${qCount} 个?，bind 传了 ${count} 个 | ${sql.slice(0, 70).replace(/\s+/g, ' ')}`);
  });
}
console.log('=== 扫描完成 ===');
