#!/bin/bash

# 确保在任何命令失败时退出
set -e

echo "🔧 构建 Base..."
podman build -t ghcr.io/eoeair/cenv:base base/cpu

echo "🔧 构建 CUDA_Base..."
podman build -t ghcr.io/eoeair/cenv:cuda_base base/cuda/base

echo "🔧 构建 CUDA_Runtime..."
podman build -t ghcr.io/eoeair/cenv:cuda_runtime base/cuda/runtime

echo "🔧 构建 CUDA_Devel..."
podman build -t ghcr.io/eoeair/cenv:cuda_devel base/cuda/devel

echo "🔧 构建 ROCM..."
podman build -t ghcr.io/eoeair/cenv:rocm base/rocm

echo "🔧 构建 C..."
podman build -t ghcr.io/eoeair/cenv:c Program/c

echo "🔧 构建 Cpp..."
podman build -t ghcr.io/eoeair/cenv:cpp Program/cpp

echo "🔧 构建 Python..."
podman build -t ghcr.io/eoeair/cenv:python Program/python

echo "🔧 构建 Zig..."
podman build -t ghcr.io/eoeair/cenv:zig Program/zig

echo "🔧 构建 MC_BE..."
podman build -t ghcr.io/eoeair/cenv:mc_be GS/mc/be

echo "🔧 构建 MC_JRE_8..."
podman build -t ghcr.io/eoeair/cenv:mc_jre_8 GS/mc/jre/8

echo "🔧 构建 MC_JRE_11..."
podman build -t ghcr.io/eoeair/cenv:mc_jre_11 GS/mc/jre/11

echo "🔧 构建 MC_JRE_17..."
podman build -t ghcr.io/eoeair/cenv:mc_jre_17 GS/mc/jre/17

echo "🔧 构建 MC_JRE_21..."
podman build -t ghcr.io/eoeair/cenv:mc_jre_21 GS/mc/jre/21

echo "🔧 构建 Steam..."
podman build -t ghcr.io/eoeair/cenv:steam GS/steam

echo "✅ 所有镜像构建完成！"
