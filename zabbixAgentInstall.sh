
sudo apt-get install zabbix-agent
sudo sh -c "openssl rand -hex 32 > /etc/zabbix/zabbix_agentd.psk"
cat /etc/zabbix/zabbix_agentd.psk
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent