# Tarefas Vagrant

Este boletín de tarefas débese crear un directorio para cada unha das tarefas. Recorda que en cada directorio debe existir un ficheiro **Vagrantfile**. A nomenclatura para cada directorio debe ser **tarefa-nn**, onde **nn** é o número da tarefa. Por exemplo sería:

```
.
├── tarefa00
│   └── resposta.txt
├── tarefa01
│   └── Vagranfile
├── tarefa02
``` 

## Tarefa 00

Descarga o BOX de alvistack/debian  no teu directorio de traballo neste módulo. Logo realiza a importación do MV en Vagrant. Neste caso non crees un ficheiro Vagrantfile senon un ficheiro de texto co comando a executar. 

## Tarefa 01

Crea un ficheiro Vagranfile coas seguintes características:
   1. Memoria RAM: 2GiB
   2. Procesadores: 2
   3. Nome da máquina virtual: Tarefa-ex01
   4. Sistema operativo: Debian 11 (consulta o seguinte box: alvistack/debian )

A continuación debes realizar as seguintes operacións:
   1. Levanta a configuración do ficheiro vagrantfile.
   2. Accede por ssh a máquina virtual. 
   3. Muda o contrasinal do usuario vagrant por abcd1234
   4. Cerra a sesión SSH da MV.
   5. Comproba o estado da MV.
   6. Comproba os boxes instalados no entorno. 

## Exercicio 2
Crea un ficheiro Vagranfile coas seguintes características:
   1. Memoria RAM: 1GiB
   2. Procesadores: 1
   3. Nome da máquina virtual: Tarefa-ex02-server-web
   4. Nome do host: servidorweb
   5. Sistema operativo: Debian 11 (consulta o seguinte box: alvistack/debian 
   6. Incorpora no Vagranfile un script co aprovesionamento e instalación dun servidor web Apache2. O script debe estar en liña no propio ficheiro Vagrant. 

A continuación debes realizar as seguintes operacións:
   1. Configura o entorno para que realiza nat do servidor web ao porto 9080.
   2. Configura no host  o directorio web co directorio do servidor web ( /var/www/html )
   3. Incorpora no host no directorio creado un ficheiro index.html co teu nome no interior. 



## Exercicio 3
Copia o ficheiro Vagrantfile do exercicio anterior e realiza as seguintes configuracións:
    1. Asígnalle a MV a seguinte ip 192.168.20.10
    2. Crea outra MV con Windows10  e coa ip 192.168.20.10 e a seguinte configuración:
       1.  Memoria RAM: 2GiB
       2.  Procesadores: 2
       3.   Nome da máquina virtual: Win03-01

Realiza as seguintes operacións:
1. Comproba a conectividade entre ambas máquinas. 
2. Comproba no navegador web que podes acceder ao servidor web. 

