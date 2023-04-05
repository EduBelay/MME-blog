# Instalación desatendida de Debian

- [Instalación desatendida de Debian](#instalación-desatendida-de-debian)
  - [1. Entorno](#1-entorno)
  - [2. Preparación da ISO](#2-preparación-da-iso)
  - [3. Personalización do ficheiro preseed.cfg](#3-personalización-do-ficheiro-preseedcfg)
    - [3.1 Os locales:](#31-os-locales)
    - [3.2 Teclado:](#32-teclado)
    - [3.3 Configuración de rede:](#33-configuración-de-rede)
    - [3.4 Usuario root:](#34-usuario-root)
    - [3.5 Fuso horario:](#35-fuso-horario)
    - [3.6 Particionado:](#36-particionado)
    - [3.7 Configurando APT:](#37-configurando-apt)
  - [4.  Xerar a imaxe](#4--xerar-a-imaxe)
- [Bibliobrafía](#bibliobrafía)


<div style="page-break-after: always;"></div>
 


## 1. Entorno
Neste caso precisaremos:
* MV con Xubuntu con 4GB de RAM e 4 CPUS.
* Directorio compartido na MV cun cartafolo coa ISO de Debian
* Precisamos instalar os seguintes aplicativos: `genisoimage` e `xorriso`

 

    ```bash
    sudo apt install genisoimage -y
    sudo apt install xorriso -y
    ```

 Ficheiro de configuración Vagrantfile

```ruby

Vagrant.configure("2") do |config|
    config.vm.box = "acntech/xubuntu"
    config.vm.hostname ="EX-Pressed"
  
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4048"
      vb.cpus = "4"
      vb.name = "EX-Pressed"
      vb.gui=true
     end
    
     config.vm.provision "shell", inline: <<-SHELL
       sudo apt update
       sudo apt install xorriso -y
     SHELL
  #cartafois
  config.vm.synced_folder "isos", "/home/vagrant/isos"
  
  
  end
``` 

<div style="page-break-after: always;"></div>

## 2. Preparación da ISO
1. Primeiro hai que **descargar a imaxe de debian** da páxina oficial (debian.org). Podes descargar directamente empregando o comando curl. Por exemplo:
   ```bash
   $ curl -#LO https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
   ``` 
   Tamén podes descargar outras versións na web de [Debian](https://cdimage.debian.org/debian-cd/current/amd64/) ou pasar a imaxe a máquina virtual empregando o cartafol compartido de `/home/vagrant/isos`

2. Agora temos que  extraer os arquivos da imaxe e para elos volcaremos o contido no directorio `/isofiles` : 

    ```bash
    $ xorriso -osirrox on  -indev debian-11.5.0-amd64-DVD-1.iso -extract / isofiles/
    ```

    **NOTA:** Podemos ter problemas cando traballamos no directorio compartido co host ( `/home/vagrant/isos`), nese caso realiza a operación en calquera directorio da MV, por exemplo en  `/home/vagrant/Desktop/practica` . 

    `xorriso -osirrox on  -indev debian-11.5.0-amd64-DVD-1.iso -extract / /home/vagrant/Desktop/practica/isofiles/`

3. Seguídamente hai que descargar a plantilla `preseed.cfg` dende este enderezo: 

    [https://www.debian.org/releases/stable/example-preseed.txt](https://www.debian.org/releases/stable/example-preseed.txt)

    ```bash
        $ curl -#L https://www.debian.org/releases/stable/example-preseed.txt -o preseed.cfg

        # outra opción con wget
        $ wget https://www.debian.org/releases/stable/example-preseed.txt
    ```

<div style="page-break-after: always;"></div>

## 3. Personalización do ficheiro preseed.cfg
Neste punto temos que editar  plantilla `preseed.cfg` e para elo sempre será de utilidade consultar a documentación " [ Contents of the preconfiguration file](https://www.debian.org/releases/wheezy/amd64/apbs04.html.en)". Algúns elementos a destacar son os seguintes 


### 3.1 Os locales:  
Configuración do idioma, país e «locale»

```txt
d-i debian-installer/language string es   
d-i debian-installer/country string ES   
d-i debian-installer/locale string es_ES.UTF-8
```

### 3.2 Teclado:  
Configuración do teclado. 

```txt
d-i keyboard-configuration/xkb-keymap select es
```

  
### 3.3 Configuración de rede:  
Calquera nome de host e de dominio que se obteñan por DHCP utilízanse antes que os valores aquí definidos. Por outra banda, definir os valores impide que se mostren as preguntas, mesmo se os valores proveñen de DHCP.

```
d-i netcfg/get_hostname string debian10   
d-i netcfg/get_domain string localdomain
```

### 3.4 Usuario root:  
Configuración do contrasinal de root e podemos incluir a clave en **claro** ou **cifrado**. 

```
d-i passwd/root-password-crypted password 4ab7772b776360f6303f50d70dae85ff 
```

**Para encriptar a contrasinal, dende o terminal executa:**  
`mkpasswd -m sha-512 'password'`

**Usuario normal:**
```
d-i passwd/user-fullname string alumno   
d-i passwd/username string alumno   
d-i passwd/user-password-crypted password $6$9boh2CWRDEyFNubd$aZUkxNhkQYm3Sjd8bNmwfrL5n.eISQgqwPJ4eTtmlAjfH7aTSsUzjtnY2ILseZUalpefSG609b/R3s44njZ800
```

### 3.5 Fuso horario:  
Podes consultar os valores válidos das zonas  */usr/share/zoneinfo/* .

`d-i time/zone string Europe/Madrid`

### 3.6 Particionado:  
Pódese elexir calquera das tres opcións para o particionado: 

 - **atomic**: todos os arquivos nunha partición
 - **home**:   separa a partición /home
 - **multi**:  separar ás particións /home, /var e /tmp


`d-i partman-auto/choose_recipe select home`

  
`atomic` (todo na mesma partición), `home` ( `/home` separada) ou `multi` ( `/home, /var` e `/tmp` separadas)

### 3.7 Configurando APT:  
```
d-i apt-setup/use_mirror boolean true  
d-i apt-setup/services-select multiselect security, updates   d-i apt-setup/security_host string security.debian.org   
d-i apt-setup/local0/repository string \   http://local.server/debian stable main   
d-i apt-setup/local0/comment string local server   
d-i apt-setup/local0/source boolean true   
d-i apt-setup/multiarch string i386
```

Selección de paquetes:  
`tasksel tasksel/first multiselect standard, xfce-desktop   d-i pkgsel/include string openssh-server build-essential 2`

Envío de estadísticas:  
`popularity-contest popularity-contest/participate boolean false`


<div style="page-break-after: always;"></div>

## 4.  Xerar a imaxe
1. Establecmos os permisos de escritura ao DIR *install.amd* 
```bash
$ chmod +w -R isofiles/install.amd/
```

2. Descompactamos a imaxe *initrd*


```bash
$ gunzip isofiles/install.amd/initrd.gz

```

3. Agregamos o arquivo **preseed.cfg** a **initrd**

```bash
$ echo preseed.cfg | cpio -H newc -o -A -F isofiles/install.amd/initrd
```


4. Creamos de novo a imaxe initrd

```bash
$ gzip isofiles/install.amd/initrd

```

5. Quitamos o permiso de escritura ao DIR **install.amd**

```bash
chmod -w -R isofiles/install.amd/
```

6. **Modificación dos parámetros do sistema de arrinque "ISOLINUX"**
Debemos editar o ficheiro isolinux/isolinux.cfg e eliminar a liña default **vesamenu.c32** isto evitará que se mostre o menú de instalación de Debian. 

Outra alternativa é comentar o ficheiro coa liña **vesamenu.c32** . 

Exemplo do ficheiro: 
```bash
# D-I config version 2.0
# search path for the c32 support libraries (libcom32, libutil etc.)
path 
include menu.cfg
#default vesamenu.c32
prompt 0
timeout 0

```
7. **Modificación dos parámetros do arrique GRUB**
Temos que editar o ficheiro boot/grub/grub.cfg e agregar as seguintes liñas as cales evitarán que se mostre o menú de instalación de Debian.

```txt
set timeout_style=hidden
set timeout=0
set default=1
```

8.  Xeración do MD5 (md5sum.txt)
```bash
$ cd isofiles/
$ chmod a+w md5sum.txt
$ md5sum `find -follow -type f` > md5sum.txt
$ chmod a-w md5sum.txt
```

9.  Creación da ISO 
```bash
$ cd ..
$ chmod a+w isofiles/isolinux/isolinux.bin
$ genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed-debian-10.1.0-amd64-netinst.iso isofiles
```



# Bibliobrafía
 * [Appendix B. Automating the installation using preseeding
](https://www.debian.org/releases/wheezy/amd64/apb.html.en)
   * [ Contents of the preconfiguration file](https://www.debian.org/releases/wheezy/amd64/apbs04.html.en)
   * [Contenidos del fichero de preconfiguración (para bullseye)](https://www.debian.org/releases/stable/amd64/apbs04.es.html)
 * [¿Cómo instalar Debian de forma automática o desatendida?](https://www.librebyte.net/despliegue-de-sistemas/como-instalar-debian-de-forma-automatica-o-desatendida/)
 * [Instalación desatendida de Debian](https://fainotimesma.es/2021/02/17/instalacion-desatendida-de-debian/)


