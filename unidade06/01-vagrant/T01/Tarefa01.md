# Indicacións xerais
Para cada un dos exercicios a realizar terás que crear un directorio co nome do exercicio é decir algo semellante a isto:.
```
├───exercicio00
├───exercicio01
└───exercicio02
```
## Elementos a 

# Exercicio 0
Neste exercicio vamos revisar os comandos básicos de Vagrant. Debes contestar no apartado reservado para cada caso:
1. Comando que nos permite comprobar o listado de **box** dispoñibles en local?
   
    ```powershell
    $ vagrant box list
    ```
2. Comando que nos permite comprobar se existe unha actualización dalgún box? 
    ```powershell
    $ vagrant box update
    ```

3. Comando que nos permite comprobar o estado dunha MV en vagrant?
    ```powershell
    $ vagrant status
    ```

4. Comando que nos permite comprobar o estado global das MV en vagrant?
    ```powershell
    $ vagrant global-status
    ```

5. Comando Vagrant que nos permite deter e destruir unha MV?
    ```powershell
    $ vagrant destroy
    ```

6. Comando *Vagrant* que nos permite verificar os portos abertos?
    ```powershell
    $ vagrant port
    ```
7. Comando para obter a versión de Vagrant?
    ```powershell
    $ vagrant --version
    ```
8. Comando que nos crea un ficheiro de configuración *Vagrantfile*?
    ```powershell
    $ vagrant init
    ```
9. Comando para eliminar o box con identificador *redhat*?
    ```powershell
    $ vagrant box remove redhat
    ```
10. Comando para eliminar todos os boxes ?
    ```powershell
    $ vagrant box prune
    ```
11. Comando para obter a lista de plugins instalados ?
    ```powershell
    $ vagrant plugin list
    ```


# Exercicio 1
Tes que realizar os seguintes pasos e indicar os comandos ou o contido do ficheiro de configuración que precisas.

1. Que comando nos permite crear o ficheiro **Vagrantfile** co box de Microsoft/EdgeOnWindows10 que existe na rede nesta [ligazón](https://app.vagrantup.com/Microsoft/boxes/EdgeOnWindows10)
```bat 
vagrant init Microsoft/EdgeOnWindows10
```
1. Copia o box de Windows10 que existe na NAS no instituto e importao para que se chegame win10. Indica o comando de importación.
``vagrant box add win10 ruta/ficheiro.box``

2.  Incializa o ficheiro vagrantfile indicando o nome do box importado. 
   ``vagrant box init win10``
3.  Configura o **Vagrantfile** coas seguintes características.
    1.  CPU: 3
    2.  RAM: 4GiB
    3.  Nome do equipo: PC-*oTeuNome*
    4.  Nome da MV: PRC01-*oTeuNome*
    5.  IP estática: 192.168.56.101
    6.  Execute o script chamado **deploy.bat**
4. Verifica por cada elemento dos descritos que o ficheiro é valido e desplega a MV para validar que se cumpre cos pasos descriptos. 
5. Accede por SSH a MV creada e crea un directorio co teu nome. Entrega unha captura chamado **ex01-02.png**. 


Elementos a entregar:
1. Ficheiro VagrantFile
2. Capturas indicadas.  



# Exercicio 2
Tes que realizar os seguintes pasos e indicar os comandos ou o contido do ficheiro de configuración que precisas. Neste escenario vas ter que configurar dúas MV no mesmo *Vagrantfile*.

## Equipo 1

1. Copia o box de Debian11 que existe na NAS no instituto e importao para que se chegame Deb11. Indica o comando de importación.
``vagrant box add deb11 ruta/ficheiro.box``

2.  Incializa o ficheiro vagrantfile indicando o nome do box importado. 
   ``vagrant box init deb11``
3.  Configura o **Vagrantfile** coas seguintes características:
    1.  CPU: 2
    2.  RAM: 2GiB
    3.  Nome do equipo: web-*oTeuNome*
    4.  Nome da MV: web-*oTeuNome*
    5.  IP estática: 192.168.56.201
    6.  Execute o script chamado **web.sh**
    7.  Comparte o directorio /var/www/html/ co directorio web no host.
    8.  Crea nat do porto 80 ao 9090 do host. 
4. Verifica por cada elemento dos descritos que o ficheiro é valido e desplega a MV para validar que se cumpre cos pasos descriptos. 
5. Accede por SSH a MV creada e crea un ficheiro chamado **index.html** e que conteña o seguinte: ```<h1> Son o teu nome </h1> <p> Web personal dun alumno de SMR </p>```
6. Accede dende o navegador do host e verifica que temos acceso ao servidor web. Achega unha captura chamado Ex02-00.png. 
7. Que comando nos permite verificar os portos abertos ? 
``vagrant port``

## Equipo 2

1. O segundo equipo terá que empregar o box de **win10** creado previamente. . 
 2.  Configura o **Vagrantfile** coas seguintes características.
    1.  CPU: 4
    2.  RAM: 4GiB
    3.  Nome do equipo: Win-*oTeuNome*
    4.  Nome da MV: Win-*oTeuNome*
    5.  IP estática: 192.168.56.202
     
2. Verifica por cada elemento dos descritos que o ficheiro é valido e desplega a MV para validar que se cumpre cos pasos descriptos. 
3. Verifica que se ten conectividade co servidor web empregando ping. Achega unha captura que se chame Ex02-01.png. 
4.  Verifica que se accede ao servidor  web empregando o navegado. Achega unha captura que se chame Ex03-01.png.

Elementos a entregar:
1. Ficheiro VagrantFile
2. Capturas indicadas.  
