# Add the following line to /etc/apt/sources.list:
#deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main

echo "######################################################"
echo "Checking the Ansible is added to source list"

if grep -Fxq "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" /etc/apt/sources.list
then
    echo "The configuration exists"
else
    echo "the configuration is not set, updating the configuration"
    sudo sed -i "\$adeb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" /etc/apt/sources.list
fi
echo "Done"
echo " "

# Add the apt-key to the host
echo "######################################################"
echo "Adding the apt-key to the host"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo "Done"
echo " "

# Updating the source list
echo "######################################################"
echo "Updating the source list"
sudo apt update
echo "Done"
echo " "

# Installing the Ansible software
echo "######################################################"
echo "Installing the Ansible software"
sudo apt install -y ansible
echo "Done"
echo " "
