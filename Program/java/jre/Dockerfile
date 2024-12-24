FROM eoelab.org:1027/eoeair/cenv:base

USER root

RUN apt-get update --yes && apt-get install --yes --no-install-recommends default-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/*
