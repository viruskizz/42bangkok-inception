#!bin/bash
# https://linuxopsys.com/topics/install-vsftpd-ftp-server-on-debian
# https://github.com/garethflowers/docker-ftp-server

if [ -z $(getent passwd | grep $FT_USER) ];then

adduser --disabled-password --gecos "" $FT_USER
echo "$FT_USER:$FT_PASS" | chpasswd

mkdir -p /var/www/html/wordpress
chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress
chmod 777 -R /var/www/html/wordpress
mkdir -p /var/run/vsftpd/empty

echo "$FT_USER" | tee -a /etc/vsftpd.chroot_list > /dev/null

fi

touch /var/log/vsftpd.log
touch /var/log/xferlog