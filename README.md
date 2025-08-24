# Cenv

**ghcr.io: https://github.com/eoeair/cenv/pkgs/container/cenv**

## Platform
* OS : debian 13
* ARCH : x86_64

## Usage
### container
* just `docker run -it`
### devcontainer(VScode)
`cp -r .devcontainer WORKSDIR`

## Image dependencies
* `Program` : development environment, primarily serving the devcontainer.
* `GS` : game server
* `Renv`: runtime environment

```mermaid
graph LR

Base-->G{GS}-->GA{MC}
G-->GB(steam)
GA{MC}-->GAA{JAVA}
GA{MC}-->GAB(BE)
GAA-->GAC(JRE_17)
GAA-->GAD(JRE_21)

Base-->P{PROGRAM}
P-->PA(C)
P-->PB(Cpp)
P-->PC(Python)
P-->PD(Zig)

Base-->R{RENV}
R-->RA(Zine)
```

## Mirror source
* debian ustc：https://mirrors.ustc.edu.cn/help/debian.html