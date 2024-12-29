FROM eoelab.org:1027/eoeair/cenv:cpp AS builder

USER root

RUN apt-get update --yes && apt-get install --yes cmake build-essential git && \
    git clone --depth 1 https://eoelab.org:1027/mirrors/llama.cpp.git && \
    cd llama.cpp && \
    cmake -B build -DBUILD_SHARED_LIBS=OFF && cmake --build build --config Release -j $(nproc) && \
    mv build/bin/* /usr/local/bin/

FROM eoelab.org:1027/eoeair/cenv:base

EXPOSE 80

COPY --from=builder /usr/local/bin/llama-server /usr/local/bin/llama-server

RUN apt-get update --yes && apt-get install --yes --no-install-recommends libgomp1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*