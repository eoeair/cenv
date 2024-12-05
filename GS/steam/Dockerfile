FROM eoelab.org:1027/ben0i0d/cenv:base

RUN sed -i 's/main/main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    dpkg --add-architecture i386 && \
    apt-get update --yes && apt-get install --yes steamcmd ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/games/steamcmd /usr/bin/steamcmd && \
    steamcmd +login anonymous +quit
