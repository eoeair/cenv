FROM ghcr.io/eoeair/cenv:debian

# install mpremote
RUN apt-get update --yes && apt-get install --yes --no-install-recommends picocom python3-pip && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo '[global]\nindex-url = https://mirrors.ustc.edu.cn/pypi/web/simple' >  /etc/pip.conf && \
    pip install mpremote mpy-cross --break-system-packages