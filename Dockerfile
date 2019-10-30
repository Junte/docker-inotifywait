FROM debian:8

ARG DOCKER_CLI_VERSION="18.06.3-ce"
ENV DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

RUN apt-get update \
    && apt-get install -y --no-install-recommends  \
                            inotify-tools \
                            curl \
    && curl --insecure -L $DOWNLOAD_URL | tar -xz docker \
    && mv docker/docker /usr/local/bin/docker \
    && apt remove --purge -y curl \
    && apt-get autoremove -y

COPY start.sh /start.sh

CMD ["/start.sh"]