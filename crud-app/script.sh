#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y unzip apache2 apache2-utils
sudo apt autoremove -y
sudo systemctl enable apache2
cd /tmp
sudo unzip -o crud.zip
#sudo apt install mariadb-server mariadb-client -y
#sudo apt autoremove -y
#sudo systemctl enable mariadb
#sudo bash sql/setmariadb.sh
sudo mysql -e "CREATE DATABASE crud /*\!40100 DEFAULT CHARACTER SET utf8 */;"
#sudo mysql -e "CREATE USER 'databaseuser'@'%'' IDENTIFIED BY 'abcd1234';"
#sudo mysql -e "GRANT ALL PRIVILEGES ON crud.* TO 'databaseuser'@'%';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO root@10.0.1.4 IDENTIFIED BY 'JORlaresp1970!' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo mysql crud < sql/users.sql
sudo apt install php7.0 libapache2-mod-php7.0 php7.0-mysql php-common php7.0-cli php7.0-common php7.0-json php7.0-opcache php7.0-readline
sudo apt autoremove -y
sudo a2enmod php7.0
cd /etc/mysql/mysql.conf.d/
sudo chmod 0644 mysqld.cnf
sudo sed -i 's/127.0.0.1/0.0.0.0/g' ./mysqld.cnf
sudo systemctl restart mysql.service
sudo touch info.php
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
sudo cp info.php /var/www/html/info.php
sudo cp code/* /var/www/html/
sudo chown www-data:www-data /var/www/html/ -R
sudo apt install php libapache2-mod-php php-mysql -y
sudo systemctl restart apache2