FROM eoelab.org:1027/ben0i0d/cenv:cuda_runtime

ARG NV_CUDA_LIB_VERSION=12.4.1-1 \
    NV_CUDA_CUDART_DEV_VERSION=12.4.127-1 \
    NV_NVML_DEV_VERSION=12.4.127-1 \
    NV_LIBCUSPARSE_DEV_VERSION=12.3.1.170-1 \
    NV_LIBNPP_DEV_PACKAGE="libnpp-dev-12-4=12.2.5.30-1" \
    NV_LIBCUBLAS_DEV_PACKAGE_NAME=libcublas-dev-12-4 \
    NV_LIBCUBLAS_DEV_PACKAGE="libcublas-dev-12-4=12.4.5.8-1" \
    NV_CUDA_NSIGHT_COMPUTE_DEV_PACKAGE="cuda-nsight-compute-12-4=12.4.1-1" \
    NV_NVPROF_DEV_PACKAGE="cuda-nvprof-12-4=12.4.127-1" \
    NV_LIBNCCL_DEV_PACKAGE_NAME=libnccl-dev \
    NV_LIBNCCL_DEV_PACKAGE="libnccl-dev=2.21.5-1+cuda12.4"

ENV LIBRARY_PATH=/usr/local/cuda/lib64/stubs:$LIBRARY_PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-cudart-dev-12-4=${NV_CUDA_CUDART_DEV_VERSION} \
        cuda-command-line-tools-12-4=${NV_CUDA_LIB_VERSION} \
        cuda-minimal-build-12-4=${NV_CUDA_LIB_VERSION} \
        cuda-libraries-dev-12-4=${NV_CUDA_LIB_VERSION} \
        cuda-nvml-dev-12-4=${NV_NVML_DEV_VERSION} \
        ${NV_NVPROF_DEV_PACKAGE} \
        ${NV_LIBNPP_DEV_PACKAGE} \
        libcusparse-dev-12-4=${NV_LIBCUSPARSE_DEV_VERSION} \
        ${NV_LIBCUBLAS_DEV_PACKAGE} \
        ${NV_LIBNCCL_DEV_PACKAGE} \
        ${NV_CUDA_NSIGHT_COMPUTE_DEV_PACKAGE} &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*  && \
# Keep apt from auto upgrading the cublas and nccl packages. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
    apt-mark hold ${NV_LIBCUBLAS_DEV_PACKAGE_NAME} ${NV_LIBNCCL_DEV_PACKAGE_NAME}
