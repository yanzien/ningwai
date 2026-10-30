-- v1.10 LaTeX 支持 + 精华标记 + 计数修复
INSERT INTO changelog (version, title, content, preview_url) VALUES ('v1.10', 'LaTeX 公式 · 精华标记 · 计数修复', '## 数学公式与论坛修正

- 论坛帖子、资讯、档案库词条支持 LaTeX 数学公式：行内公式写 $...$，独立公式写 $$...$$。
- 例：$E=mc^2$、$$\int_0^1 x^2 dx = \frac{1}{3}$$ 会渲染为排版好的公式，公式内可用 \color 等命令。
- 代码块内的 $ 符号按普通文本处理，不会被当成公式。
- 精华主题在论坛列表、主题页、首页热帖三处显示「精华」标记。
- 修复管理员删除主题后板块帖子计数多扣一篇的问题。', 'https://73fee2fc.ningwai.pages.dev/');
