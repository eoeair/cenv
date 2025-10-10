FROM ghcr.io/eoeair/cenv:debian

RUN apt-get update --yes && apt-get install --yes build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*