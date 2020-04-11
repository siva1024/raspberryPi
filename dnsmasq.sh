# To turn off the output uncomment below line turn off the output files
#@echo off

# Check for the installation of dnsmasq.
#sudo apt-get install dnsmasq -y
echo "######################################################"
echo "Checking for the installation of dnsmasq package"

dpkg -s dnsmasq &> /dev/null
if [ $? -eq 0 ]; then 
        echo "package is installed"
else
        echo "package is not installed"
        echo "installing the package"
        sudo apt-get install dnsmasq -y
fi
echo " "



# Assign eth0 an IP address. Open /etc/dhcpcd.conf with a text editor and add this at the bottom.
#interface eth0
#static ip_address=192.168.4.1/24
echo "######################################################"
echo "Checking the dhcpcd.conf file for configuration"

if grep -Fxq "static ip_address=192.168.4.1/24" /etc/dhcpcd.conf
then
    echo "The configuration exists"
else
    echo "the configuration is not set, updating the configuration"
    sudo sed -i '/^#/!s#interface eth0#interface eth0\nstatic ip_address=192.168.4.1/24#' /etc/dhcpcd.conf
fi
echo " "



# Save original dnsmasq.conf
# Open /etc/dnsmasq.conf with a text editor and add this
#sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
#interface=eth0
#dhcp-range=192.168.4.8,192.168.4.250,255.255.255.0,12h
echo "######################################################"
echo "Checking for the backuo of dnsmasq.conf file"

if [ -f /etc/dnsmasq.conf.orig ]
then
    echo "The dnsmasq backup is already present"
else
    echo "The dnsmasq backup is not found making  backup of file"
    sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
fi
echo "Overwriting the configuration of the dnsmasq.conf file"
sudo touch /etc/dnsmasq.conf
sudo bash -c 'echo "interface=eth0" > /etc/dnsmasq.conf'
sudo bash -c 'echo "dhcp-range=192.168.4.8,192.168.4.250,255.255.255.0,12h" >> /etc/dnsmasq.conf'
echo " "



# Edit /etc/sysctl.conf and uncomment
#net.ipv4.ip_forward=1
echo "######################################################"
echo "Checking the sysctl.conf file for configuration"

if grep -Fxq "net.ipv4.ip_forward=1" /etc/sysctl.conf
then
    echo "The configuration exists"
else
    echo "the configuration is not set, updating the configuration"
    sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
fi
echo " "



# Open /etc/rc.local with a text editor and add this just above "exit 0"
#iptables -t nat -A  POSTROUTING -o wlan0 -j MASQUERADE
echo "######################################################"
echo "Checking the iptable configuration"

if grep -Fxq "iptables -t nat -A  POSTROUTING -o wlan0 -j MASQUERADE" /etc/rc.local
then
    echo "The configuration exists"
else
    echo "the configuration is not set, updating the configuration"
    sudo sed -i 's/.*exit 0.*/iptables -t nat -A  POSTROUTING -o wlan0 -j MASQUERADE\n&/' /etc/rc.local
fi
echo " "



#Reboot the system after 1 min
sudo shutdown -r +1

#checking the status of Dnsmasq
#sudo service dnsmasq status

#Show the connected members
#cat /var/lib/misc/dnsmasq.leases
