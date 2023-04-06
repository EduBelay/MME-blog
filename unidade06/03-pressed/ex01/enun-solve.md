# PRC01 - Pressed 
Nesta tarefa tes que descargar a plantilla de **pressed** e realizar as configuracións indicadas en cada un dos pasos..

 
1 - Instalador en español: 

 ```bash
    d-i debian-installer/locale string es_ES

    # The values can also be preseeded individually for greater flexibility.
    d-i debian-installer/language string es
    d-i debian-installer/country string es 
    d-i debian-installer/locale string  es_ES.UTF-8 
  ```
  

2 - Teclado en español: 

```bash
d-i keyboard-configuration/xkb-keymap select es
```

3 - Escoller a interface de rede eth1 

```bash
d-i netcfg/choose_interface select eth1
```

4 - Configuración da IP estática coa ip **192.168.10.142** e máscara /24, ademais a porta de enlace é 192.168.10.1 : 

```bash
d-i netcfg/get_ipaddress string 192.168.10.142
d-i netcfg/get_netmask string 255.255.255.0
d-i netcfg/get_gateway string 192.168.10.1
d-i netcfg/get_nameservers string 192.168.10.1
d-i netcfg/confirm_static boolean true
```

5 - Nome de host **ALD-login-alumno**, reemplaza polo teu login. 
6 - Contrasinal do usuario root `galiza` en texto claro 
7 - Engade o usuario por defecto:
    * Nome completo: Profesor MME 
    * Login: profmme
    * Clave: profe1234


```bash 
# To create a normal user account.
d-i passwd/user-fullname string Profesor MME
d-i passwd/username string profmme
# Normal user's password, either in clear text
d-i passwd/user-password password profe1234
```

8 - Configura a zona horaria de Portugal (Lisboa).

```bash 
d-i clock-setup/utc boolean true
d-i time/zone string Europe/Lisbon
```

9 - Configura o servidor de hora seguinte: 1.pt.pool.ntp.org

```bash 
# Controls whether to use NTP to set the clock during the install
d-i clock-setup/ntp boolean true  
# NTP server to use. The default is almost always fine here.
d-i clock-setup/ntp-server string 1.pt.pool.ntp.org
```

10 - Emprega o particionado de tipo LVM e cifrado 

```bash 
d-i partman-auto/method string crypto 
```

11 - O particionado debe empregar o máximo dispoñible. 

```bash 
d-i partman-auto-lvm/guided_size string max
```

12 - Crease unha partición separada cada un dos directorios /home, /var e /tmp


```bash 

d-i partman-auto/choose_recipe select multi

```

# Cuestións:
1 - Que datos nos solicitou a instalación deste ficheiro?
  1 - Confirmar a clave de root e do usuario
  2 -  O continenente dos locales. 
  3 - A clave para cifrado do disco. 
  4 - Estadísticas de uso para os desenvolvedores (popularity)
  5 - Seleccion de programas (entorno)
  6 - Dispositivo para configurar o arranque 
  
