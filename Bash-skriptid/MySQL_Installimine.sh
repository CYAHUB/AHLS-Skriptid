#!/bin/bash

if apt list --installed "mysql-server" 2>/dev/null | grep -q "mysql-server" > /dev/null 2>&1; then
     echo "Masinal on olemas juba MySQL."
     systemctl status mysql
else
    echo "Masinal pole MySQL."
    echo "Alustan Installimist"
    apt update
    apt install wget -y
    wget https://dev.mysql.com/get/mysql-apt-config_0.8.28-1_all.deb
    apt install ./mysql-apt-config_*_all.deb
    apt update
    apt install mysql-server
    systemctl enable --now mysql
    mysql --version
fi
