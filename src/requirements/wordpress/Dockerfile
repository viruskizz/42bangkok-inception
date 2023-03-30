FROM debian:11.6-slim

RUN apt-get update \
    && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
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

COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

RUN mkdir -p /var/www; \
	mkdir -p /var/www/html

STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD /usr/sbin/php-fpm7.4 -F -R

# command
# docker build -t wordpress -f Dockerfile .
# docker run -it --rm -d -p 9000:9000 --name=wordpress -v html:/var/www/html wordpress
# docker exec -it web sh
