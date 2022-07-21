sudo useradd -M -r -s /bin/false alertmanager
wget https://github.com/prometheus/alertmanager/releases/download/v0.20.0/alertmanager-0.20.0.linux-amd64.tar.gz
tar xvfz alertmanager-0.20.0.linux-amd64.tar.gz
sudo cp alertmanager-0.20.0.linux-amd64/{alertmanager,amtool} /usr/local/bin/
sudo chown alertmanager:alertmanager /usr/local/bin/{alertmanager,amtool}
sudo mkdir -p /etc/alertmanager
sudo cp alertmanager-0.20.0.linux-amd64/alertmanager.yml /etc/alertmanager
sudo chown -R alertmanager:alertmanager /etc/alertmanager
sudo mkdir -p /var/lib/alertmanager
sudo chown alertmanager:alertmanager /var/lib/alertmanager
sudo mkdir -p /etc/amtool
###add config file
cp alertmanager.service /etc/systemd/system/alertmanager.service
sudo systemctl enable alertmanager
sudo systemctl start alertmanager
sudo systemctl status alertmanager
