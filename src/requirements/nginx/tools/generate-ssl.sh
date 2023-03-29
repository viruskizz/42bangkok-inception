#!bin/bash
DOMIAN_NAME="tsomsa.42.fr"

sudo openssl dhparam \
    -out ./certs/dhparam.pem 2048

openssl genrsa \
    -out /certs/${DOMIAN_NAME}-signed.key 2048

openssl req \
    -new \
    -key /certs/${DOMIAN_NAME}-signed.key \
    -out /certs/${DOMIAN_NAME}-signed.csr

openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /certs/${DOMIAN_NAME}-signed.key \
    -out /certs/${DOMIAN_NAME}-signed.crt
