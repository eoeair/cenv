FROM eoelab.org:1027/eoeair/cenv:base AS builder

USER root

WORKDIR /opt

# Download Java
# Download Node.js
# Download MCSManager
# wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz
RUN apt-get update --yes && apt-get install --yes xz-utils gnupg curl wget && \
    curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list && \
    apt-get update --yes && apt-get install --yes --no-install-recommends zulu17-ca-jre-headless && \
    wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz && \
    tar -xvf node-v20.11.0-linux-x64.tar.xz && rm node-v20.11.0-linux-x64.tar.xz && \
    cd mcsm && tar -zxf mcsmanager_linux_release.tar.gz && rm mcsmanager_linux_release.tar.gz

FROM eoelab.org:1027/eoeair/cenv:base

EXPOSE 24444

USER root

COPY --from=builder /opt/ /opt/
COPY --from=builder /usr/lib/jvm/ /usr/lib/jvm/

RUN apt-get update --yes && apt-get install --yes --no-install-recommends zip unzip && apt-get clean && rm -rf /var/lib/apt/lists/* && \
# Add Node.js to system PATH
    ln -s /opt/node-v20.11.0-linux-x64/bin/node /usr/bin/node && ln -s /opt/node-v20.11.0-linux-x64/bin/npm /usr/bin/npm && \
    ln -s /usr/lib/jvm/zulu17/bin/java /usr/bin/java && \
    cd /opt/mcsm/daemon && npm i --production --registry=https://registry.npmmirror.com

WORKDIR /opt/mcsm/daemon

CMD node app.js
