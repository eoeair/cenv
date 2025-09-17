FROM debian:bookworm-slim

USER root

# Configure environment
ENV DEBIAN_FRONTEND=noninteractive \
    PATH="/opt/base/bin:${PATH}"  \
    LD_LIBRARY_PATH=/opt/rocm/lib:$LD_LIBRARY_PATH 

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    # Install tini for process management
    apt-get update --yes && apt-get install --yes --no-install-recommends tini openssh-server nano && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # Create necessary dir&file
    mkdir -p /root/.ssh &&  touch /root/.ssh/authorized_keys

# install venv
RUN apt-get update --yes && apt-get install --yes --no-install-recommends python3-venv && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/base && \
    echo '[global]\nindex-url = https://mirrors.ustc.edu.cn/pypi/web/simple' >  /etc/pip.conf

# Install ROCm dependencies
RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://repo.radeon.com/amdgpu-install/7.0/ubuntu/jammy/amdgpu-install_7.0.70000-1_all.deb && \
    apt install --yes ./amdgpu-install_7.0.70000-1_all.deb && \
    rm amdgpu-install_7.0.70000-1_all.deb

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["bash"]