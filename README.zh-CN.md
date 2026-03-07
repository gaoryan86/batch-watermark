<!-- SEO: 批量水印工具, 批量图片水印, 本地浏览器水印应用, macOS 水印工作流, 文件夹图片批处理 -->

<div align="center">

# Batch Watermark

**Batch Watermark 是一个面向 macOS、Windows 和 Chrome/Edge 的本地批量图片水印工具。你可以直接导入文件夹，快速放置文字水印，逐张检查待处理图片，并安全导出自动改名后的结果。**

![许可证：个人使用](https://img.shields.io/badge/License-Personal%20Use-lightgrey)
![平台：macOS / Windows](https://img.shields.io/badge/Platform-macOS%20%2F%20Windows-black)
![浏览器：Chrome/Edge](https://img.shields.io/badge/Browser-Chrome%20%2F%20Edge-blue)
![依赖：零依赖](https://img.shields.io/badge/Dependencies-Zero-success)

[English](./README.md) | 简体中文

</div>

---

## 为什么要用 Batch Watermark？

| 问题 | Batch Watermark 的解决方式 |
|------|---------------------------|
| 一次要处理很多图片，来回切换很慢 | 直接加载整个文件夹，在底部缩略图里连续审核 |
| 手动找下一张图很耗神 | 可以一键跳到下一张待处理图片，或直接按 `N` |
| 导出时覆盖原图有风险 | 默认导出成 `image_aicwm.jpg` 这类新文件名 |
| 浏览器工具常常看起来像临时脚本 | 用“已保存 / 待处理”的工作流组织整批图片，并记住导出目录 |

> **TL;DR** - 这个工具的目标是把本地批量水印流程变短、变清楚。打开文件夹，调整每张图的文字水印，在需要时保存当前设置，然后导出自动改名后的结果，全程不离开浏览器。

## 核心功能

### 审核流程

- **直接打开文件夹** - 读取当前文件夹里的图片，并按文件名自动排序。
- **立即保存当前设置** - 如果你想手动留一个确认点，可以马上记录当前图的水印设置。
- **跳到下一张待处理图片** - 用主按钮或 `N` 快速推进整批图片。

### 水印编辑

- **文字水印拖拽定位** - 在当前图片上自由拖动文字位置。
- **字号控制** - 用滑块调整字号，并保持批量处理时的一致性。
- **复制当前设置到全部图片** - 把当前图的文字、位置、字号复制到整批图片。

### 导出安全

- **导出自动改名** - 默认输出 `originalname_aicwm.ext`。
- **同名自动避让** - 如果该文件已存在，会继续输出 `originalname_aicwm_2.ext`、`originalname_aicwm_3.ext`。
- **记住导出文件夹** - 浏览器允许时，会自动复用上次授权的导出目录。

### 易用性

- **中英双语界面** - 可在页面顶部切换中文或英文。
- **支持 macOS Spotlight 启动** - 一条脚本生成本地 `.app` 启动器。
- **支持 Windows 双击启动** - 仓库内附带 `.cmd` 启动器。
- **完全本地处理** - 不上传，不依赖服务器，不走云端。

## 数据安全 / 工作方式

```text
图片文件夹 / 图片文件
        |
        v
浏览器中的 batch-watermark.html
        |
        +--> 水印编辑只保存在当前会话内存里
        |
        +--> 导出只写入你授权的本地文件夹
        |
        v
输出为 image_aicwm.jpg 这类自动改名文件
```

- 所有图片处理都在本地浏览器中完成。
- 工具不会把图片发送到远程服务。
- 导出权限依赖 Chrome / Edge 的本地文件夹授权机制。

## 快速开始

```bash
cd batch-watermark
open batch-watermark.html
```

可选的 macOS 启动器：

```bash
./build-mac-app.sh
```

之后在 Spotlight 里搜索 `Batch Watermark` 即可启动。

Windows 启动器：

```bat
Launch Batch Watermark.cmd
```

在资源管理器里双击它，就会用默认浏览器打开 `batch-watermark.html`。

## 示例流程

```text
1. 打开文件夹
2. 调整文字、字号和位置
3. 如果想手动留一个确认点，就先立即保存当前设置
4. 按 N 跳到下一张待处理图片
5. 导出已保存图片

导出命名示例：
party_12.jpeg -> party_12_aicwm.jpeg
如果 party_12_aicwm.jpeg 已存在 -> party_12_aicwm_2.jpeg
```

## 环境要求

- macOS 或 Windows
- Chrome 86+ 或 Edge 86+，用于 File System Access API
- 本地图片格式：JPEG、PNG、WebP、GIF、BMP、AVIF

## 配置说明

| 项目 | 默认值 | 说明 |
|------|--------|------|
| 界面语言 | 自动跟随浏览器语言 | 也可以在页面顶部手动切换 |
| 默认字号 | `24` | 新建水印时的初始字号 |
| 默认导出路径显示 | `/Users/Ryansmac/Downloads/watermark_ai_character/output_ai_character` | 页面默认展示的建议导出位置 |
| 导出命名规则 | `_aicwm` 后缀 | 避免误覆盖原始文件名 |

## 项目结构

```text
batch-watermark/
├── batch-watermark.html
├── build-mac-app.sh
├── Launch Batch Watermark.cmd
├── README.md
└── README.zh-CN.md
```

- `batch-watermark.html` 是完整应用，包含 UI、交互逻辑、导出流程和语言切换。
- `build-mac-app.sh` 用来生成可被 Spotlight 启动的 macOS 包装器。
- `Launch Batch Watermark.cmd` 用来在 Windows 上双击打开应用。
- 项目没有运行时依赖，也没有后端服务。

## 适用场景

- 批量审核和打标 AI 角色图片
- 在分享前给预览图加文字标识
- 给本地图片文件夹快速加轻量级水印
- 大批量人工过图，但只有少量图片需要细调
- 希望整个工作流都留在本地的 macOS 创作者场景

## FAQ

<details>
<summary>“立即保存当前设置”是什么意思？</summary>

它会立刻保存当前图片的水印文字、位置和字号。切换图片、跳到下一张或导出时，也会自动记住当前调整。

</details>

<details>
<summary>“下一张待处理”是什么意思？</summary>

它会直接跳到下一张还没有保存过水印设置的图片，适合快速审核整批图片。

</details>

<details>
<summary>“把当前设置复制到全部图片”是什么意思？</summary>

它会把当前图片的文字、字号和位置复制到整批图片上。其他图片已经保存的设置会被覆盖。

</details>

<details>
<summary>这个工具会覆盖原图吗？</summary>

不会。导出文件默认会追加 `_aicwm` 后缀。如果该名字已存在，工具会继续生成带编号的新名字。

</details>

<details>
<summary>为什么导出时还需要授权文件夹？</summary>

因为它运行在浏览器里，写入本地文件必须经过 Chrome 或 Edge 的文件夹授权。浏览器允许时，工具会记住这个目录。

</details>

## 贡献说明

这个项目目前是一个聚焦本地工作流的实用工具。如果后续上传到 GitHub，建议把 issue 和 PR 聚焦在交互清晰度、导出安全性和本地优先体验上。

## License

仅限个人使用。

---

<div align="center">

**Batch Watermark** - 不离开浏览器，也能保持批量审核速度。

</div>
