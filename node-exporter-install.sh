sudo yum install -y git
sudo useradd -M -r -s /bin/false node_exporter
cd /home/opc/
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xvfz node_exporter-0.18.1.linux-amd64.tar.gz
sudo cp /home/opc/node_exporter-0.18.1.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo cp /home/opc/prom-graf-alertm-setup/node_exporter.service /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
sudo systemctl enable node_exporter
#curl localhost:9100/metrics
sudo firewall-cmd --zone=public --add-port=9090/tcp --permanent
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --zone=public --add-port=7676/tcp --permanent
sudo firewall-cmd --zone=public --add-port=9093/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
