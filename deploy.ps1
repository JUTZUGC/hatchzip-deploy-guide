# HatchZip 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/xevrion/hatchzip/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

irm https://raw.githubusercontent.com/xevrion/hatchzip/main/install.ps1 | iex
if (-not (Get-Command hatchzip -ErrorAction SilentlyContinue)) { throw '安装后没找到 hatchzip，请重开终端或检查 PATH' }
Write-Host '安装完成：运行 hatchzip --help 查看命令，或右键压缩包选 HatchZip'

Write-Host ''

Write-Host '安装完成：运行 hatchzip --help 查看命令；右键压缩包选 HatchZip 即可原地解压'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/xevrion/hatchzip/blob/main/README.md'
