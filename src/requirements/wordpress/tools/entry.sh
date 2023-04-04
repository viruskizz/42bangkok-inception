#!bin/bash
sed -i 's/MYSQL_USER/'"$MYSQL_USER"'/' /etc/my.cnf
sed -i 's/MYSQL_PASSWORD/'"$MYSQL_PASSWORD"'/' /etc/my.cnf
sed -i 's/DB_HOST/'"$DB_HOST"'/' /etc/my.cnf

# First Setup
# if [ ! -f wp-config.php ]; then
#   wp config create \
#     --dbhost="$DB_HOST" \
#     --dbname="$DB_NAME" \
#     --dbuser="$MYSQL_USER" \
#     --dbpass="$MYSQL_PASSWORD" \
#     --force \
#     --allow-root
#   wp db create \
#     --allow-root
#   wp core install \
#     --url="$DOMAIN_NAME" \
#     --title="$WP_TITLE" \
#     --admin_name="$WP_ADMIN" \
#     --admin_password="$WP_ADMIN_PASSWORD" \
#     --admin_email="$WP_ADMIN_EMAIL" \
#     --skip-email \
#     --allow-root
#   wp user create \
#     "$WP_USER" \
#     "$WP_USER_EMAIL" \
#     --role=author \
#     --user_pass="$WP_USER_PASSWORD" \
#     --allow-root \
#     --quiet
# fi

# Start phhp-fpm
DIR="/run/php"
if [ ! -d "$DIR" ]; then
  mkdir -p "$DIR"
fi

/usr/sbin/php-fpm7.3 -F -R