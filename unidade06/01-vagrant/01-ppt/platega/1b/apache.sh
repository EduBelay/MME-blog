#!/usr/bin/env bash
echo "-----------------"

## Configurar caché de paquetes para acelerar isntalación
## echo "-----------------"
## echo "Añadiendo apt-cacher"
## echo "Acquire::http { Proxy \"http://192.168.1.254\";};" > /etc/apt/apt.conf.d/01apt-cacher-ng

echo "Actualizando repositorios y equipo"
apt update
#apt full-upgrade -y

echo "-----------------"
echo "Instalando apache-php"

apt install net-tools apache2 php libapache2-mod-php php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl mysql-client -y

echo "-----------------"
echo "Habilitando SSL"
a2enmod ssl
a2ensite default-ssl.conf

echo "-----------------"
echo "Enlazando DocumentRoot"
if ! [ -L "/var/www/html" ]
then
rm -rf /var/www/html
ln -fs /vagrant_www /var/www/html
fi

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

#rm /var/www/html/index.html

echo "-----------------"
echo "Preparando adminer.php"
wget -O /var/www/html/adminer.php https://www.adminer.org/latest.php

echo "-----------------"
echo "Reiniciando apache"
systemctl restart apache2.service

echo "------ FIN ------"
