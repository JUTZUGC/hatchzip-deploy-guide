#!/usr/bin/env bash
set -euo pipefail
# HatchZip 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/xevrion/hatchzip/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fsSL https://raw.githubusercontent.com/xevrion/hatchzip/main/install.sh | sh
command -v hatchzip >/dev/null 2>&1 || { echo "安装后没找到 hatchzip，请重开终端或检查 PATH"; exit 1; }
echo "安装完成：运行 hatchzip --help 查看命令，或右键压缩包选 HatchZip"

echo ""

echo "安装完成：运行 hatchzip --help 查看命令；右键压缩包选 HatchZip 即可原地解压"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/xevrion/hatchzip/blob/main/README.md"
