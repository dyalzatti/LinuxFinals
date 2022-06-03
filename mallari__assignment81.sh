systemctl stop httpd

vi lamp.sh

#!/bin/sh

# install httpd
yum install -y httpd

# start httpd service
systemctl start httpd

# enable httpd as a service
systemctl enable httpd

# to allow traffic to our web server
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp

# reload to apply changes
firewall-cmd --reload

# to enable apache
systemctl enable httpd

#install rsync
yum install rsync

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum install -y yum-utils

yum-config-manager --enable remi-php56

# install packages
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

# restart httpd
systemctl restart httpd

# install maria db
yum install -y mariadb-server mariadb

# start maria db
systemctl start mariadb

mysql_secure_installation

# enable maria db
systemctl enable mariadb

mysql -u root -p