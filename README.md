# Cenv

**ghcr.io: https://github.com/eoeair/cenv/pkgs/container/cenv**

## Platform
* OS : 
    * debian 13
    * alpine latest
* ARCH : x86_64

## Usage
### container
* just `docker run -it`
### devcontainer(VScode)
`cp -r .devcontainer WORKSDIR`

## Image dependencies
* `Denv` : development environment
* `Renv`: runtime environment

```mermaid
graph LR
Debian-->B{Base}
Alpine-->B

B-->D{Denv}
D-->DA(C)
D-->DB(Cpp)
D-->DC(Python)
D-->DD(Zig)

B-->R{RENV}
R-->RA(Zine)
R-->RB(steam)
R-->RC{MC}
RC-->RCA{JAVA}
RC-->RCB(BE)
RCA-->RCAA(JRE_17)
RCA-->RCAB(JRE_21)
```

## Mirror source
* debian ustc：https://mirrors.ustc.edu.cn/help/debian.html