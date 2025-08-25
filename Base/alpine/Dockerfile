FROM alpine:latest

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    # Install tini for process management
    apk add --no-cache tini openssh-server nano && \
    # generate host keys
    ssh-keygen -A && \
    # Create necessary dir&file
    mkdir -p /root/.ssh &&  touch /root/.ssh/authorized_keys

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["sh"]