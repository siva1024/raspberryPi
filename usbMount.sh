# Install the utils for the exfat
sudo apt-get install exfat-fuse exfat-utils

# List out all the drives that are available
lsblk

# Or
sudo fdisk -l

# Create a directory for the mount point
sudo mkdir /media/usb

# Mount the usb to the mount point
sudo mount /dev/sda1 /media/usb

# unmount the usb
sudo umount /media/usb
