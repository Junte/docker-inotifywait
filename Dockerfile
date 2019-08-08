FROM alpine:3.7

ARG DOCKER_CLI_VERSION="18.06.3-ce"
ENV DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

RUN apk --no-cache add inotify-tools curl \
    && curl -L $DOWNLOAD_URL | tar -xz docker \
    && mv docker/docker /usr/local/bin/docker

COPY start.sh /start.sh

CMD ["/start.sh"]