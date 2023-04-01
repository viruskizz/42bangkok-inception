#!bin/bash
export SQL_ROOT_PASSWORD="1234"
# UPDATE mysql.user SET Password=PASSWORD('1234') WHERE User='root';
# # UPDATE mysql.user SET Password=PASSWORD('{$SQL_ROOT_PASSWORD}') WHERE User='root';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# DELETE FROM mysql.user WHERE User='';
# DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
# FLUSH PRIVILEGES;

# ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
service mysql start

mysql_secure_installation << EOF
n
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
y
EOF

mysql << EOF
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '';
GRANT ALL ON *.* TO 'tsomsa'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
