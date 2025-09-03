FROM ghcr.io/eoeair/cenv:debian

# install micropython and mpremote
RUN apt-get update --yes && apt-get install --yes --no-install-recommends micropython-mpremote minicom && apt-get clean && rm -rf /var/lib/apt/lists/*