# HatchZip 一键安装指南

> 第三方部署指南 · 非 HatchZip 官方仓库。官方项目：[xevrion/hatchzip](https://github.com/xevrion/hatchzip)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/xevrion/hatchzip/blob/main/README.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 磁盘只剩一点空间也能解大压缩包，让百度搭子把 HatchZip 装好。

⚠️ 支持 Windows 10/11、macOS 与 Linux。Windows 与 macOS 安装包尚未签名，首次运行需手动放行。解压过程中会逐步删除原压缩包；想保留压缩包，请在设置里关闭「解压时删除压缩包」。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/hatchzip-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会运行官方安装脚本，按系统下载对应构建、校验 SHA256 并装好 hatchzip 命令，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## HatchZip 是什么？

HatchZip 是开源的2.2k stars，Apache-2.0，原地解压 ZIP/7z/RAR/tar 的解压工具（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/xevrion/hatchzip?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

从压缩包末尾开始解压，每解出一部分就把已完成的字节从压缩包上切掉，释放的空间继续给后面的文件用，因此只需要输出大小的空间，而不是压缩包加输出两份。

- 原地解压：压缩包边解边缩小，峰值占用接近输出大小
- 格式覆盖：ZIP、7z、tar、tar.gz、RAR 分卷与分卷压缩包
- 安全前置：动手前先算空间，空间不够直接拒绝
- 断点续解：随时停止或崩溃，下次从断点继续
- 桌面 + CLI：右键菜单、图形界面与 hatchzip / hz 命令
- 完整校验：解压结果逐字节比对，失败可恢复

（来源：[官方仓库](https://github.com/xevrion/hatchzip)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 2.2k stars | 近两周增长很快的解压工具 |
| 省空间 | 峰值占用接近输出大小，适合快满的硬盘 |
| 格式全 | ZIP、7z、tar、tar.gz、RAR 分卷都能读 |
| 可恢复 | 中断或崩溃后能继续，不会从头再来 |
| 桌面 + CLI | 右键菜单和命令行都好用 |
| 开源可审计 | MIT OR Apache-2.0，构建带 provenance |

| 需要注意 | 说明 |
|---|---|
| 会删除原压缩包 | 默认边解边删，想保留要显式设置 |
| solid 7z 受限 | 单个 solid block 仍需等整块解完 |
| 安装包未签名 | Windows / macOS 首次运行要手动放行 |
| 单大文件不快 | 并行解压对单文件无效 |
| 新项目 | 版本还在 0.1.x，边缘格式可能有问题 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fsSL https://raw.githubusercontent.com/xevrion/hatchzip/main/install.sh | sh
command -v hatchzip >/dev/null 2>&1 || { echo "安装后没找到 hatchzip，请重开终端或检查 PATH"; exit 1; }
echo "安装完成：运行 hatchzip --help 查看命令，或右键压缩包选 HatchZip"
```

安装包来源：[https://github.com/xevrion/hatchzip#installation](https://github.com/xevrion/hatchzip#installation)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认官方安装脚本会按平台下载并校验 SHA256 | 已核对 2026-10-28 |
| Release v0.1.7 的资产清单与校验文件已核对 | 已核对 2026-10-28 |
| 未实测解压大文件（本机没有接近满盘的测试环境） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

HatchZip 不含 MCP；本仓库的 MCP 只提供安装步骤、空间计算与常见问题，不参与解压。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\hatchzip-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 怎么用

```bash
hatchzip extract game.7z          # 原地解压，压缩包随之缩小
hatchzip check game.7z            # 只算空间，不动文件
hatchzip extract game.7z --keep   # 保留压缩包（需要两份空间）
```

Windows 也可以右键压缩包 → HatchZip → Extract here；Windows 11 在「显示更多选项」里。

## 什么时候不适合

- 7z 只有一个大 solid block：必须等整块解完才能释放，空间不足会被拒绝
- 压缩包里只有一个巨大文件：解压速度受单核限制
- 需要保留压缩包：用 `--keep` 或关掉设置里的删除选项，占用会翻倍

## 安装方式备选

| 系统 | 命令 |
|---|---|
| macOS / Linux | `brew install xevrion/tap/hatchzip` |
| Windows | `scoop bucket add xevrion https://github.com/xevrion/scoop-bucket` 后 `scoop install xevrion/hatchzip` |
| 任意平台 | `cargo install hatchzip` |

> ⚠️ 解压会直接修改原压缩包。重要文件先备份，或在设置里关闭「解压时删除压缩包」。

## 常见坑

- Windows 提示已保护你的电脑：点「更多信息 → 仍要运行」，安装包尚未签名
- macOS 打不开：到系统设置 → 隐私与安全性里允许一次
- 解压前没空间：先跑 hatchzip check，确认剩余空间大于输出大小
- 想保留压缩包：用 --keep，或在设置里关闭「解压时删除压缩包」
- 7z 被拒绝：单 solid block 无法边解边释放，换分卷或先腾空间
- 命令找不到：重开终端；安装脚本只装到用户目录，不写系统 PATH
- 中断后不敢继续：直接重跑同一命令，会从断点续解

## 免责声明

本仓库为第三方指南，与 HatchZip 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/xevrion/hatchzip/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
