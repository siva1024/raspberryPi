sudo apt update
sudo apt install openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins

# Mondify /etc/default/jenkins file
# JENKINS_ARGS="--webroot=/var/cache/jenkins/war --httpPort=$HTTP_PORT --prefix=/jenkins"

systemctl status jenkins

