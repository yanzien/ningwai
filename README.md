<div align="center">

<img src="public/logo-64.png" width="84" alt="宁外八一 logo">

# 宁外八一 · Ningwai

**面向中学的校园社区平台** · 论坛 / 档案库 / 主题商店 / 通知 / 全站搜索

浏览器打开就能用，不装 App、不依赖手机

[线上站点](https://ningwai.pages.dev) · [快速开始](#快速开始) · [设计取舍](#几个值得说的设计取舍)

<sub>非学校官方项目，由学生自发开发与维护</sub>

</div>

---
## 人话区
下面的内容有借助AI，我先来说点人话，面向对象本身是面对同学们缺少统一的~~开黑料~~社区、论坛的想法而设计的，有人可能会问怎么没有那种聊天功能，这个因为我在另一个项目<https://mdqp.pages.dev/chat> 已经做过了。
因为组织还没完全做好，网站设计面向我所在学校，所以也欢迎大家开源修改。（但请标注made by @yanzien）
## 这是什么

一所中学里，消息散在十几个群里：班级通知、社团招新、老师发的资料、往届的经验。手机在校内不能用，机房电脑一重启就还原，这些信息每次都得重新找回。

宁外八一是一个跑在浏览器里的校园社区：一条链接、一个账号，在机房、在家、在手机上打开都是同一份内容。

**当前状态**：2026-10-13 上线，半个月迭代到 v2.3 共 15 个版本，校内实际使用中。

## 功能

| 模块 | 能力 |
|---|---|
| **论坛** | 分类、发帖、楼层回复、置顶加精、可选发帖审核（`forum_review` 开关） |
| **档案库** | 文件树组织；分级权限；级/班/老师/学生多类页面；修订审核；历史对比与**一键回滚**；词条互链 |
| **主题商店** | 内置 20 套主题；可视化调色工坊；一键采用；非作者修改需另存为（fork）；`use_count` 统计真实采用数 |
| **通知** | 回复、审核结果、回滚等事件触发站内通知；顶栏铃铛 + 未读红点 |
| **搜索** | 论坛、档案库、公告三源统一检索 |
| **组织** | 多组织架构，公开/私有；开放加入或审批；邀请码；成员班级信息 |
| **管理后台** | 用户管理、封禁、角色任免、待审队列、审计日志、站点设置 |
| **阅读体验** | Markdown + 数学公式（KaTeX，本地托管）、代码高亮、目录、懒加载、移动端适配 |
| **账号** | 注册限流、设备指纹、注册免责门、改密即作废全部会话 |

接口共 80 个端点，分布在 10 个路由模块。

## 技术栈

- **运行时**：Cloudflare Pages（`_worker.js` 单 Worker）+ Functions 资源绑定
- **框架**：Hono（仅服务端；前端零框架）
- **数据库**：Cloudflare D1（SQLite），18 张表 / 23 个索引
- **前端**：原生 JavaScript SPA，hash 路由，单文件视图层，无构建步骤
- **公式**：KaTeX（vendored，不走 CDN）
- **部署**：wrangler；零服务器、零容器

## 架构

```
浏览器
  │  index.html + app.js（原生 SPA，hash 路由）
  ▼
Cloudflare Pages
  ├─ /_worker.js     ← src/worker.js（Hono）
  │    ├─ /api/auth        登录 / 注册 / 会话 / 改密
  │    ├─ /api/orgs        组织 / 成员 / 邀请
  │    ├─ /api/wiki        文件树 / 词条 / 修订 / 审核 / 回滚
  │    ├─ /api/forum       分类 / 主题 / 楼层
  │    ├─ /api/themes      主题 / 商店 / fork
  │    ├─ /api/news        公告
  │    ├─ /api/notifications 站内通知
  │    ├─ /api/search      三源检索
  │    ├─ /api/admin       后台
  │    └─ * 其余            静态资源 + SPA 回退（c.env.ASSETS）
  └─ D1（ningwai-db）
       所有业务表 + 会话表

定时任务（独立 Worker）
  └─ wrangler-backup.toml → 每天 UTC 16:00 全量导出 D1 → 私有仓库 backups/
```

## 目录结构

```
ningwai/
├─ public/                 前端，直接发布，无构建
│  ├─ index.html           单页外壳
│  ├─ app.js               路由 + 全部视图
│  ├─ theme.js             主题系统与商店
│  ├─ auth.html/js         登录注册页
│  ├─ style.css
│  ├─ anniv/               校庆视觉素材
│  └─ vendor/katex/        KaTeX（本地）
├─ src/
│  ├─ worker.js            Worker 入口（Hono）
│  ├─ backup-worker.js     独立备份 Worker
│  └─ lib/                 10 个路由模块 + common.js 公共层
├─ scripts/                构建、迁移、e2e、运维脚本
├─ schema.sql              完整建库（幂等，新部署用这个）
├─ seed-core.sql           基础数据（默认组织、站长身份、站点设置）
├─ database_init.sql       初版表结构（历史保留）
├─ wrangler.toml           Pages 配置
└─ wrangler-backup.toml    备份 Worker 配置
```

## 快速开始

### 0. 前置

- Node.js 18+
- Cloudflare 账号（免费版足够）
- 一个域名或直接用 `*.pages.dev`

### 1. 拉代码

```bash
git clone https://github.com/yanzien/ningwai.git
cd ningwai
npm install
```

### 2. 建数据库

```bash
npx wrangler d1 create ningwai-db
# 把返回的 database_id 填进 wrangler.toml
npx wrangler d1 execute ningwai-db --remote --file=schema.sql
```

`schema.sql` 已合并全部历史迁移，可重复执行。建完是 18 张表、23 个索引。

> 关于 KV：`wrangler.toml` 里保留了 `KV` 绑定，只用于缓存失效（缺失也能跑）。不需要可以删掉那段。

### 3. 构建与部署

```bash
npm run pages:build      # esbuild 打包 src/worker.js → pages-build/_worker.js，并拷贝 public/
npx wrangler pages deploy pages-build --project-name ningwai
```

首次部署会在 Cloudflare 上自动创建 Pages 项目。

### 4. 初始化第一个站长

系统的最高权限由 `site_settings.owner_user_id` 指定，而不是写死在代码里。

1. 打开站点，**注册第一个账号**（空库第一个用户 `id` 必为 1）
2. 跑基础数据，把它设为站长与默认组织管理员：

```bash
npx wrangler d1 execute ningwai-db --remote --file=seed-core.sql
npx wrangler d1 execute ningwai-db --remote \
  --command "UPDATE users SET role='website_admin', must_change_pw=0 WHERE id=1"
```

3. 回到站点刷新，顶栏会出现「管理」入口

`seed-core.sql` 里的组织名、站点名是示例值，改成自己的学校即可。

### 5. 可选：每日自动备份

```bash
npx wrangler deploy -c wrangler-backup.toml
npx wrangler secret put GH_BACKUP_TOKEN -c wrangler-backup.toml   # 一个有 repo 权限的 GitHub PAT
```

备份 Worker 每天把全库 dump 成 SQL 推到 `GH_BACKUP_REPO` 指定的**私有**仓库。恢复用：

```bash
npx wrangler d1 execute ningwai-db --remote --file=backups/d1-YYYY-MM-DD.sql
```

> 备份文件含真实用户数据（用户名、密码哈希、发帖记录），务必放在私有仓库。本开源仓库不含任何备份文件。

## 权限模型

四层，逐级收敛：

| 角色 | 权限 |
|---|---|
| 普通用户 `user` | 发帖、编辑档案（受组织 `wiki_perm` 四档限制：全开 / 可编辑 / 可编辑可审 / 全审核） |
| 组织管理员 `org_admin` | 管理本组织成员、邀请码、本组织内容审核 |
| 网站管理员 `website_admin` | 全站内容与用户管理；**只能封禁普通用户**，不能互相封禁、不能任免管理员 |
| 创始人（`owner_user_id`） | 唯一可以任免网站管理员；不可被封禁、不可被降级 |

这张表是踩过坑之后定下来的：早期版本里管理员能封禁任何人，包括开发者自己。

## 几个值得说的设计取舍

**会话放 D1，不放 KV。** Cloudflare 免费版 KV 的写入额度是**账号级** 1000 次/天，登录态刷新很快就能打满，一打满全站登录失效。D1 免费层 10 万行写入/天，够用得多。

**密码用 PBKDF2-SHA256 10 万次迭代 + 16 字节盐**，改密时作废该用户全部会话。

**Markdown 渲染禁用原始 HTML。** 校园站点的内容是学生写的，允许 raw HTML 等于开 XSS 后门。

**给每个热点查询配索引，并用冗余计数器替掉 `COUNT(*)`。** 上线第十天 D1 免费层的 500 万行读就被打爆了，`insights` 显示 `wiki_pages` 相关查询占全库行读 86%，根因是缺索引导致全表扫描。补索引 + `site_settings.wiki_page_count` 计数器后，单次查询从 398 行读降到 40.7 行。**免费额度不是靠省钱扛住的，是靠少读行扛住的。**

**主题是「共享」而不是「复制」。** 商店里点「使用」直接指向原作者那份，作者名仍是原作者；想改就 fork 一份副本，作者变成自己。这样同一套主题只有一份数据，改一次所有使用者都跟着更新。

**每天凌晨全量备份到私有仓库。** 校园数据丢了没人能帮你找回，备份不能依赖「我记得手动导」。

## 版本历史

| 版本 | 内容 |
|---|---|
| v1.0 | 注册登录、组织、档案库、公告、管理后台 |
| v1.1 – v1.3 | 书院风视觉、版本日志系统、档案库文件树、班级权限四档 |
| v1.6 | 索引优化，修 D1 日读打爆 |
| v1.9 | 论坛上线（分类 / 楼层 / 精华 / 审核流） |
| v1.10 | 数学公式（KaTeX）、精华徽章 |
| v2.0 | D1 读额度优化（单查询 398 → 40.7 行）、个人中心入口 |
| v2.1 | 权限修复：创始人保护机制 |
| v2.2 | 主题工坊与商店合并，共享/fork 语义 |
| v2.3 | 站内通知、全站搜索、词条回滚、每日自动备份 |

## 贡献

Issue 和 PR 都欢迎。改代码前建议先读 `src/lib/common.js`（鉴权、密码、通知、缓存都在这里）和 `src/worker.js`（路由挂载点）。

几个约束：

- 前端不引入构建步骤，`public/` 里的文件直接发布
- 新增路由模块要在 `src/worker.js` 里挂载，跨文件引用的函数**必须显式 import**（`node --check` 查不出这类问题，构建能查出来）
- 新增查询请顺手确认走了索引，`npx wrangler d1 insights ningwai-db` 能看排行

## 许可证

[MIT](LICENSE)

## 声明

- 本项目**不代表任何学校官方**，是学生自发的作品
- 开源仓库内所有数据均为示例数据，不含任何真实师生信息
- 上线运营时请遵守所在地关于未成年人个人信息保护的相关规定，班级成员信息应仅对授权范围内的人可见
