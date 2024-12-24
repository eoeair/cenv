FROM eoelab.org:1027/eoeair/cenv:base AS builder

USER root

WORKDIR /opt

COPY mcsmanager_linux_release.tar.gz /opt/mcsm/
# Download Node.js
# Download MCSManager
# wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz
RUN apt-get update --yes && apt-get install --yes wget xz-utils && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz && \
    tar -xvf node-v20.11.0-linux-x64.tar.xz && rm node-v20.11.0-linux-x64.tar.xz && \
    cd mcsm && tar -zxf mcsmanager_linux_release.tar.gz && rm mcsmanager_linux_release.tar.gz

FROM eoelab.org:1027/eoeair/cenv:base

EXPOSE 23333

USER root

COPY --from=builder /opt/ /opt/

# Add Node.js to system PATH
RUN ln -s /opt/node-v20.11.0-linux-x64/bin/node /usr/bin/node && ln -s /opt/node-v20.11.0-linux-x64/bin/npm /usr/bin/npm && \
    cd /opt/mcsm/web && npm i --production --registry=https://registry.npmmirror.com
    
WORKDIR /opt/mcsm/web

CMD node app.js