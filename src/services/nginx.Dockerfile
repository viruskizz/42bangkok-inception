FROM debian:11.6-slim

RUN apt-get update \
    && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y nginx

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

# command
# docker build -t nginx -f nginx.Dockerfile .
# docker run -it --rm -d -p 8080:80 --name web nginx
