#!bin/bash
# https://linuxopsys.com/topics/install-vsftpd-ftp-server-on-debian
adduser --disabled-password --gecos "" ftpuser
mkdir -p /home/ftpuser/ftp_dir/upload
echo "ftpuser:1234" | chpasswd
mkdir -p /home/ftpuser/ftp_dir/upload
chmod 550 /home/ftpuser/ftp_dir
chmod -R 750 /home/ftpuser/ftp_dir/upload
chown -R "ftpuser:" /home/ftpuser/ftp_dir

mkdir -p /var/run/vsftpd/empty

touch /var/log/vsftpd.log
tail -f /var/log/vsftpd.log | tee /dev/stdout &
touch /var/log/xferlog
tail -f /var/log/xferlog | tee /dev/stdout &