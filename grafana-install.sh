getenforce
vim /etc/sysconfig/selinux
Change SELINUX=enforcing to SELINUX=disabled
reboot
sudo yum install grafana
yum install fontconfig
yum install freetype*
yum install urw-fonts
sudo systemctl status grafana-server
sudo systemctl start grafana-server
systemctl enable grafana-server.service
