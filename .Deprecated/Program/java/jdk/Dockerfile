FROM ghcr.io/eoeair/cenv:base

USER root

RUN apt-get update --yes && apt-get install --yes --no-install-recommends default-jdk-headless && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR "${HOME}"