# 信号与系统实验课程 (2025 年秋)

广东工业大学信息工程学院信号与系统实验课程代码与报告

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 项目简介

本项目包含《信号与系统》课程的完整实验内容，共 4 个实验模块，涵盖 26 个实验项目。使用 MATLAB 实现信号处理、系统分析、频域分析等核心概念。

### 课程信息
- **学校：** 广东工业大学
- **学院：** 信息工程学院
- **课程：** 信号与系统
- **教师：** 刘圣海
- **实验日期：** 2025年1月
- **题目范围：** 偶数学号题目（第 (2)、(4) 小问等）

> [!important]
> 注意：不同老师布置的实验内容可能存在差异，请根据实际课程要求调整

## 快速开始

### 前置要求

- **MATLAB** R2023b 或更高版本
- 信号处理工具箱 (Signal Processing Toolbox)

### 步骤 1：生成实验图形

在 MATLAB 中运行导出脚本，自动生成所有实验图形：

```matlab
run('export_all_plots.m')
```

此脚本将：
- 扫描所有 `.m` 文件
- 自动运行包含绘图命令的脚本
- 按实验分类导出图形到 `figures/` 目录
- 支持多种图像格式（PNG、EPS、PDF、SVG）
- 创建实验报告所需的所有图像文件

### 步骤 2：生成实验报告

使用 AI 代理根据源代码和图形自动生成完整实验报告：

1. 参考 [`AGENT.md`](AGENT.md) 文件中的详细说明
2. 将 `src/` 和 `figures/` 目录提供给支持 Markdown 的 AI 代理
3. AI 将自动生成包含以下内容的专业实验报告：
   - 实验内容与目标
   - MATLAB 源代码
   - 实验结果图表
   - 基于信号处理理论的深度分析

> **提示：** AI 代理将使用中文生成符合大学课程标准的正式实验报告

### 运行单个实验（可选）

如果只想运行特定实验：

1. 打开 MATLAB
2. 进入项目根目录：
   ```matlab
   cd /path/to/signal-and-system-lab-2025
   ```
3. 进入实验目录，例如实验一：
   ```matlab
   cd src/lab1
   ```
4. 运行实验文件，例如：
   ```matlab
   run('q2_3_1_2.m')
   ```

### 文件命名规则

实验文件采用以下命名规则：
- `qX_Y_Z.m` - 第 X 章第 Y 节第 Z 题
- 示例：`q2_3_1_2.m` 表示第2章第3节第1题第(2)小问

## 实验报告生成

### 自动化报告生成

本项目采用 AI 辅助的方式生成实验报告：

1. **运行 `export_all_plots.m`** - 生成所有实验图形
2. **参考 `AGENT.md`** - 查看详细的报告生成说明
3. **使用 AI 代理** - 根据 `AGENT.md` 指示，让 AI 分析源代码和图形，自动生成完整的中文实验报告

生成的报告将包含：
- 正式的封面页（课程名称、姓名、学号、班级、日期）
- 实验内容与目标
- 完整的 MATLAB 源代码（带语法高亮）
- 所有实验结果图表
- 基于信号处理理论的专业分析
- 实验总结与学习成果

### 报告格式转换

AI 代理将生成 Markdown 格式的实验报告。如需其他格式，可使用以下工具转换：

#### 转换为 PDF
- **方法 1：使用 Typora**
  1. 在 Typora 中打开 `实验报告.md`
  2. 文件 → 导出 → PDF

- **方法 2：使用 Pandoc**
  ```bash
  pandoc 实验报告.md -o 实验报告.pdf --pdf-engine=xelatex -V CJKmainfont="SimSun"
  ```

#### 转换为 Word
- **方法 1：使用 Typora**
  1. 在 Typora 中打开 `实验报告.md`
  2. 文件 → 导出 → Word (.docx)

- **方法 2：使用 Pandoc**
  ```bash
  pandoc 实验报告.md -o 实验报告.docx
  ```

> **说明：** AI 代理仅生成 Markdown 格式的报告。PDF 和 DOCX 格式需要手动转换生成。

## 核心脚本

### `export_all_plots.m` - 图形导出脚本
- **功能：** 批量导出所有实验图形
- **特性：**
  - 自动扫描所有实验文件
  - 智能识别绘图命令（plot、stem、figure 等）
  - 按实验分类保存（figures/lab1/、lab2/ 等）
  - 支持多种图像格式（PNG、EPS、PDF、SVG）
  - 高分辨率导出 (300 DPI)
  - 兼容旧版 MATLAB

### `AGENT.md` - 报告生成指南
- **功能：** AI 代理实验报告生成指令
- **包含：**
  - 详细的角色定义和语言要求
  - 文档结构和执行逻辑
  - 实验章节生成规则
  - 学术写作风格指导

## 许可证

本项目采用 [MIT 许可证](LICENSE)。

## 贡献

欢迎提交 Issue 和 Pull Request！

### 贡献指南
1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 注意事项

1. **版本兼容性：** 建议使用 MATLAB R2023b 或更高版本
2. **实验差异：** 不同教师的实验要求可能不同，请根据实际情况调整
3. **首次使用流程：**
   - 必须先运行 `export_all_plots.m` 生成图形
   - 再根据 `AGENT.md` 指示生成实验报告
4. **GitHub 可见性：** `docs/` 和 `figures/` 目录被 `.gitignore` 隐藏，不会显示在 GitHub 上
5. **文件路径：** MATLAB 脚本中使用相对路径，请确保在项目根目录运行
6. **AI 报告生成：** 实验报告需要通过 AI 代理生成，无法直接从 GitHub 查看（因 docs 目录被隐藏）

如果这个项目对您有帮助，请给它一个星标！
