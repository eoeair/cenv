FROM eoelab.org:1027/ben0i0d/cenv:steam

RUN apt-get update --yes && apt-get install --yes --no-install-recommends wine && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 
