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
    && apt-get install --no-install-recommends --no-install-suggests -y \
    mariadb-client \
    redis-tools

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    php \
    php-fpm \
    php-cli \
    php-json \
    php-common \
    php-mysql \
    php-zip \
    php-gd \
    php-mbstring \
    php-curl \
    php-xml \
    php-bcmath

COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/my.cnf /etc/my.cnf

COPY ./tools /root/tools
RUN chmod +x /root/tools/*.sh

RUN /root/tools/wp-setup.sh

RUN /root/tools/adminer.sh

STOPSIGNAL SIGQUIT

EXPOSE 9000

WORKDIR /var/www/html/wordpress

ENTRYPOINT [ "sh", "/root/tools/docker-entrypoint.sh" ]

# command
# docker build -t wordpress -f Dockerfile .
# docker run -d -p 9000:9000 --name=wordpress -v wordpress:/var/www/html/wordpress wordpress
# docker exec -it web sh
