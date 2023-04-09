
cd $HOME
wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-amd64.tar.gz
tar xvfz prometheus-2.37.6.linux-amd64.tar.gz
rm prometheus-2.37.6.linux-amd64.tar.gz
mv prometheus-2.37.6.linux-amd64 prometheus

mv prometheus /etc

mkdir -p /data/prometheus
chown prometheus:prometheus /data/prometheus /etc/prometheus/*

ln -s /etc/prometheus/prometheus /usr/bin/prometheus