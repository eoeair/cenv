FROM ghcr.io/eoeair/cenv:alpine

ENV ZIG_VERSION=0.15.1 \
    PATH="/opt/zig:${PATH}"

RUN wget https://ziglang.org/download/${ZIG_VERSION}/zig-x86_64-linux-${ZIG_VERSION}.tar.xz && \
    tar -xf zig-x86_64-linux-${ZIG_VERSION}.tar.xz && \
    mv zig-x86_64-linux-${ZIG_VERSION} /opt/zig