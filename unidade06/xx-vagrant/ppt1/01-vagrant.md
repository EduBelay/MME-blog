---
marp: true
paginate: true
# header: '**Montaxe e mantemento de equipos**'
footer: 'Pablo Belay Fernández'



---
<!--
Notas para a presentación
-->
 
![height:450px ](https://blog.ichasco.com/wp-content/uploads/2017/03/vagrant-logo.png)
  
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
# Que é? 

 * Vagrant é unha ferramenta deseñada para configurar e compartir o entorno de traballo coa mesma configuración. 
 * Emprega as tecnoloxías como os hipervisores de VirtualBox,VMWare, libvirt , ... 
 * Para adaptar unha máquina (box) podemos empregar:
   * Script shell
   * Ferramentas como: Chef, Puppet, Ansible.

---
# Que pecisamos para instalar Vagrant? 

 * Ter instalado Virtualbox ou calquera proveedor de virtualización soportado. 
 * Instalación: 
   * https://www.vagrantup.com/docs/installation/ 
  

---
# Crear unha máquina virtual sinxela. 
* Para cada proxecto crearemos un directorio.
* En cada proxecto teremos un ficheiro chamado **Vagrantfile**
 ```bash 
$ mkdir project
$ cd project

# Creamos o ficheiro Vagrantfile co box ubuntu16.04
$ vagrant init bento/ubuntu-16.04

#Levantamos a máquina
$ vagrant up 
 ```

---
# Como manipular a máquina? 
* Arrincar a máquina, a primeira vez tardará algo mais ao ter que descargar o **box**
  ```bash 
     $ vagrant up
  ```
* Deter a execución da máquina
  ```bash 
     $ vagrant halt
  ```
*  Destruir os ficheiros da máquina virtual.
   ```bash 
     $ vagrant destroy
   ``` 
*  Pausar a máquina virtual.
   ```bash 
     $ vagrant pause
   ``` 
*  Reanudar a máquina virtual.
   ```bash 
     $ vagrant resume
   ``` 
---
##  Como manipular a máquina? (II)

* Conectarse por SSH 
  ```bash 
     $ vagrant ssh
  ```
* Sair da máquina virtual. **exit**
  ```bash 
    ubuntu@ubuntu-xenial:~$ exit
  ```
*  Validar unha configuración do ficheiro Vagrantfile
   ```bash 
     $ vagrant validate
   ``` 
*  Obter axuda sobre algún comando
   ```bash 
     $ vagrant COMMAND -h
   ``` 
*  Vagrant modo debug
   ```bash 
     $ vagrant up --debug
   ``` 


---
# Vagrant box 
```bash 
     $ vagrant box [opción]
   ``` 
Subcomandos dispoñibles: 
* add
  ```bash 
     $ vagrant box add lucid32 http://files.vagrantup.com/lucid32.box
   ``` 
* list
* outdated
* prune
* remove
* repackage
* update
---

# Vagrant redirección de portos 
```vagrant 
    Vagrant::Config.run do |config|
      # Redireciona o porta 80 do guest para a porto 4567 do host
      config.vm.forward_port 80, 4567
    end
   ``` 
* forward_port é um método que recolle dous argumentos:
  * guest port - O porto na máquina virtual
  * host port -  O porto na máquina local  que imos empregar para acceder. 
* A redirección de portos aplícase durante o **vagrant up** , mais tamén podemos forzar isto unha vez lanzada con **vagrant reload**
---
# Vagrant box 
```bash 
     $ vagrant box [opción]
   ``` 
---


# Trucos: Bucles 
```vagrant 
(1..3).each do |i|
  config.vm.define "node-#{i}" do |node|
    node.vm.provision "shell",
      inline: "echo hello from node #{i}"
  end
end
``` 

```vagrant 
# THIS DOES NOT WORK!
for i in 1..3 do
  config.vm.define "node-#{i}" do |node|
    node.vm.provision "shell",
      inline: "echo hello from node #{i}"
  end
endd
end
``` 
---
# Trucos: Plugins 
```bash 
vagrant plugin [opción]
``` 
* expunge
* install
* license
* list
* repair
* uninstall
* update
<span style="color:red;">Aconsellase instalar o seguinte plugin: **vagrant-vbguest** que nos ofrece guest additions de virtualbox. </span>
```bash 
vagrant plugin  install  vagrant-vbguest
``` 
---
VER: https://friendsofvagrant.github.io/v1/docs/getting-started/provisioning.html 
