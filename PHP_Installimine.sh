
PHP=$(dpkg-query -W -f='${Status}' PHP 2>/dev/null | grep -c 'ok installed')
if [ $PHP -eq 0 ]; then
    echo "Masinal ei ole PHP"
    echo "Installime PHP"
    apt install php libapache2-mod-php php-mysql
    echo "PHP on installitud!"
elif [ $PHP - eq 1 ]; then
    echo "PHP on juba installitud!"
    echo "Kontrollime PHP olekut"                                                                                                                  #You fool! CYAHUB 
    which php
fi