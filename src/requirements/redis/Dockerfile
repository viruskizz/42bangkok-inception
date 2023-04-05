FROM debian:buster-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    locales \
    curl \
    less \
    ca-certificates \
    gpg \
    coreutils \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

EXPOSE 6379

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    redis-server

COPY ./conf/redis.conf /etc/redis

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]

# docker build -t redis .
# docker run --rm -it redis sh
# docker run -d redis redis -p 6379:6379
