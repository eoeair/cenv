FROM ghcr.io/eoeair/cenv:base AS builder

ENV ZINE_VERSION=v0.11.1

WORKDIR /tmp

RUN apt-get update --yes && apt-get install --yes wget xz-utils && \
    wget https://github.com/kristoff-it/zine/releases/download/${ZINE_VERSION}/x86_64-linux-musl.tar.xz && \
    tar -xf x86_64-linux-musl.tar.xz 

FROM ghcr.io/eoeair/cenv:base

COPY --from=builder /tmp/zine /usr/local/bin/zine