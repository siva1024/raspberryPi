################################################
## SSL installation from certbot
################################################

wget https://dl.eff.org/certbot-auto
sudo mv certbot-auto /usr/local/bin/certbot-auto
sudo chown root /usr/local/bin/certbot-auto
sudo chmod 0755 /usr/local/bin/certbot-auto
sudo rm -rf /etc/pip.conf
sudo /usr/local/bin/certbot-auto certonly --nginx
echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && /usr/local/bin/certbot-auto renew -q" | sudo tee -a /etc/crontab > /dev/null
echo "#################################################"
echo "Back up the file in the location /etc/letsencrypt"