# Install dnsmasq.
sudo apt-get install dnsmasq -y


# Assign eth0 an IP address. Open /etc/dhcpcd.conf with a text editor and add this at the bottom.
interface eth0
static ip_address=192.168.4.1/24

# Save original dnsmasq.conf
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

# Open /etc/dnsmasq.conf with a text editor and add this
interface=eth0
dhcp-range=192.168.4.8,192.168.4.250,255.255.255.0,12h
# Edit /etc/sysctl.conf and uncomment
# net.ipv4.ip_forward=1

# Open /etc/rc.local with a text editor and add this just above "exit 0"
iptables -t nat -A  POSTROUTING -o wlan0 -j MASQUERADE

#Reboot the system
sudo reboot.

#checking the status of Dnsmasq
# sudo service dnsmasq status
