# Install the samba file share utility
sudo apt-get install samba samba-common-bin

# configure the file smb.conf
sudo nano /etc/samba/smb.conf

# At the end of the file add the following lines
[share]
   Comment = Pi Shared Folder
   Path = /media/usb
   Browseable = yes
   Writeable = Yes
   only guest = no
   create mask = 0777
   directory mask = 0777
   Public = yes
   Guest ok = yes
   
# Start the samba service
sudo service smbd start

# Stop the samba service
sudo service smbd stop

# Restart the samba service
sudo service smbd restart
