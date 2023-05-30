---
marp: true
paginate: true
# header: '**Montaxe e mantemento de equipos**'
footer: 'Pablo Belay Fernández'



---
<!--
Notas para a presentación
-->
# Copia de seguridade da BD de GLPI
![w:800](https://www.arcserve.com/sites/default/files/styles/medium/public/wp-img/plan-a-signs_0.jpg.webp?itok=J99_AEOD)
  
<style>
  :root{
     --color-background: #101010;
     --color-foreground: #fff;
  }
  h1{
    color:#73a832;
  }

  h2{
    color:#32a883;
  }

  .anotacion {
  font-size: 10px;
}
</style>

<!-- _colorPreset: dark -->

---
# Script

```sh 
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

```
---
# Configuración entorno
```sh 
# Crear directorio 
mkdir /backupbd
#Engadir permisos de execución
chmod +x script.sh
#Editar crontab
crontab -e
#> 
* * * * * 1,3,5         /backupbd/script.sh

```
---
# Restaurar BD 

```sh
mysql -u [user] -p [database_name] < [filename].sql
```
[Ampliar información](https://phoenixnap.com/kb/how-to-backup-restore-a-mysql-database)

---
# Configuración rsync
```sh 
rsync -a ~/dir1 username@remote_host:destination_directory

```

Máis información: https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-es 
