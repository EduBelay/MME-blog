#!/usr/bin/env bash

## Configurar caché de paquetes para acelerar isntalación
## echo "-----------------"
## echo "Añadiendo apt-cacher"
## echo "Acquire::http { Proxy \"http://192.168.1.254\";};" > /etc/apt/apt.conf.d/01apt-cacher-ng

echo "-----------------"
echo "Actualizando repositorios y equipo"
apt update
#apt full-upgrade -y

echo "-----------------"
echo "Instalando apache-php-mysql"

echo "mysql-server mysql-server/root_password password Abc123.." | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password Abc123.." | debconf-set-selections

apt install net-tools apache2 php libapache2-mod-php php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl mysql-client mysql-server -y

echo "------------------"
echo "Creando base datos"
mysql -uroot -pAbc123.. -h localhost -e "CREATE DATABASE wordpress;"
mysql -uroot -pAbc123.. -h localhost -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'Abc123..'";
mysql -uroot -pAbc123.. -h localhost -e "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost'";

echo "-----------------"
echo "Habilitando SSL"
a2enmod ssl
a2ensite default-ssl.conf

echo "-----------------"
echo "Creando index.php"
cat > /var/www/html/index.php << 'EOF'
<?php
echo "
<html>
<head>
    <title>Sitio web en ${_SERVER["SERVER_ADDR"]}</title>
</head>
<body>
<h1>Mi Sitio Web</h1>
Est&aacute;s en ${_SERVER["SERVER_ADDR"]}
</body>
</html>";
?>
EOF

echo "-----------------"
echo "Creando info.php"
cat > /var/www/html/info.php << 'EOF'
<?php
phpinfo();
?>
EOF

rm /var/www/html/index.html

echo "-----------------"
echo "Preparando adminer.php"
wget -O /var/www/html/adminer.php https://www.adminer.org/latest.php

echo "-----------------"
echo "Reiniciando apache"
systemctl restart apache2.service

echo "------ FIN ------"