# Hoiatus
* Palun kasuta Ubuntu 22.04 LTS või sarnast versiooni.
Ma ei vastuta, kui need skriptid ei tööta teistes arvutites.

* Masina peab olema kasutaja vähemalt **`Martin`**.
* Kõikides masinates peab olema **`root`** sissepääs igasse masinasse(vähemalt Ansible).
* Skriptid ja playbookid on kohustatud käivitada **`root`**-ina.

# Kuidas skripte tööle panna?
* Ansible --> **`ansible-playbook asukoht/skript.yml`**
* Bash --> **`sh asukoht/skript.sh`** või(Peab olema lubatud õiguseks +x kui ei, siis all pool on skript) **`asukoht/skript.sh`** või(ainult siis kui oled samas kohas kui on skript) **`./skript.sh`**
* Annab tervele kausta sees failidele õigused **`chmod +x *`** või **`chmod +x *.sh`** mis ainult annab õigused .sh lõpuka failid.

# Kaustad
* [__Ansible-skriptid__](https://github.com/CYAHUB/AHLS-Skriptid/tree/main/Ansible-skriptid) - Siin on Ansible kaust.

* [__Bash-skriptid__](https://github.com/CYAHUB/AHLS-Skriptid/tree/main/Bash-skriptid) - Siin on Bash kaust.

### [Ansible Skriptid]

* [__Apache2.yml__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Ansible-skriptid/Apache2.yml) - Skript paigaldab paketi apache2, loob user'ile kataloog "public_html" ning lisab kataloogile "userdir" mod'i. Lisaks kopeerib index.html faili kasutaja oma "public_html" kataloogi. Ja lõppude lõpuks muudab index.html faili, mis on kasutaja kataloogis sees, midagi oma pärast.

* [__PHP.yml__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Ansible-skriptid/PHP.yml) - Skript paigaldab kõige stabiilsema ja uuema PHP. Lisaks loob phpinfo.php faili ka. 

* [__MySQL.yml__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Ansible-skriptid/MySQL.yml) - Skript loob kausta nimega "Allalaadimised", et allalaadida mysql-serverist repo faili. Siis installib selle faili kaasa arvatud mysql serveri ja python3-pymysql. Ning loob kasutajale "root" login faili kaasa arvatud andebaasi kasutaja. Kasutaja: "root" ja parool "qwerty".

* [__PHPMyAdmin.yml__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Ansible-skriptid/PHPMyAdmin.yml) - Installib PHPMyAdmini ja konfigureerib nii, et oleks võimalik kasutada.

* [__WordPress.yml__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Ansible-skriptid/WordPress.yml) - Skript loob andmebaasi "wordpress". Loob kasutaja "Administrator" ja parooli "qwerty" ning annab õigused andmebaasi "wordpress". Laeb wordpressi kodulehel faili ja pakib lahti "/var/www/html" asukohas ning annab wordpressi kasutale õigused "www-data". Ja peale seda tuleb wordpressi konfiguratsioonid.

### [Bash Skriptid]

* [__Apache_Installimine.sh__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Bash-skriptid/Apache_Installimine.sh) - Skript kontrollib, kas on olemas "Apache2". Kui ei ole siis installib "Apache2". Kui on siis paneb "Apache2" tööle.

* [__PHP_Installimine.sh__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Bash-skriptid/PHP_Installimine.sh) - Skript kontrollib, kas on olemas "PHP". Kui ei siis installib "PHP" koos muud osa juurde. Kui on, siis kontrollib kus asub "PHP".

* [__MySQL_Installimine.sh__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Bash-skriptid/MySQL_Installimine.sh) - Skript kontrollib, kas on olemas "Mysql". Kui ei, siis laeb alla mysql koduleheküljelt "mysql-apt-config"'i ja installib peale. Peale seda installib endale "mysql-server"-i. Lisaks paneb automaatselt tööle kui masin läheb tööle.

* [__PHPMyAdmin_Installimine.sh__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Bash-skriptid/PHPMyAdmin_Installimine.sh) - Skript kontrollib, kas on olemas "PHPMyAdmin". Kui ei, siis installib "PHPMyAdmin". Kui on olemas siis annab märku, et on olemas rohkem ei pea midagi tegema.

* [__WordPress_Installimine.sh__](https://github.com/CYAHUB/AHLS-Skriptid/blob/main/Bash-skriptid/WordPress_Installimine.sh) - Skript kontrollib, kas on olemas kaust nimega "wordpress". Kui ei, siis küsitakse "wordpress"-i andmebaasi kasutajalt parooli, ning tehakse andmebaas. Siis installitakse "Wordpress". Peale seda konfigureeritakse andmebaasi. Lõppude lõpuks, skript teeb restarti "Apache2".


* Wordpressi kodulehekülg on kas **`xxx.xxx.xxx.xxx/wordpress`** või **`example.com/wordpress`**
* PHPMyAdmin kodulehekülg on kas **`xxx.xxx.xxx.xxx/phpmyadmin`** või **`example.com/phpmyadmin`**