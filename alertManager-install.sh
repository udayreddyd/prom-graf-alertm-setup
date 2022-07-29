sudo yum install -y git
sudo useradd -M -r -s /bin/false alertmanager
cd /home/opc/
wget https://github.com/prometheus/alertmanager/releases/download/v0.20.0/alertmanager-0.20.0.linux-amd64.tar.gz
tar xvfz alertmanager-0.20.0.linux-amd64.tar.gz
sudo cp /home/opc/alertmanager-0.20.0.linux-amd64/{alertmanager,amtool} /usr/local/bin/
sudo chown alertmanager:alertmanager /usr/local/bin/{alertmanager,amtool}
sudo mkdir -p /etc/alertmanager
sudo cp /home/opc/alertmanager-0.20.0.linux-amd64/alertmanager.yml /etc/alertmanager
sudo chown -R alertmanager:alertmanager /etc/alertmanager
sudo mkdir -p /var/lib/alertmanager
sudo chown alertmanager:alertmanager /var/lib/alertmanager
sudo mkdir -p /etc/amtool
sudo cp /home/opc/prom-graf-alertm-setup/config.yml /var/lib/alertmanager/
sudo cp /home/opc/prom-graf-alertm-setup/alertmanager.service /etc/systemd/system/alertmanager.service
sudo systemctl enable alertmanager
sudo systemctl start alertmanager
sudo systemctl status alertmanager
##Prometheus
sudo firewall-cmd --zone=public --add-port=9090/tcp --permanent
##Grafana
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
##NodeExporter
sudo firewall-cmd --zone=public --add-port=9100/tcp --permanent
##Alert Manager
sudo firewall-cmd --zone=public --add-port=9093/tcp --permanent
sudo firewall-cmd --reload
sudo rm -rf /home/opc/alertmanager-0.20.0.linux-amd64.tar.gz
sudo rm -rf /home/opc/alertmanager-0.20.0.linux-amd64
