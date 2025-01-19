FROM eoelab.org:1027/eoeair/cenv:base

ARG VERSION=6.3.1

ENV PATH="${PATH}:/opt/rocm/bin"

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget gnupg2 && \
    wget https://repo.radeon.com/amdgpu-install/6.3.1/ubuntu/jammy/amdgpu-install_6.3.60301-1_all.deb && \
    # add ROCm
    apt-get install -y ./amdgpu-install_6.3.60301-1_all.deb && rm ./amdgpu-install_6.3.60301-1_all.deb && \
    # Install ROCm-ml-libraries
    apt-get update && apt-get update &&  apt-get install -y rocm-ml-libraries && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
