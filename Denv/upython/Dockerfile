FROM ghcr.io/eoeair/cenv:alpine

# install mpremote
RUN apk add --no-cache py3-pip picocom && pip install mpremote --break-system-packages && pip cache purge