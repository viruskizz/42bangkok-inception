#!bin/bash
# https://linuxopsys.com/topics/install-vsftpd-ftp-server-on-debian
# https://github.com/garethflowers/docker-ftp-server

if [ -z $(getent passwd | grep $FT_USER) ];then

adduser --disabled-password --gecos "" $FT_USER
echo "$FT_USER:$FT_PASS" | chpasswd

mkdir -p /home/$FT_USER/ftp_dir/upload
chmod 550 /home/$FT_USER/ftp_dir
chmod -R 750 /home/$FT_USER/ftp_dir/upload

chown -R "$FT_USER:" /home/$FT_USER/ftp_dir

mkdir -p /var/run/vsftpd/empty

echo "$FT_USER" | tee -a /etc/vsftpd.chroot_list > /dev/null

fi

touch /var/log/vsftpd.log
tail -f /var/log/vsftpd.log | tee /dev/stdout &
touch /var/log/xferlog
tail -f /var/log/xferlog | tee /dev/stdout &

/usr/sbin/vsftpd
