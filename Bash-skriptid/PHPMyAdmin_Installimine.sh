#!/bin/bash

if dpkg -l | grep -q phpmyadmin; then
       echo "Masinal on juba olemas PHPMyAdmin."
else
       echo "Masinal pole PHPMyAdmin-it."
       echo "Alustan installimist"
       apt update
       apt install phpmyadmin
       echo "Installimine lõpetatud"
fi
