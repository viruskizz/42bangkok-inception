FROM debian:11.6-slim

RUN apt-get update \
    && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    nginx

COPY conf/tsomsa.42.fr.conf /etc/nginx/conf.d
COPY conf/ssl-signed.conf   /etc/nginx/snippets/
COPY conf/ssl-params.conf   /etc/nginx/snippets/
COPY conf/dhparam.pem       /etc/nginx/dhparam.pem

COPY certs/tsomsa.42.fr-signed.key /etc/ssl/certs/private.key
COPY certs/tsomsa.42.fr-signed.crt /etc/ssl/certs/cert.crt

COPY conf/index.html /var/www/html

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

# command
# docker build -t nginx -f Dockerfile .
# docker run -it --rm -d -p 8080:80 -p 443:443 --name web nginx
