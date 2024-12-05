FROM eoelab.org:1027/ben0i0d/cenv:python AS builder

# install Julia packages in /opt/julias
RUN apt-get update --yes && apt-get install --yes --no-install-recommends gnupg && \
    pip install jill && jill install --confirm 1

FROM eoelab.org:1027/ben0i0d/cenv:base

COPY --from=builder /opt/julias/ /opt/julias/

ENV JULIA_PKG_SERVER=https://mirrors.ustc.edu.cn/julia \
    JULIA_NUM_THREADS=8

RUN ln -s "`find /opt/julias -name 'bin'`/julia" /usr/local/bin/julia 