FROM ghcr.io/eoeair/cenv:base AS builder

ENV VERSION=0.14.1

RUN apt-get update --yes && apt-get install --yes wget xz-utils && \
    wget -q https://ziglang.org/download/0.14.1/zig-x86_64-linux-$VERSION.tar.xz && \
    tar -xf zig-x86_64-linux-$VERSION.tar.xz && \
    mv zig-x86_64-linux-$VERSION /opt/zig

FROM ghcr.io/eoeair/cenv:base

COPY --from=builder /opt/zig /opt/zig

ENV PATH="/opt/zig:${PATH}"
# install xz-utils for extract zls
RUN apt-get update --yes && apt-get install --yes xz-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "-g", "--"]
CMD ["bash"]