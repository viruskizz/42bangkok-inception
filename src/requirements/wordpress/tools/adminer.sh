#!bin/bash
mkdir -p /var/www/html/adminer
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php
chown -R www-data:www-data /var/www/html/adminer/index.php
chmod 755 /var/www/html/adminer/index.php