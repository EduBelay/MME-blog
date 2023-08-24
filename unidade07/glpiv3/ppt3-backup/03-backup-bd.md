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
![bg ](https://hlassets.paessler.com/common/files/blog/2017/snmp-1-fb.png)
  
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

#Declaración de variables para ás credenciais de bases de datos

#Nome de Usuario
dbUser="glpi"
#Contrasinal de Usuario
dbPass="Password1234"
#Nome da BD
dbName="glpi"

#Creacion de variable del directorio de  archivos generados
backupDir="/backupbd"

#Creación de la variable para la fecha
dateTime=$(date +"%Y-%m-%d_%H-%M-%S")

#Comando que genera la copia de seguridad
mysqldump --user=$dbUser --password=$dbPass $dbName > $backupDir/$dbName-$dateTime.sql

#Comando que comprime archivo generado
gzip $backupDir/$dbName-$dateTime.sql

#Comando que elimina archivos antiguos
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
#  Restaurar entorno
```sh
#!/bin/bash
#Declaración de variables para ás credenciais de bases de datos

#Nome de Usuario
dbUser="glpi"
#Contrasinal de Usuario
dbPass="Password1234"
#Nome da BD
dbName="glpi"

#Nome do ficheiro
$ficheiro="glpi-2023-07-06_14-59-49"
#Descomrpimri ficheiro
sudo gzip -dv $ficheiro.sql.gz

mysql  --user=$dbUser --password=$dbPass $dbName < $backupDir/$ficheiro

```

---
# Configuración rsync
```sh 
rsync -a ~/dir1 username@remote_host:destination_directory

```

Máis información: https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-es 
