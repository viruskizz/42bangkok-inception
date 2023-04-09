FROM debian:buster-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    locales \
    curl \
    less \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8


RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools            /root/tools

RUN chmod +x /root/tools/*.sh

EXPOSE 20 21 40000-40009

ENTRYPOINT  root/tools/docker-entrypoint.sh \
            && /usr/sbin/vsftpd

