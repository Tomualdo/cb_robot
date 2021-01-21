mv ~/coin_real.log ~/coin_real.log.15
touch ~/coin_real.log
sudo chown syslog:adm ~/coin_real.log
sudo systemctl restart rsyslog
