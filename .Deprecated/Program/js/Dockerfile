FROM ghcr.io/eoeair/cenv:base

RUN apt-get update --yes && apt-get install --yes --no-install-recommends nodejs npm && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    npm config set registry https://registry.npmmirror.com