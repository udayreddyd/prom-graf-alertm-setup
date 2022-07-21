sudo apt-get update
sudo apt-get install -y apache2
curl localhost:80
sudo useradd -M -r -s /bin/false apache_exporter
wget https://github.com/Lusitaniae/apache_exporter/releases/download/v0.7.0/apache_exporter-0.7.0.linux-amd64.tar.gz
tar xvfz apache_exporter-0.7.0.linux-amd64.tar.gz
sudo cp apache_exporter-0.7.0.linux-amd64/apache_exporter /usr/local/bin/
sudo chown apache_exporter:apache_exporter /usr/local/bin/apache_exporter
cp apache_exporter.service /etc/systemd/system/apache_exporter.service
sudo systemctl enable apache_exporter
sudo systemctl start apache_exporter
sudo systemctl status apache_exporter
