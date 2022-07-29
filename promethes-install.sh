sudo yum install -y git
cd /home/opc/
curl -LO url -LO https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz
tar -xvf prometheus-2.37.0.linux-amd64.tar.gz
mkdir -p /home/opc/prometheus-files/
cp -rf /home/opc/prometheus-2.37.0.linux-amd64/ /home/opc/prometheus-files/
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus
sudo cp /home/opc/prometheus-files/prometheus-2.37.0.linux-amd64/prometheus /usr/local/bin/
sudo cp /home/opc/prometheus-files/prometheus-2.37.0.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo cp /home/opc/prom-graf-alertm-setup/prometheus.yml /etc/prometheus/
sudo cp /home/opc/prom-graf-alertm-setup/prometheus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl status prometheus
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
sudo rm -rf /home/opc/prometheus-2.37.0.linux-amd64.tar.gz
