#Bash

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
