FROM eoelab.org:1027/ben0i0d/cenv:base

USER root

ENV PATH="/opt/base/bin:${PATH}"

# install python 
RUN apt-get update --yes && apt-get install --yes --no-install-recommends python3-venv && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/base && \
    echo '[global]\nindex-url = https://mirrors.bfsu.edu.cn/pypi/web/simple' >  /etc/pip.conf

WORKDIR "${HOME}"
