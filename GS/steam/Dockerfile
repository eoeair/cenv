FROM ghcr.io/eoeair/cenv:base

# Configure environment
ENV USER=steam \
    UID=1000 \
    GID=100 \
    HOME="/home/steam"

RUN sed -i 's/main/main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    dpkg --add-architecture i386 && \
    apt-get update --yes && apt-get install --yes steamcmd ca-certificates gosu && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # Create user
    useradd --no-log-init --create-home --shell /bin/bash --uid "${UID}" --no-user-group "${USER}" && \
    ln -s /usr/games/steamcmd /usr/bin/steamcmd && \
    steamcmd +login anonymous +quit