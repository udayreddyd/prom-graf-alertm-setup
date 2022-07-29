sudo yum install -y git
sudo apt-get update
sudo apt-get install -y apache2
curl localhost:80
sudo useradd -M -r -s /bin/false apache_exporter
cd /home/opc/
wget https://github.com/Lusitaniae/apache_exporter/releases/download/v0.7.0/apache_exporter-0.7.0.linux-amd64.tar.gz
tar xvfz /home/opc/apache_exporter-0.7.0.linux-amd64.tar.gz
sudo cp /home/opc/apache_exporter-0.7.0.linux-amd64/apache_exporter /usr/local/bin/
sudo chown apache_exporter:apache_exporter /usr/local/bin/apache_exporter
sudo cp /home/opc/prom-graf-alertm-setup/apache_exporter.service /etc/systemd/system/apache_exporter.service
sudo systemctl enable apache_exporter
sudo systemctl start apache_exporter
sudo systemctl status apache_exporter
sudo firewall-cmd --zone=public --add-port=9090/tcp --permanent
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --zone=public --add-port=7676/tcp --permanent
sudo firewall-cmd --zone=public --add-port=9093/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
