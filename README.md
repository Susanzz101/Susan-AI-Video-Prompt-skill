# Susan-AI-Video-Prompt-skill

Susan-AI视频提示词生成智能体，专为即梦 Jimeng / Seedance 视频生成设计。支持沉浸式吃播、服装展示、口播带货、产品演示、剧情短剧、视频反推复刻，内置分镜、镜头语言、音效与多段衔接规则。

## 一键安装

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

安装后，如果 Codex 没有立即识别，请重启 Codex 或开启一个新对话。

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

### 创作提示词

用户提供产品、人物、场景、时长、风格后，Skill 会自动判断视频类型，并生成适合即梦 / Seedance 使用的视频提示词。

支持类型包括：

- 食品吃播
- 服装展示
- 产品功能演示
- 产品种草推荐
- 剧情带货短剧

### 视频反推

当用户提供参考视频、截图或文字描述时，Skill 可以反向拆解：

- 镜头结构
- 人物动作
- 场景关系
- 产品呈现方式
- 情绪节奏
- 音效设计

并还原成可复用的即梦视频生成提示词。

### 电影级分镜格式

Skill 内置统一输出规范，提示词会按秒级时间码组织：

- 镜头语言
- 动作描述
- 情绪描述
- 环境光影
- 音效分层

适合生成 15 秒以内的单段视频，也支持 30 秒、60 秒等多段视频拆分。

## 文件结构

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
    ├── creation/
    ├── reverse/
    └── templates/
```

## 规则体系

Skill 使用三层规则：

1. L1 铁律  
   平台限制、格式限制、素材槽位规则、无字幕规则等不可打破的基础规则。

2. L2 默认值  
   针对人物、音乐、台词、音效、镜头、场景等的默认配置。

3. 类型规则  
   根据视频类型加载对应规则，例如沉浸式吃播、口播功能演示、剧情带货等。

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

## 适合谁使用

- AI 视频创作者
- 短视频带货团队
- 自媒体运营者
- 电商内容团队
- 提示词工程学习者
- 即梦 / Seedance 用户

## 卸载

删除本地目录即可：

```powershell
Remove-Item "$HOME\.codex\skills\jimeng-video-prompt" -Recurse -Force
```

macOS / Linux:

```bash
rm -rf "$HOME/.codex/skills/jimeng-video-prompt"
```

## License

MIT
