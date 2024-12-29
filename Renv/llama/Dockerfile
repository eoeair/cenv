FROM eoelab.org:1027/ben0i0d/cenv:cpp AS builder

USER root

RUN apt-get update --yes && apt-get install --yes cmake build-essential git && \
    git clone --depth 1 https://eoelab.org:1027/mirrors/llama.cpp.git && \
    cd llama.cpp && \
    cmake -B build -DBUILD_SHARED_LIBS=OFF && cmake --build build --config Release -j $(nproc) && \
    mv build/bin/* /usr/local/bin/

FROM eoelab.org:1027/ben0i0d/cenv:base

EXPOSE 80

COPY --from=builder /usr/local/bin/llama-server /usr/local/bin/llama-server

RUN apt-get update --yes && apt-get install --yes --no-install-recommends libgomp1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

HEALTHCHECK CMD [ "curl", "-f", "http://localhost:8080/health" ]

ENTRYPOINT [ "llama-server" ]

CMD ["-m", "/models/ggml-model-q4_0.gguf", "--port", "80", "--host", "0.0.0.0", "-n", "1024"]