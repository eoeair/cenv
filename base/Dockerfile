FROM debian:bookworm-slim

USER root

# Configure environment
ENV DEBIAN_FRONTEND=noninteractive 

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    # Install tini for process management
    apt-get update --yes && apt-get install --yes tini && apt-get clean && rm -rf /var/lib/apt/lists/*