
APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
if [ $APACHE2 -eq 0 ]; then
    echo "Masinal ei ole apache2"
    echo "Installime apache2"
    apt install apache2
    echo "Apache2 on installitud!"
elif [ $APACHE2 - eq 1 ]; then
    echo "Apache2 on juba installitud!"
    echo "Käivitame Apache2 tööle"                                                                                                                  #You fool! CYAHUB 
    service apache2 start
    service apache2 status
fi