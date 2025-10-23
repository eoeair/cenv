FROM ghcr.io/eoeair/cenv:debian12

# Configure environment
ENV LD_LIBRARY_PATH=/opt/rocm/lib:$LD_LIBRARY_PATH 

# Install ROCm repo
RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://repo.radeon.com/amdgpu-install/6.4.4/ubuntu/jammy/amdgpu-install_6.4.60404-1_all.deb && \
    apt install --yes ./amdgpu-install_6.4.60404-1_all.deb && \
    rm ./amdgpu-install_6.4.60404-1_all.deb