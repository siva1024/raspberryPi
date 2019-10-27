# Install dnsmasq.

sudo apt-get install dnsmasq
Assign eth0 an IP address. Open /etc/dhcpcd.conf with a text editor and add this at the bottom.
Code: Select all

interface eth0
static ip_address=192.168.4.1/24
Save original dnsmasq.conf
Code: Select all

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
Open /etc/dnsmasq.conf with a text editor and add this
Code: Select all

interface=eth0
dhcp-range=192.168.4.8,192.168.4.250,255.255.255.0,12h
Edit /etc/sysctl.conf and uncomment
Code: Select all

net.ipv4.ip_forward=1
Open /etc/rc.local with a text editor and add this just above "exit 0"
Code: Select all

iptables -t nat -A  POSTROUTING -o wlan0 -j MASQUERADE
Reboot.

If you have problems with the dhcp service, you can check the status of dnsmasq.conf.
Code: Select all

sudo service dnsmasq status
It should show active (running), and a list of IP assignments to each mac address..
