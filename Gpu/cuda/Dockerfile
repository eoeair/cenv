FROM ghcr.io/eoeair/cenv:debian12

# Install cuda repo
RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb && \
    apt install --yes ./cuda-keyring_1.1-1_all.deb && \
    rm cuda-keyring_1.1-1_all.deb