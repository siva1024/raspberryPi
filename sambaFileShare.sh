# Install the samba file share utility
sudo apt-get install samba samba-common-bin

# configure the file smb.conf
sudo nano /etc/samba/smb.conf

# At the end of the file add the following lines

[master]
   comment = Pi Shared Folder
   path = /media/usb
   browseable = yes
   valid user = pi
   writeable = Yes
   create mask = 0777
   directory mask = 0777
   guest ok = no
   
# Start the samba service
sudo service smbd start

# Stop the samba service
sudo service smbd stop

# Restart the samba service
sudo service smbd restart

# Create a user Samba user
sudo smbpasswd -a <User_name>
