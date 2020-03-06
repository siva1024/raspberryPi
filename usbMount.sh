# Script for mounting a Pendrive to a folder

# Function for selecting the Mount path
function mountPath {
    echo "######################################################"
    read -p "Please specify the path for mounting the drive(default: /nas): " path
    if [ -z ${path} ] ; then
        path='/nas'
    elif [[ ${path} != "/"* ]] ; then
        echo "Adding / infront of input"
        path="/"${path}
    fi
}

function checkNum {
    if ! [[ ${num} =~ ^[0-9]+$ ]] ; then
        echo "The number you have entered is invalid: ${num}"
        exit 1
    elif [[ ${num} -eq "0" ]] ; then
        echo "Not a valid input"
        exit 1
    elif [[ ${num} -le $(sudo blkid | wc -l) ]] ; then
        echo "Input accepeted"
    else
        echo "The entered integer ${num} is grater than the acceptable value: $(sudo blkid | wc -l)"
        exit 1
    fi
}

# Adding storage details to "/etc/fstab"
function storageDetails {
    if $( sudo fmt -1 /etc/fstab | grep -qxF "${path}" ) ; then
        echo "Selected path ${path} already exists in the configuration file"
    fi
#    if grep -Fxq "UUID=${uuid}" /etc/fstab
#        echo "Selected UUID ${uuid} already exists in the configuration file"
#    then
#        echo "exists"

    # <UUID> /nas "<TYPE>" defaults,nofail 0 0 
    sudo sed -i '$ a '"UUID=${uuid} ${path} ${mountType}"' defaults,nofail 0 0' /home/pi/test  #/etc/fstab
}

function mounting {
    var=$(sudo blkid)
    echo -e "${RED}${var}${NC}"
    read -p "Select the line number for the Mount Device: " num
    echo ""
    checkNum
    mountPath
    mountDevice=$(sudo blkid | sed -n ${num}p | cut -d ":" -f1)
    uuid=$(sudo blkid -o value -s UUID ${mountDevice})
    mountType=$(sudo blkid -o value -s TYPE ${mountDevice})
    echo "Mount = ${mountDevice}"
    echo "Path = ${path}"
    echo "UUID = ${uuid}"
    echo "TYPE = ${mountType}"
    storageDetails
    
}

lsblk
echo ""
echo "######################################################"
read -p "Do you want to proceed to mount the drive? y/n: " proceed
echo ""
echo "######################################################"

# Red colour text output
RED='\033[0;31m'
NC='\033[0m'

if [ "$proceed" = "N" ] || [ "$proceed" = "n" ] ; then
    echo ""
    echo "Exiting the application"
    exit 1

elif [ "$proceed" = "Y" ] || [ "$proceed" = "y" ] ; then
    echo ""
    mounting
else
    echo "Proper input not given exiting the application"
fi

# add lines to /etc/fstab
# <UUID> /nas "<TYPE>" defaults,nofail 0 0 


# Install the utils for the exfat
#sudo apt-get update
#sudo apt-get -y install exfat-fuse exfat-utils

# List out all the drives that are available
#lsblk

# Or
#sudo fdisk -l | grep sda & sudo fdisk -l | grep sde

#read -p "Enter the full path of the drive(ex: /dev/sda1): " path

# Create a directory for the mount point
#sudo mkdir -p /nas

# Mount the usb to the mount point
#sudo mount $path /nas

# unmount the usb
#sudo umount /media/usb