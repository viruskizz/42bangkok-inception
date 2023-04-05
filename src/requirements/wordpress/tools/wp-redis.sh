#!bin/bash
alias wp="wp --allow-root --quiet"
REDIS_HOST=$(wp config get WP_REDIS_HOST)
if [ -z $REDIS_HOST ]; then

wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT "6379"
wp config set WP_REDIS_TIMEOUT "1"
wp config set WP_REDIS_READ_TIMEOUT "1"
wp config set WP_REDIS_DATABASE "0"
# Install redis plugin
wp plugin install redis-cache --activate
wp redis enable

fi
