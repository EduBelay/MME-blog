#BASH
echo "Engadir repo php8.2"
sudo apt install apt-transport-https lsb-release ca-certificates wget -y
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

echo "Actualizar paquetes base"
apt update ; apt upgrade -y; apt install pwgen git -y

echo "Instalación docker"
apt install docker.io docker-compose -y


echo "Instalación dependencias servidor web"
apt install apache2 php  php8.2-mbstring libapache2-mod-php8.2 php-mbstring php-curl  php-gd  php8.2-simplexml  php-intl -y
apt install curl 
apt install php8.1-mbstring
apt install php8.1-intl

#apt install php8.2 php8.2-cli php-8.2{bz2,curl,mbstring,intl} -y

service apache2 restart
systemctl reload apache2

echo "Instalación base de datos"
apt install   mariadb-server php-mysql -y 



#Config Apache
sudo a2enmod expires rewrite
sudo a2enconf glpi

#Recarga configuracion apache
systemctl reload apache2

# Descarga GLPI10 


