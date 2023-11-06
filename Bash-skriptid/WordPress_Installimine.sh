#!/bin/bash
 
wordpress_dir="/var/www/html/wordpress"
 
if [ -d "$wordpress_dir" ]; then 
    echo "Wordpress on juba paigaldatud!"
    exit 
else
 
echo "WordPressi root kasutaja parool: "
read -s mysql_pass 

echo "Luuakse andmebaas 'wordpress', kasutaja Administrator parooliga 'qwerty'"
mysql --user="root" --password=${mysql_pass} --execute="create database wordpress;
CREATE USER Administrator@localhost IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON wordpress.* to Administrator@localhost;
FLUSH PRIVILEGES;
EXIT"
 
echo "Installerin Wordpressi"
wget -P /var/www/html https://wordpress.org/latest.tar.gz 
tar xvzf /var/www/html/latest.tar.gz -C /var/www/html
rm /var/www/html/latest.tar.gz 
chown -R www-data:www-data /var/www/html/wordpress
 
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
 
echo "Konfigureerin andmebaasi..."
 
sed -i "s/database_name_here/wordpress/g" /var/www/html/wordpress/wp-config.php
echo "Valiti andmebaasiks wordpress"
sed -i "s/username_here/Administrator/g" /var/www/html/wordpress/wp-config.php
echo "Valiti kasutaja nimeks Administrator"
sed -i "s/password_here/qwerty/g" /var/www/html/wordpress/wp-config.php
echo "Valiti kasutaja parooliks seda, mida ennem valiti"
 
echo "Muudan Wordpressi lehe kataloogi Apache2 peamiseks kataloogiks"
 
sed -i 's/\/var\/www\/html/\/var\/www\/html\/wordpress/g' /etc/apache2/sites-available/000-default.conf
 
systemctl restart apache2
 
echo "Wordpress on Installitud!"
echo "Kui soovite sissepääseda WordPressi siis peale seda pange 'ip a' ja seal on teie ip ja pange see browserisse."
 
fi