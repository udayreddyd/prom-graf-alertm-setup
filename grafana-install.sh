sudo yum install -y git
cd /home/opc/
wget https://dl.grafana.com/oss/release/grafana-8.1.5-1.x86_64.rpm
sudo yum install -y grafana-8.1.5-1.x86_64.rpm
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
sudo systemctl status grafana-server
