#!bin/bash
YELLOW="\e[33m"
RESET="\e[0m"

alias wp="wp --allow-root --quiet"

if [ ! -f wp-config.php ]; then

  wp config create \
    --dbhost="$DB_HOST" \
    --dbname="$DB_NAME" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --force \
    --allow-root

  wp db create \
    --allow-root
  wp core install \
    --url="$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_name="$WP_ADMIN" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --allow-root
  wp user create \
    "$WP_USER" \
    "$WP_USER_EMAIL" \
    --role=author \
    --user_pass="$WP_USER_PASSWORD" \
    --allow-root \
    --quiet
  wp option update siteurl "$WP_SCHEME://tsomsa.42.fr:$WP_PORT" --allow-root
  wp option update home "$WP_SCHEME://tsomsa.42.fr:$WP_PORT" --allow-root
fi

echo $YELLOW"Wordpress Started"$RESET