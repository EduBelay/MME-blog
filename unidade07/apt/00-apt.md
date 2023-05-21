<h1> APT </h1>

- [Que é?](#que-é)
- [Comandos máis destacados](#comandos-máis-destacados)
  - [apt help](#apt-help)
  - [apt search](#apt-search)
  - [apt install](#apt-install)
    - [apt instal múltiple](#apt-instal-múltiple)
    - [apt install versión concreta](#apt-install-versión-concreta)
  - [apt update](#apt-update)
  - [apt show](#apt-show)
  - [apt remove](#apt-remove)
  - [apt purge](#apt-purge)
  - [apt list](#apt-list)
  - [apt upgrade](#apt-upgrade)
  - [apt full-upgrade](#apt-full-upgrade)
  - [apt autoremove](#apt-autoremove)
  - [apt depends](#apt-depends)
- [Outros comandos relacionados](#outros-comandos-relacionados)
  - [apt-cache](#apt-cache)
  - [apt-config](#apt-config)
  - [apt-key](#apt-key)
- [Bibliografía](#bibliografía)
# Que é?
APT (para Advanced Package Tool) é un conxunto de ferramentas para administrar paquetes en Debian
e polo tanto as aplicacións do Sistema Operativo. APT fai posible instalar aplicacións, eliminar
aplicacións e actualizar as aplicacións á última versión.

APT resolve problemas de dependencia e recupera os paquetes solicitados dos repositorios de paquetes designados. APT delega a instalación e eliminación de paquetes en dpkg.

A sintaxe básica do comando é: 

 > apt-get [options] [-o config=string] [-c=cfgfile] command [pkg]

Actualmente o comando emprégase unha versión "abreviada" co nome de apt 

>  apt [options] [-o config=string] [-c=cfgfile] command [pkg]
 

# Comandos máis destacados
Podemos consultar os comandos máis empregados buscando na axuda da seguinte maneira 
 > apt -h 

 A cal danos como resultado 
 ```txt 
  list - list packages based on package names
  search - search in package descriptions
  show - show package details
  install - install packages
  reinstall - reinstall packages
  remove - remove packages
  autoremove - Retira automaticamente todos os paquetes sen uso
  update - update list of available packages
  upgrade - upgrade the system by installing/upgrading packages
  full-upgrade - upgrade the system by removing/installing/upgrading packages
  edit-sources - edit the source information file
  satisfy - satisfy dependency strings
 ```
## apt help 
Permítenos consultar a axuda do comando.
 ```bash 
 sudo apt help
 ```

## apt search 
Permítenos buscar un paquete nos repositorios
 ```bash 
 sudo apt search [texto]
 ```

 Exemplo de búsqueda de  "netstat"

 ```bash
sudo apt search netstat
```

## apt install 
Se quixeramos instalar unha versión concreta teríamos que indicalo, para elo a sintaxe sería:

 ```bash 
 sudo apt install [package-name]=[version]
 ```
 Exemplo de instalación unzip  dunha versión concreta

 ```bash
sudo apt install unzip=6.0-25ubuntu1
 ```
### apt instal múltiple 
Outra alternativa de empregar **apt install** é indicar varios paquetes nunha única liña. 

 ```bash
sudo apt install zip unzip
 ```


### apt install versión concreta

 ```bash
 sudo apt install [package-name]=[version]

# exemplo 
 sudo apt install unzip=6.0-25ubuntu1
 ```
## apt update 
Este comando permítenos actualizar a base de datos do repositorio.  Polo cal é importante que previamente executemos **apt update**.

 ```bash 
 apt update 
  ```


## apt show 
Permite obter os detalles do paquete independentemente de se esta instalado ou non. 
 ```bash 
 apt show  gzip 
 # firefox
  apt show  firefox 

  ```

## apt remove
Eliminar un paquete concreto pero deixa no sistema os ficheiros de configuración. 

 ```bash 
 sudo apt remove [package-name]
 ```
Exemplo:
 ```bash 
sudo apt remove unzip
 ```

## apt purge
Elimina totalmente calquera rastro da aplicación é decir ficheiros binarios e de configuración. 
 ```bash 
 sudo apt purge [package-name]
 ```
Exemplo:
 ```bash 
sudo apt purge unzip
 ```



## apt list
Permítenos listar as aplicacións 

**Obter todas as aplicacións instaladas.**

> apt list --installed

**Obter todas as versións**

> apt list --all-versions

## apt upgrade 
Os paquetes instalados serán actualizados a última versión. 
 ```bash 
 sudo apt update 
  ```
  Unha forma habitual de executar este comando e desta maneira así garantimos que serán actualizados os paquetes previamente. 
 ```bash 
 sudo apt update && sudo apt upgrade -y
  ```
## apt full-upgrade 
Diferenciase do anterior comando en que elimina os paquetes instalados se é preciso para actualizar a totalidade do sistema. 
 ```bash 
 sudo apt upgrade 
  ```


## apt autoremove
En ocasións quedan no sistema paquetes que non son precisos polo cal se poden "limpar" 

 ```bash 
 sudo apt autoremove 
  ```
## apt depends
Permítenos verificar as dependecias dun paquete. 
 ```bash 
 sudo apt depends gzip
 # exemplo zip
  sudo apt depends zip
  ```
# Outros comandos relacionados

## apt-cache
Comandos máis empregados:
  * showsrc - Mostra rexistros da fonte
  * search - Busca na lista de paquetes por unha expresión regular
  * depends - Mostra informacións brutas de dependencia para un paquete
  * rdepends - Mostra informacións de dependencia inversa para un paquete
  * show - Mostra un rexistro lexíbel para o paquete
  * pkgnames - Lista os nomes de todos os paquetes no sistema
  * policy - Mostra configuracións da política

## apt-config
Comandos máis empregados:
  * d

## apt-key 
```
  apt-key add <file>          - add the key contained in <file> ('-' for stdin)
  apt-key del <keyid>         - remove the key <keyid>
  apt-key export <keyid>      - output the key <keyid>
  apt-key exportall           - output all trusted keys
  apt-key update              - update keys using the keyring package
  apt-key net-update          - update keys using the network
  apt-key list                - list keys
  apt-key finger              - list fingerprints
  apt-key adv                 - pass advanced options to gpg (download key)
```
Exemplo habitual para ver os repositorios:
```bash
apt-key list
```
# Bibliografía

https://www.zentica-global.com/es/zentica-blog/ver/ejemplos-de-comandos-apt-para-ubuntu--debian-para-nuevos-usuarios-6073984a630ef

https://cambiatealinux.com/apt-get-instalar-programas-en-linux

https://apunteimpensado.com/guia-minima-empezar-terminal-linux/


>> VER DETALLE : 

https://geekflare.com/es/apt-command-examples/ 



<footer>
<p style="float:left; width: 10%;">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
</p>

<p style="float:left; width: 90%; text-align:center;">
Copyright © <a href="https://www.belay.gal">Pablo Belay Fernández, 2022 | www.belay.gal | </a>
<br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>
</p>
</footer>