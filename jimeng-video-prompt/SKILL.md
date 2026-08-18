---
name: Susan-AI视频提示词生成智能体
description: 即梦（Jimeng/Seedance）AI视频生成提示词的创作与反推skill。当用户需要生成任何类型的即梦视频提示词时触发，包括但不限于：沉浸式吃播、服装展示、产品功能演示、种草推荐口播、剧情带货视频。同样当用户需要反推/复刻/拆解一段现有视频的提示词时触发。关键触发词：即梦、提示词、吃播、沉浸式、口播、带货视频、反推、复刻、视频脚本、Jimeng、Seedance。即使用户没有明确说"即梦"，只要涉及AI视频生成的提示词创作或反推，都应触发此skill。
---

# Susan-AI视频提示词生成智能体

## 概述

本skill用于生成和反推即梦（Jimeng/Seedance 2.0）平台的AI视频提示词。覆盖从沉浸式无台词视频到口播带货、剧情类视频的完整创作链路，同时支持从现有视频反向推导提示词。

## 核心工作流：两步路由

收到用户指令后，按以下顺序判断：

### 第一层：创作 or 反推？

```
用户指令
  │
  ├── 含"反推/复刻/拆解/还原"+视频/截图/参考 → 反推线
  │   └── 读取 reverse/v3_reverse_core.md
  │       ├── 用户给了视频文件 → 读取 reverse/input_mode_a.md
  │       └── 用户给了截图/文字描述 → 读取 reverse/input_mode_b.md
  │
  └── 含"生成/写/出一版/做一个/给我一段" → 创作线
      └── 进入第二层判断
```

### 第二层（创作线）：类型识别

```
创作线
  │
  ├── 沉浸式（无台词）
  │   识别信号："沉浸式""无台词""ASMR""纯吃""纯展示""不需要台词"
  │   │
  │   ├── 食品类 → 读取 creation/immersive/food_eating.md
  │   ├── 服装类 → 读取 creation/immersive/fashion_showcase.md
  │   └── 其他品类 → 读取对应品类文件，若无则使用通用沉浸式规则
  │
  ├── 口播式（有台词）
  │   识别信号："口播""介绍""台词""推荐""功能展示""带台词""种草"
  │   │
  │   ├── 功能演示型 → 读取 creation/narration/product_demo.md
  │   │   识别信号："功能""展示""演示""怎么用""教程""操作"
  │   │   支持品类：厨房工具、清洁用品、农资产品、宠物用品等
  │   │
  │   └── 种草推荐型 → 读取 creation/narration/product_review.md
  │       识别信号："推荐""种草""安利""测评""好用""分享"
  │
  └── 剧情类（有剧本/剧情设计）
      识别信号："剧情""剧本""故事""婆媳""反转""软广""漫剧""带货短剧""打脸"
      └── 读取 creation/drama/drama_commerce.md
```

### 第三层：单段 or 多段？

```
  │
  ├── 15s以内 or 未指定时长 → 单段，直接使用对应类型skill
  │
  └── 15s以上（30s/1分钟等）→ 多段
      └── 额外加载 creation/multi_segment/continuity_rules.md
          （在对应类型skill基础上叠加多段衔接规则）
```

## 规则体系

所有类型共享两层规则：

- **L1铁律**（`rules/L1_iron_rules.md`）：跨所有类型不可打破的平台限制和格式规范
- **L2默认值**（`rules/L2_defaults.md`）：各类型可覆盖的默认配置，含类型×规则的完整映射表

**规则加载顺序**：先加载L1 → 再加载L2 → 再加载具体类型skill → 类型skill中的规则可覆盖L2但不可覆盖L1

## 文件索引

```
jimeng-video-prompt/
├── SKILL.md（本文件：路由入口）
│
├── rules/
│   ├── L1_iron_rules.md（铁律：10条不可打破的规则）
│   └── L2_defaults.md（默认值：11条可覆盖的规则+类型映射表）
│
├── creation/（创作线）
│   ├── immersive/（沉浸式·无台词）
│   │   ├── food_eating.md（食品吃播——规则最完整）
│   │   ├── fashion_showcase.md（服装展示）
│   │   └── _category_template.md（新品类扩展模板）
│   │
│   ├── narration/（口播式·有台词）
│   │   ├── product_demo.md（功能演示型）
│   │   └── product_review.md（种草推荐型）
│   │
│   ├── drama/（剧情类带货）
│   │   └── drama_commerce.md（剧情带货：四幕结构+台词密度+产品植入+品类模板库）
│   │
│   └── multi_segment/
│       └── continuity_rules.md（多段衔接一致性规则）
│
├── reverse/（反推线）
│   ├── v3_reverse_core.md（V3反推核心规则）
│   ├── input_mode_a.md（视频文件输入流程）
│   └── input_mode_b.md（截图/文字输入流程）
│
└── templates/（精品案例库）
    ├── immersive_eating/（食品吃播案例）
    ├── immersive_fashion/（服装展示案例）
    ├── narration_demo/（功能演示案例）
    ├── narration_review/（种草推荐案例）
    ├── drama_commerce/（剧情带货案例）
    └── reverse/（反推案例）
```

## 重要说明

1. **v2.0电影级格式已上线**（2026-08）：
   - 统一输出格式规范：四层描述结构（镜头/动作/情绪/环境/音效）
   - 电影级镜头语言：推拉摇移+景深控制+光影描述+构图法则
   - 秒级精确时间码：2-3秒/分镜，使用方括号 `[]`
   - 动作拆解六维度：身体部位/起点终点/速度/力度/位置/附加动作
   - 情绪弧光设计：每个15秒视频有完整的情绪变化曲线
   - 音效分层结构：环境层+动作层+情绪层三层叠加

2. **核心文档体系**：
   - `rules/cinematic_language.md`：电影级镜头语言词库
   - `rules/output_format_standard.md`：统一输出格式规范
   - `rules/L1_iron_rules.md`：10条不可打破的铁律
   - `rules/L2_defaults.md`：11条可覆盖的默认值+类型映射表

3. **三大核心类型已完成v2.0升级**：
   - 沉浸式吃播：`creation/immersive/food_eating.md`
   - 口播功能演示：`creation/narration/product_demo.md`
   - 剧情带货：`creation/drama/drama_commerce.md`

4. **精品案例库持续补充**：templates目录下的案例在用户确认质量后持续添加

5. **品类可扩展**：当某个新品类积累了足够的规则和案例后，可在对应目录下新建独立md文件
