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


4 - Configuración da IP estática coa ip **192.168.10.142** e máscara /24, ademais a porta de enlace é 192.168.10.1 : 


5 - Nome de host **ALD-login-alumno**, reemplaza polo teu login. 
6 - Contrasinal do usuario root `galiza` en texto claro 
7 - Engade o usuario por defecto:
    * Nome completo: Profesor MME 
    * Login: profmme
    * Clave: profe1234


8 - Configura a zona horaria de Portugal (Lisboa).


9 - Configura o servidor de hora seguinte: 1.pt.pool.ntp.org


10 - Emprega o particionado de tipo LVM e cifrado 


11 - O particionado debe empregar o máximo dispoñible. 


12 - Crease unha partición separada cada un dos directorios /home, /var e /tmp


