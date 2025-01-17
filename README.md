# Cenv
English | [中文](README_CN.md)

**THIS doc for non-CN USER**

**ghcr.io: https://github.com/eoeair/cenv/pkgs/container/cenv**

**Our Gitea: https://eoelab.org:1027/eoeair/cenv**

## Prerequisites
* CPU : nothing to do
* ROCM : amdgpu-dkms -> Docker containers share the kernel with the host OS. Therefore, the ROCm kernel-mode driver (amdgpu-dkms) must be installed on the host.
* CUDA : nvidia-container-toolkit/nvidia-docker2

## Platform
* OS : debian 12 / ubuntu 24.04(ROCM only)
* ARCH : x86_64

## Version
* cuda: 12.4
* rocm: 6.3

## Usage
### container
* CPU just `docker run -it`
* ROCM `docker run --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined IMAGE`
### devcontainer(VScode)
`cp -r .devcontainer WORKSDIR`

## Image dependencies
* `Program` : development environment, primarily serving the devcontainer.
* `Renv` : Runtime environment
* `GS` : game server
```mermaid
graph LR

CPU-->B{Base}
CUDA-->B
ROCM-->B

B-->C{Renv}
C-->CA(Hexo)
C-->CB(Jupyterlite)

B-->G{GS}-->GA{MC}-->GAA(JAVA)
GAA-->GAAA(JRE_8)
GAA-->GAAB(JRE_11)
GAA-->GAAC(JRE_17)
GAA-->GAAD(JRE_21)

G-->GB{MCSM}-->GBA(Web)
GB-->GBB(Daemon)

G-->GC(steam)-->GCA(steam_wine)

B-->P{PROGRAM}
P-->PA(C)
P-->PB(Cpp)
P-->PC(Java)
PC-->PCA(Jdk)
PC-->PCB(Jre)
P-->PD(Js)
P-->PE(Julia)
P-->PF(Python)
P-->PG(R)
```
## Upstream
* NVIDIA: https://gitlab.com/nvidia/container-images/cuda
* ROCM: https://github.com/ROCm/ROCm-docker

## Mirror source
* debian ustc：https://mirrors.ustc.edu.cn/help/debian.html
* ubuntu ustc：https://mirrors.ustc.edu.cn/help/ubuntu.html