FROM ghcr.io/eoeair/cenv:base AS builder

USER root

RUN apt-get update --yes && apt-get install --yes gnupg curl && \
    curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list && \
    apt-get update --yes && apt-get install --yes --no-install-recommends zulu21-ca-jre-headless  

FROM ghcr.io/eoeair/cenv:base

COPY --from=builder /usr/lib/jvm/zulu21/ /usr/lib/jvm/zulu21/

USER root

ENV JVM_XMS=1G \
    JVM_XMX=2G

WORKDIR /workspace

RUN ln -s /usr/lib/jvm/zulu21/bin/java /usr/bin/java && \
    mkdir -p /workspace

# Configure container startup
ENTRYPOINT ["tini", "-g", "--", "sh", "-c"]
CMD ["java -jar -Xms${JVM_XMS} -Xmx${JVM_XMX} server.jar nogui"]

