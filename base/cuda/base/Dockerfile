FROM ghcr.io/eoeair/cenv:base

ARG NV_CUDA_CUDART_VERSION=12.4.127-1 \
    NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-4 \
    NVARCH=x86_64 

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=compute,utility \
    PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH} \
    LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

RUN apt-get update && apt-get install -y --no-install-recommends gnupg2 curl ca-certificates && \
    curl -fsSLO https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/${NVARCH}/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && rm cuda-keyring_1.1-1_all.deb &&\
# # For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
    apt-get update && apt-get install -y --no-install-recommends \
        cuda-cudart-12-4=${NV_CUDA_CUDART_VERSION} \
        ${NV_CUDA_COMPAT_PACKAGE} && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
# Required for nvidia-docker v1
    echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
    
