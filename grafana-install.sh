sudo yum install -y git
cd /home/opc/
wget https://dl.grafana.com/oss/release/grafana-8.1.5-1.x86_64.rpm
sudo yum install -y grafana-8.1.5-1.x86_64.rpm
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
sudo systemctl status grafana-server
##Prometheus
sudo firewall-cmd --zone=public --add-port=9090/tcp --permanent
##Grafana
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
##NodeExporter
sudo firewall-cmd --zone=public --add-port=7676/tcp --permanent
##Alert Manager
sudo firewall-cmd --zone=public --add-port=9093/tcp --permanent
##Apache
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
