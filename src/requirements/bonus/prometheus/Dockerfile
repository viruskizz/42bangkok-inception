FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y \
    locales \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

COPY  ./tools /root/tools
RUN chmod +x /root/tools/*.sh

RUN /root/tools/setup.sh

EXPOSE 9090

ENTRYPOINT [ "prometheus", "--config.file=/etc/prometheus/prometheus.yml" ]
