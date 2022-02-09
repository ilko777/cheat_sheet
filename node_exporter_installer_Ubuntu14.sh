#!/bin/bash
wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
tar -xf node_exporter-1.2.2.linux-amd64.tar.gz
sudo mv node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin
rm -r node_exporter-1.2.2.linux-amd64*
sudo useradd -rs /bin/false node_exporter
sudo cat > /etc/init/node_exporter.conf <<EOF
start on startup

script
   /usr/bin/node_exporter
end script

EOF

sudo service node_exporter start
