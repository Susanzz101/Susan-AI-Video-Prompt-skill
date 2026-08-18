# Susan-AI-Video-Prompt-skill

Susan-AI视频提示词生成智能体，专为即梦 Jimeng / Seedance 视频生成设计。

它可以帮助 AI 视频创作者生成高质量视频提示词，支持沉浸式吃播、服装展示、口播带货、产品演示、剧情短剧、视频反推复刻等场景，内置分镜、镜头语言、音效设计与多段衔接规则。

这是一个基于 `SKILL.md` 的 Agent Skill，适用于支持 Agent Skills / Claude Skills / Codex Skills 结构的主流 AI 编程助手与大模型工作台。

## 一键安装

推荐使用 `skills` CLI 一行命令安装：

```bash
npx -y skills add Susanzz101/Susan-AI-Video-Prompt-skill -g --all
```

安装后，请重启你的 AI 工具，或开启一个新对话，让 skill 被重新加载。

## 支持环境

本项目面向多平台分发，支持或兼容以下环境：

- Codex
- Claude Code
- Claude Skills 兼容环境
- VS Code Agent Skills
- Cursor / Windsurf 等可读取项目规则或 skills 目录的 AI 编程工具
- 其他支持 `SKILL.md` 结构的 Agent 工具

不同平台的 skills 目录规范可能不同。如果一键安装不可用，可以使用下方手动安装方式。

## 手动安装

如果 `npx` 一键安装失败，可以手动复制本仓库中的 `jimeng-video-prompt` 文件夹到对应平台的 skills 目录。

### Codex

全局安装目录：

```text
~/.codex/skills/jimeng-video-prompt
```

Windows 示例：

```powershell
Copy-Item -Recurse .\jimeng-video-prompt "$HOME\.codex\skills\jimeng-video-prompt"
```

macOS / Linux 示例：

```bash
mkdir -p ~/.codex/skills
cp -R ./jimeng-video-prompt ~/.codex/skills/jimeng-video-prompt
```

### Claude Code

个人全局 skills 目录：

```text
~/.claude/skills/jimeng-video-prompt
```

项目级 skills 目录：

```text
your-project/.claude/skills/jimeng-video-prompt
```

macOS / Linux 示例：

```bash
mkdir -p ~/.claude/skills
cp -R ./jimeng-video-prompt ~/.claude/skills/jimeng-video-prompt
```

Windows PowerShell 示例：

```powershell
New-Item -ItemType Directory -Force "$HOME\.claude\skills" | Out-Null
Copy-Item -Recurse .\jimeng-video-prompt "$HOME\.claude\skills\jimeng-video-prompt"
```

### VS Code Agent Skills

项目级目录：

```text
your-project/.github/skills/jimeng-video-prompt
```

示例：

```bash
mkdir -p .github/skills
cp -R ./jimeng-video-prompt .github/skills/jimeng-video-prompt
```

### 其他 AI 编程工具

如果你的工具支持读取 `SKILL.md`，只需要保证目录结构如下：

```text
jimeng-video-prompt/
└── SKILL.md
```

并将整个 `jimeng-video-prompt` 文件夹放入该工具要求的 skills / rules / agents 目录中。

## 备用安装脚本

如果你不想使用 `npx`，也可以使用仓库内置安装脚本。

Windows PowerShell:

```powershell
iwr https://raw.githubusercontent.com/Susanzz101/Susan-AI-Video-Prompt-skill/main/install.ps1 | iex
```

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/Susanzz101/Susan-AI-Video-Prompt-skill/main/install.sh | bash
```

Codex 内安装:

```text
$skill-installer https://github.com/Susanzz101/Susan-AI-Video-Prompt-skill/tree/main/jimeng-video-prompt
```

## Skill 结构

```text
Susan-AI-Video-Prompt-skill/
├── README.md
├── LICENSE
├── install.ps1
├── install.sh
└── jimeng-video-prompt/
    ├── SKILL.md
    ├── analysis_reference_format.md
    ├── rules/
    │   ├── L1_iron_rules.md
    │   ├── L2_defaults.md
    │   ├── cinematic_language.md
    │   └── output_format_standard.md
    ├── creation/
    │   ├── immersive/
    │   ├── narration/
    │   ├── drama/
    │   └── multi_segment/
    ├── reverse/
    └── templates/
```

核心入口文件是：

```text
jimeng-video-prompt/SKILL.md
```

## 适用场景

- 沉浸式吃播
- 沉浸式产品展示
- 服装展示
- 口播带货
- 产品功能演示
- 种草推荐视频
- 剧情带货短剧
- 参考视频反推 / 复刻
- 多段连续视频提示词生成

## 核心能力

### 1. 创作提示词

用户提供产品、人物、场景、时长、风格后，Skill 会自动判断视频类型，并生成适合即梦 / Seedance 使用的视频提示词。

支持类型包括：

- 食品吃播
- 服装展示
- 产品功能演示
- 产品种草推荐
- 剧情带货短剧

### 2. 视频反推

当用户提供参考视频、截图或文字描述时，Skill 可以反向拆解：

- 镜头结构
- 人物动作
- 场景关系
- 产品呈现方式
- 情绪节奏
- 音效设计

并还原成可复用的即梦视频生成提示词。

### 3. 电影级分镜格式

Skill 内置统一输出规范，提示词会按秒级时间码组织：

- 镜头语言
- 动作描述
- 情绪描述
- 环境光影
- 音效分层

适合生成 15 秒以内的单段视频，也支持 30 秒、60 秒等多段视频拆分。

## 示例用法

```text
帮我写一个15秒沉浸式酱肉包吃播提示词
```

```text
给我做一版洗地机口播功能演示视频提示词
```

```text
我发你一个参考视频，帮我反推成即梦提示词
```

```text
做一个30秒剧情带货短剧，产品是防晒喷雾
```

## 输出特点

- 竖屏 9:16
- 适配即梦 / Seedance
- 单段控制在 15 秒以内
- 支持素材槽位：人物、产品、背景、音色
- 默认无字幕
- 沉浸式视频默认无台词、无背景音乐
- 食品类强化咀嚼声、吸口水声、满足声
- 多段视频自动考虑衔接一致性
- 分镜按秒级时间码拆解
- 镜头、动作、情绪、环境、音效分层输出

## 规则体系

Skill 使用三层规则：

1. L1 铁律  
   平台限制、格式限制、素材槽位规则、无字幕规则等不可打破的基础规则。

2. L2 默认值  
   针对人物、音乐、台词、音效、镜头、场景等的默认配置。

3. 类型规则  
   根据视频类型加载对应规则，例如沉浸式吃播、口播功能演示、剧情带货等。

## 更新

使用 `skills` CLI 安装的用户，可以重新运行安装命令更新：

```bash
npx -y skills add Susanzz101/Susan-AI-Video-Prompt-skill -g --all
```

手动安装的用户，可以删除旧目录后重新复制新版 `jimeng-video-prompt` 文件夹。

## 卸载

如果使用 `skills` CLI 安装，可以尝试运行：

```bash
npx -y skills remove jimeng-video-prompt -g
```

也可以手动删除对应目录：

```text
~/.codex/skills/jimeng-video-prompt
~/.claude/skills/jimeng-video-prompt
your-project/.claude/skills/jimeng-video-prompt
your-project/.github/skills/jimeng-video-prompt
```

Windows PowerShell 示例：

```powershell
Remove-Item "$HOME\.codex\skills\jimeng-video-prompt" -Recurse -Force
Remove-Item "$HOME\.claude\skills\jimeng-video-prompt" -Recurse -Force
```

macOS / Linux 示例：

```bash
rm -rf ~/.codex/skills/jimeng-video-prompt
rm -rf ~/.claude/skills/jimeng-video-prompt
```

## 适合谁使用

- AI 视频创作者
- 即梦 / Seedance 用户
- 短视频带货团队
- 自媒体运营者
- 电商内容团队
- AI 视频提示词工程学习者
- 使用 Codex / Claude Code / VS Code Agent 的创作者

## License

MIT
```
