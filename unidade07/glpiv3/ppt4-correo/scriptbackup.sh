#!/bin/bash

#Declaración de variables para o acceso a BD
dbUser="glpi"         #Nome de usuario
dbPass="Password1234" #Contrasinal
dbName="glpi"         #Nome da BD

#Creacion de variable do directorio para almacenar os bakcups
backupDir="/backupbd"
#Formato da data para incorporar no nome 
dateTime=$(date +"%Y-%m-%d_%H-%M-%S")

#Xeración da copia de seguridade
mysqldump --user=$dbUser --password=$dbPass $dbName > $backupDir/$dbName-$dateTime.sql

#Comprimir o arquivo
gzip $backupDir/$dbName-$dateTime.sql

#Eliminar arquivos antigos
find $backupDir-type f -name "*.gz" -mtime +7 -delete