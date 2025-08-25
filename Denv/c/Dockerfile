FROM ghcr.io/eoeair/cenv:base

RUN apt-get update --yes && apt-get install --yes --no-install-recommends gcc libc6-dev make && \
    apt-get clean && rm -rf /var/lib/apt/lists/*