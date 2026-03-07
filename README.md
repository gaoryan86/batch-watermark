<!-- SEO: batch watermark, batch image watermark tool, local browser watermark app, macOS watermark workflow, folder-based image watermarking -->

<div align="center">

# Batch Watermark

**Batch Watermark is a local browser-based batch image watermark tool for macOS, Windows, and Chrome/Edge. Import a folder, place text watermarks fast, review incomplete images, and export safely renamed files.**

![License: Personal Use](https://img.shields.io/badge/License-Personal%20Use-lightgrey)
![Platform: macOS / Windows](https://img.shields.io/badge/Platform-macOS%20%2F%20Windows-black)
![Browser: Chrome/Edge](https://img.shields.io/badge/Browser-Chrome%20%2F%20Edge-blue)
![Dependencies: Zero](https://img.shields.io/badge/Dependencies-Zero-success)

English | [简体中文](./README.zh-CN.md)

</div>

---

## Why Batch Watermark?

| Problem | What Batch Watermark does |
|---------|---------------------------|
| You need to watermark many images in one session | Loads a full folder and keeps everything in one review strip |
| Manual review gets slow when you keep hunting for the next image | Jumps to the next pending image with one button or `N` |
| Exporting over originals is risky | Writes renamed outputs like `image_aicwm.jpg` |
| Browser tools often feel temporary or confusing | Keeps a clear saved/pending workflow and remembers the export folder |

> **TL;DR** - This tool is built for a local, fast, low-friction watermark workflow. Open a folder, adjust text once per image, save settings when needed, and export renamed results without leaving the browser.

## Key Features

### Review Workflow

- **Open a folder directly** - Import the current folder and sort images by filename automatically.
- **Save the current settings now** - Record the current image's watermark settings immediately when you want a manual checkpoint.
- **Jump to the next pending image** - Move through a batch quickly with the main button or `N`.

### Watermark Editing

- **Text watermark placement** - Drag text freely over the current image.
- **Font size control** - Adjust watermark size with a slider and keep it consistent.
- **Copy current settings to all images** - Reuse the current text, size, and position across the whole batch.

### Export Safety

- **Renamed output files** - Exports use `originalname_aicwm.ext` by default.
- **Collision-safe naming** - If that filename already exists, the app writes `originalname_aicwm_2.ext`, `originalname_aicwm_3.ext`, and so on.
- **Remembered export folder** - Reuses the last authorized export folder when the browser allows it.

### Usability

- **Chinese / English UI** - Switch languages from the header.
- **Spotlight launch on macOS** - Build a local `.app` launcher with one script.
- **Double-click launch on Windows** - Open the app with the included `.cmd` launcher.
- **Local-only processing** - No upload, no server, no cloud dependency.

## Data Safety / How It Works

```text
Image folder / files
        |
        v
batch-watermark.html in your browser
        |
        +--> Watermark edits stay in memory during the session
        |
        +--> Export writes only to the folder you authorize
        |
        v
Renamed output files such as image_aicwm.jpg
```

- All image handling happens locally in the browser.
- The app does not send files to any remote service.
- Export access depends on the browser's local folder permission model.

## Quick Start

```bash
cd batch-watermark
open batch-watermark.html
```

Optional macOS launcher:

```bash
./build-mac-app.sh
```

Then search `Batch Watermark` in Spotlight.

Windows launcher:

```bat
Launch Batch Watermark.cmd
```

Double-click it in File Explorer to open `batch-watermark.html` in the default browser.

## Example Workflow

```text
1. Open Folder
2. Adjust text, size, and position
3. Save the current settings now if you want a manual checkpoint
4. Press N to jump to the next pending image
5. Export saved images

Example output:
party_12.jpeg -> party_12_aicwm.jpeg
party_12_aicwm.jpeg already exists -> party_12_aicwm_2.jpeg
```

## Requirements

- macOS or Windows
- Chrome 86+ or Edge 86+ for File System Access API
- Local image files: JPEG, PNG, WebP, GIF, BMP, AVIF

## Configuration

| Item | Default | Description |
|------|---------|-------------|
| Interface language | Auto-detect browser language | Switch manually in the header |
| Default watermark size | `24` | Starting font size for new watermarks |
| Default export path display | `/Users/Ryansmac/Downloads/watermark_ai_character/output_ai_character` | Initial suggested export location |
| Output naming rule | `_aicwm` suffix | Prevents accidental overwrite of source filenames |

## Architecture

```text
batch-watermark/
├── batch-watermark.html
├── build-mac-app.sh
├── Launch Batch Watermark.cmd
├── README.md
└── README.zh-CN.md
```

- `batch-watermark.html` is the full app: UI, logic, export flow, and language switching.
- `build-mac-app.sh` builds a Spotlight-launchable macOS app wrapper.
- `Launch Batch Watermark.cmd` opens the app from Windows with a double-click.
- The project has no runtime dependencies or backend services.

## Use Cases

- Reviewing and watermarking AI-generated character images
- Batch labeling internal preview images before sharing
- Adding lightweight text marks to a local image folder
- Fast human review where only a few images need manual adjustment
- Mac-based creator workflows that should stay fully local

## FAQ

<details>
<summary>What does "Save Current Settings Now" mean?</summary>

It stores the current image's watermark text, position, and size right away. Switching images, jumping ahead, or exporting also saves the current edits automatically.

</details>

<details>
<summary>What does "Next Pending Image" mean?</summary>

It jumps to the next image that does not have saved watermark settings yet. This is useful when reviewing a large folder quickly.

</details>

<details>
<summary>What does "Copy Current Settings to All Images" do?</summary>

It copies the current image's watermark text, size, and position to every image in the current batch. Existing saved settings on other images will be overwritten.

</details>

<details>
<summary>Does the app overwrite my original image files?</summary>

No. Exported files are renamed with the `_aicwm` suffix. If that output filename already exists, the app creates a numbered version instead.

</details>

<details>
<summary>Why do I still need to authorize an export folder?</summary>

Because the app runs in the browser, writing files requires local folder permission from Chrome or Edge. The tool remembers the folder when the browser allows it.

</details>

## Contributing

This project is currently a focused local utility. If you plan to publish it on GitHub, keep issues and pull requests centered on workflow clarity, export safety, and local-first behavior.

## License

Personal use only.

---

<div align="center">

**Batch Watermark** - Batch review speed without leaving your browser.

</div>
