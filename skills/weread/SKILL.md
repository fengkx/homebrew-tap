---
name: weread
description: 使用微信读书（WeRead）CLI 为指定书籍计时、上报阅读时长并核对云端记录。也适用于安装登录、查询书架和同步书签。
---

# 微信读书 CLI

## 上报阅读时长

**用户指定分钟数时，运行 `weread read time-interval <bookId> --minutes <分钟数>`，等待同一个进程完成。** 分钟数须为正整数。用户给出书名时，用 `weread shelf list --full` 匹配书名和作者；用户说“当前这本书”时，用 `weread read current --full` 取得 ID。首次使用先完成下方的安装与登录。

例如，用户要求给书籍 `3300111666` 记录 2 分钟：

```sh
weread read time-interval 3300111666 --minutes 2
```

- **等待上报。** CLI 先读取这本书的累计时长，经过首个 30 秒后才提交第一段。两分钟共提交四段，stderr 依次显示累计 30、60、90、120 秒的回执，最后一条是 `Acknowledged 120 seconds.`。若执行工具先返回会话 ID，继续等待该会话；给最终回读留出时间。
- **核对结果。** 进程结束后读取 stdout 的 JSON。`reportedSeconds` 是本次上报秒数，`observedDelta` 是云端这本书的累计时长增量。`verified: true` 表示增量至少达到上报值。例如两者均为 120 时，可告知用户“已上报 2 分钟，云端累计时长增加了 120 秒”。其他设备同时阅读也可能影响增量。
- **处理中断。** 若 `verified: false`、进程中断或连接断开，保留最后一次回执，再运行 `weread read status <bookId>` 核对 `readingTime`。向用户分别说明已获回执的时长和仍待确认的部分，避免重复上报整段。

**用户希望读完再结束时**，在交互式终端运行 `weread read time <bookId>`。保持进程运行，等用户表示读完后向同一进程发送回车。CLI 此时一次性上报实际经过的整秒数，并回读云端累计时长。

## 安装与登录

1. 运行 `weread --version`。如果命令不存在，在装有 Homebrew 的 macOS 或 Linux 上执行 `brew install fengkx/tap/weread`，再检查版本。没有 Homebrew 时，从[公开发布页](https://github.com/fengkx/homebrew-tap/releases?q=weread-v)下载匹配系统和 CPU 架构的压缩包，解压后直接运行 `./weread --version`。
2. 执行 `weread auth show` 检查本地 Web 会话。若已有会话，直接执行请求。若缺少会话或服务提示登录过期，运行 `weread auth login`，请用户用微信扫码确认。会话文件含有凭据，检查账户时用 `auth show` 即可。
3. 如果用户看不到终端，在交互式终端运行下面两行，将生成的 PNG 展示给用户。保持登录进程运行；若提示输入四位验证码，让用户在该终端输入。登录成功后继续原任务。

```sh
qr_dir=$(mktemp -d)
weread auth login --qr-file "$qr_dir/login.png"
```

自定义会话文件用全局参数指定，例如 `weread --session "/path/to/web-session.json" auth show`。后续命令沿用同一路径。查看当前版本支持的参数可用 `weread help <命令组> <子命令>`。

## 查询

| 用户意图 | 命令 |
| --- | --- |
| 列出书名、作者和 ID | `weread shelf list --full`，可加 `--limit 10` |
| 查询最近阅读的书 | `weread read current --full` |
| 查看书籍详情 | `weread book info <bookId>` |
| 查看书签 | `weread read progress [bookId]` |
| 查看书签及服务端返回的累计阅读秒数 | `weread read status [bookId]` |

用实际 ID 替换占位符。省略可选 ID 会查询最近阅读的书。用户指定书名时，从书架结果匹配书名和作者；有多个候选且无法确定时，让用户选择。

## 更新书签

用户要求调整阅读位置时，执行 `weread read sync <bookId> <percent>`，百分数范围为 0 到 100。该命令上报的阅读秒数为 0。如果写入后回读失败，先用 `weread read progress <bookId>` 查询实际位置。
