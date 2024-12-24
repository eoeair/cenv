FROM eoelab.org:1027/eoeair/cenv:base AS builder

USER root

RUN apt-get update --yes && apt-get install --yes  gnupg curl && \
    curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list && \
    apt-get update --yes && apt-get install --yes --no-install-recommends zulu8-ca-jre-headless  

FROM eoelab.org:1027/eoeair/cenv:base

USER root

COPY --from=builder /usr/lib/jvm/zulu8/ /usr/lib/jvm/zulu8/

RUN ln -s /usr/lib/jvm/zulu8/bin/java /usr/bin/java

