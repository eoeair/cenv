FROM eoelab.org:1027/ben0i0d/cenv:base

USER root

# INSTALL R+IRkernel
RUN apt-get update && apt-get install --yes --no-install-recommends r-base&& apt-get clean && rm -rf /var/lib/apt/lists/* && \
# set cran mirror    
    echo 'options(repos=c(USTC="https://mirrors.ustc.edu.cn/CRAN/"))' >> /usr/lib/R/library/base/R/Rprofile
