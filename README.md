# Cenv

**ghcr.io: ghcr.io/eoeair/cenv:TAG**

## Platform
* OS: 
    * debian 13
    * alpine latest
* ARCH: x86_64
* ROCM: 7.0.1
## Container Usage
1. oci: `docker run -it`
2. devcontainer(VScode): `cp -r .devcontainer WORKDIR`

## Note
1. Denv: `git` may not be loaded on the first run. Please `Reload Window`.
    1. Press Ctrl + Shift + P (Windows/Linux) or Cmd + Shift + P (macOS) to open the Command Palette.
    2. Type `Reload Window` in the search bar.
    3. Select the `Reload Window` command.
2. C/C++ environment: `.vscode` config may not be loaded on the first run. Please `Reload Window` to ensure the configuration is loaded.
3. upython(micropython): 
    1. run `sudo usermod -aG dialout $USER` before use container, add youself to `dialout`
    2. hardware -> tty:
        * raspberry pico: `/dev/ttyACM0`
        * raspberry pi: `/dev/ttyUSB0`
    3. stub(support pylance): `pip install micropython-XXX-stubs`, search on `pypi.org`.
4. rocm: 
    1. run `sudo apt install rocminfo`
    2. run `sudo usermod -aG video,render $USER` before use container, add youself to `video`,`render`
    3. not include any package, please install what you want
    4. how to build jax wheels: this step no need availble gpu, you can run on cpu_only runner
        1. apt install git clang patchelf rocm
        2. git clone https://github.com/ROCm/rocm-jax.git
        3. cd rocm-jax
        4. git checkout rocm-jaxlib-0.6.0
        5. cd jax_rocm_plugin
        6. python3 build/build.py build --wheels=jax-rocm-plugin,jax-rocm-pjrt --rocm_version=7 --rocm_path=/opt/rocm
    5. how to run jax: jax support 0.6.x(0.6.2 is tested)
        1. apt install hipsolver hipfft miopen-hip rccl rocm-llvm rocprofiler-sdk hsa-amd-aqlprofile libamd-comgr2 libdw1  (***I just want to minimize runtime; you can absolutely do a full ROCm installation.***)
        2. pip install jax==0.6.2
        3. pip install ./jax_rocm7_pjrt-0.6.0.dev20250919-py3-none-manylinux2014_x86_64.whl
        4. pip install ./jax_rocm7_plugin-0.6.0.dev20250919-cp311-cp311-manylinux2014_x86_64.whl
    6. for china,maybe need a mirror site:
        1. run `sed -i 's/repo.radeon.com/radeon.geekery.cn/g' /etc/apt/sources.list.d/amdgpu.list`
        2. run `sed -i 's/repo.radeon.com/radeon.geekery.cn/g' /etc/apt/sources.list.d/rocm.list`
## Image dependencies
* `Denv` : development environment
* `Renv`: runtime environment
* `Gpu`: gpu environment

```mermaid
graph LR
Debian-->B{Base}
Alpine-->B

B-->G{Gpu}-->GA(Rocm)

B-->D{Denv}
D-->DA(C)
D-->DB(Cpp)
D-->DC(Python)
D-->DD(Zig)
D-->DE(Upython)

B-->R{RENV}
R-->RA(Zine)
R-->RB(Steam)
R-->RC{MC}
RC-->RCA{JAVA}
RC-->RCB(BE)
RCA-->RCAA(JRE_17)
RCA-->RCAB(JRE_21)
R-->RD(Novnc)
```

## Mirror source
* debian ustc：https://mirrors.ustc.edu.cn/help/debian.html