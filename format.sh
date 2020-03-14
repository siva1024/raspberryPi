
echo "######################################################"
echo "Below are the connected Disk"
lsblk -p


echo "######################################################"
echo "Download Raspbian desktop with recommended software"
wget https://downloads.raspberrypi.org/raspbian_full_latest


echo "######################################################"
echo "Download Raspbian Lite software image"
wget https://downloads.raspberrypi.org/raspbian_lite_latest

echo "######################################################"
echo "Renaming the current files to zip file"
mv raspbian_lite_latest raspbian_lite_latest.zip

echo "######################################################"
echo "Unziping the file"
unzip *.zip

echo "######################################################"
echo "Unziping the file"
dd if=/dev/zero of=/dev/sda

sudo dd bs=4M if=2019-09-26-raspbian-buster-full.img of=/dev/sda conv=fsync
