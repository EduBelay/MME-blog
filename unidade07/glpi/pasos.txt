# Recordatorio vagrant
 * vagrant init => Inicializacion
 * vagrant up => Levantar a máquina
 * vagrant halt => deter a máquina
 * vagrant stop => Parar a máquina
 * vagrant up --provision => Levantar a máquina e provisionar 


# Configuración do ficheiro Vagrant

```bash
Vagrant.configure("2") do |config|
  # glpi server
  config.vm.define "glpinode" do |glpinode|
    glpinode.vm.box = "debian/bullseye64"
    glpinode.vm.hostname = "glpinode"
    glpinode.vm.box_url = "debian/bullseye64"
    glpinode.vm.network "forwarded_port", guest: 80, host: 8080
    #glpinode.vm.network :public_network, use_dhcp_assigned_default_route: true
    #glpinode.vm.network :public_network, use_dhcp_assigned_default_route: true
    glpinode.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "glpi-node"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      service ssh restart
    SHELL
    glpinode.vm.provision "shell", path: "install_docker.sh"
    glpinode.vm.provision "shell", path: "deploye_container.sh"
  end
end
```

# Script de instalacion

```bash
#!/bash 
echo "Engadir repo php8.2"
sudo apt install apt-transport-https lsb-release ca-certificates wget -y
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

echo "Actualizar paquetes base"
apt update ; apt upgrade -y; apt install pwgen git -y

echo "Instalación docker"
apt install docker.io docker-compose -y


echo "Instalación dependencias servidor web"
apt install apache2 php  php8.2-mbstring libapache2-mod-php8.2 php-mbstring php-curl  php-gd  php-simplexml php-intl -y
apt install php8.2,php8.2-cli,php-8.2{bz2,curl,mbstring,intl} -y

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
```

# Desplegamento

```bash
#Adresse IP d'accès GLPI
ip=$(hostname -I | awk '{print $2}')

#On génere un mot de passe
export DB_PASSWORD=`pwgen -Bs1 12`

#On télécharge la branche github et applique le docker-compose
cd /root/ ; git clone https://github.com/aguyonp/docker-glpi ; cd docker-glpi/glpi/ ; docker-compose up -d

#On affiche l'IP d'accès à GLPI ainsi que le mot de passe de sa base de donnée
echo "---------------------------------------------------"
echo "Déploiement terminé, l'URL GLPI est: http://"$ip"/"
echo "Serveur SQL: db"
echo "Utilisateur SQL: root ou glpi"
echo "/*\ A conserver /*\ Le mot de passe root MariaDB est: "$DB_PASSWORD
echo "---------------------------------------------------"
```

# Instalacion GLPI
```bash
#directorio de apache 
cd /var/www/html
#descargamos a ultima version estable
wget https://github.com/glpi-project/glpi/releases/download/10.0.5/glpi-10.0.5.tgz

#descomprimimos o ficheiro descargado
sudo tar xf glpi-10.0.5.tgz

#mudamos os permisos 
sudo chown -R www-data: /var/www/html/glpi

#Configurar a base de datos
sudo mysql -u root -p

 #> Creamos a base de datos de glpi
     create database glpi charset utf8mb4 collate utf8mb4_unicode_ci;
#>  creamos un usuario coa clave s3gr3d0
    create user glpi@localhost identified by 's3gr3d0';
#> Damoslle permisos
    grant all privileges on glpi.* to glpi@localhost;
#> Timezone
    grant select on mysql.time_zone_name to glpi@localhost;
```