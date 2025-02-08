FROM debian:bookworm-slim

USER root

# Configure environment
ENV DEBIAN_FRONTEND=noninteractive \
    # avoid some mistake, e.g. "jill"
    HOME="/root" 

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources 