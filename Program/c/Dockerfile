FROM ghcr.io/eoeair/cenv:base

USER root

RUN apt-get update --yes && apt-get install --yes gcc gdb cmake && apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "-g", "--"]
CMD ["bash"]