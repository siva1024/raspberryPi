sudo apt-get install slapd
# promts for ADMIN Password
sudo apt-get install ldap-utils

# edit file "/etc/ldap/ldap.conf" and enable
BASE    dc=torchilidae,dc=com
URI ldap://server.torchilidae.com ldap://server.torchilidae.com:666

dpkg-reconfigure slapd
# follow the recomended options(MDB)

ldapsearch -x
sudo apt-get install phpldapadmin

ln -s /usr/share/phpldapadmin/ /var/www/html/phpldapadmin

# /etc/phpldapadmin/config.php

# update the time zone
# servers->setValue('server','name','<Server Name>');
# servers->setValue('server','host','<IP Address>');
# servers->setValue('server','nase',array('dc=domainName,dc=com'));
# servers->setValue('login','bind_id','cn=admin,dc=domainname,dc=com');
service apache2 restart
# localhost