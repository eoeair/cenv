FROM ghcr.io/eoeair/cenv:cuda_base

ARG NV_CUDA_LIB_VERSION=12.4.1-1 \
    NV_NVTX_VERSION=12.4.127-1 \
    NV_LIBNPP_PACKAGE="libnpp-12-4=12.2.5.30-1" \
    NV_LIBCUSPARSE_VERSION=12.3.1.170-1 \
    NV_LIBCUBLAS_PACKAGE_NAME=libcublas-12-4 \
    NV_LIBCUBLAS_PACKAGE="libcublas-12-4=12.4.5.8-1" \
    NV_LIBNCCL_PACKAGE_NAME=libnccl2 \
    NV_LIBNCCL_PACKAGE="libnccl2=2.21.5-1+cuda12.4"

# Add entrypoint items
COPY entrypoint.d/ /opt/nvidia/entrypoint.d/
COPY nvidia_entrypoint.sh /opt/nvidia/

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-libraries-12-4=${NV_CUDA_LIB_VERSION} \
        ${NV_LIBNPP_PACKAGE} \
        cuda-nvtx-12-4=${NV_NVTX_VERSION} \
        libcusparse-12-4=${NV_LIBCUSPARSE_VERSION} \
        ${NV_LIBCUBLAS_PACKAGE} \
        ${NV_LIBNCCL_PACKAGE} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*  && \
    # Keep apt from auto upgrading the cublas and nccl packages. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
    apt-mark hold ${NV_LIBCUBLAS_PACKAGE_NAME} ${NV_LIBNCCL_PACKAGE_NAME}

ENTRYPOINT ["/opt/nvidia/nvidia_entrypoint.sh"]