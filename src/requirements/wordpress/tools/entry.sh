#!bin/bash
DIR="/run/php"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  rm -rf "$DIR"
else
  mkdir "$DIR"
fi

/usr/sbin/php-fpm7.4 -F -R