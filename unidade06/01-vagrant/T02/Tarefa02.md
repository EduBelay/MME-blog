# Indicacións xerais
Para cada un dos exercicios a realizar terás que crear un directorio co nome do exercicio é decir algo semellante a isto:.
```
├───exercicio00
├───exercicio01
├───exercicio02
├───exercicio03
├───exercicio04
├───exercicio05
└───exercicio06
```


# Exercicio 00
Nesta tarefa tes que resolver os erros que existen no ficheiro Vagrantfile. Recorda que para resolver os erros empregamos o subcomando **validate**. 
```ruby
Vagrant.configure("2") do |config|
   cofig.vm.box = "debian"
   cofig.vm.define "tarefa02-exercicio00"  
end
``` 
Nesta tarefa tes que entregar o Vagrantfile sen erros un ficheiro chamado **exercicio00.txt** cun pequeno comentario como resolviches o erro. 


# Exercicio 1
Nesta tarefa tes que resolver os erros que existen no ficheiro Vagrantfile. Recorda que para resolver os erros empregamos o subcomando **validate**. 
```ruby
Vagrant.configure("2") do |config|
    config.vm.define "nodo1" do |nodo1|
      nodo1.vm.box = "debian"
      nodo1.vm.hostname = 'nodo1'
     
   
    config.vm.define "nodo2" do |nodo2|
      nodo2.vm.box = "debian"
      nodo2.vm.hostname = 'nodo2'
    
    
  end
``` 
Nesta tarefa tes que entregar o Vagrantfile sen erros un ficheiro chamado **exercicio01.txt** cun pequeno comentario como resolviches o erro. 


# Exercicio 2
Nesta tarefa tes que resolver os erros que existen no ficheiro Vagrantfile. Recorda que para resolver os erros empregamos o subcomando **validate**. 
```ruby
Vagrant.configure("2") do |config|
   config.vm.box = "debian"
   config.vm.define "tarefa02-exercicio00"  
   config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y apache2
  
end
``` 
Nesta tarefa tes que entregar o Vagrantfile sen erros un ficheiro chamado **exercicio00.txt** cun pequeno comentario como resolviches o erro. 

# Exercicio 3
Nesta tarefa tes adaptar o exercicio anterior para que o script non se defina en liña é dicir que sexa nun ficheiro externo. O script externo tense que chamar **webserver.sh** .  Nesta tarefa tes que **entregar**:
* Ficheiro **Vagrantfile** coa configuración indicada.
* Ficheiro **script** webserver.sh e cos comandos precisos para instalar o servidor web. 


# Exercicio 4
Arranxa os erros do seguinte **Vagrantfile**:

```ruby
Vagrant.configure("2") do |config|
    config.vm.hostname = "servidor web"
    config.vm.box = "debian"
    config.vm.define "tarefa02-ex04"  
    config.vm.provision "shell", inline: <<-SHELL
       apt-get update
       apt-get install -y apache2
   SHELL
 end
```
Nesta tarefa tes que **entregar**:
* Ficheiro **Vagrantfile** sen os erros. 
* Ficheiro **exercicio04.txt** coa xustificación do cambio ou cambios precisos. 




# Exercicio 5
Arranxa os erros do seguinte **Vagrantfile**:
```ruby
Vagrant.configure("2") do |config| 
  config.vm.box = "debian"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |vb|
      vb.mem = "2048"
      vb.nane = "new vm"
      vb.cpu=2
  end
 end
 ``` 

 Nesta tarefa tes que **entregar**:
* Ficheiro **Vagrantfile** coa configuración indicada.
* Ficheiro **exercicio05** explicando os erros e como se solucionan.


# Exercicio 6
Se ao validar un vagrantfile temos o seguinte erro:

```
vm:
* The host path of the shared folder is missing: compartida
```
1. Cal é o motivo? 
2. Como o podemos resolver? 


# Exercicio 7
Incorpora no seguinte exemplo un disco adicional de 4GB e recorda que esta funcionalidade é experimental en Vagrant. O disco tense que chamar **OteuNome**. 
```ruby
Vagrant.configure("2") do |config|
    config.vm.hostname = "Exercicio07"
    config.vm.box = "debian"
    config.vm.define "tarefa02-ex07"  
 end
```

 Nesta tarefa tes que **entregar**:
* Ficheiro **Vagrantfile** coa configuración indicada.
* Ficheiro **exercicio07** explicando os cambios precisos. 


# Exercicio 8
Tendo en conta o **Exercicio 1** sen erros realizado previamente adapta o Vagrantfile para que permita amosar as máquinas agrupadas en Virtualbox co nome de GrupoOteuNome. 

 Nesta tarefa tes que **entregar**:
* Ficheiro **Vagrantfile** coa configuración indicada.
* Ficheiro **exercicio08** explicando os cambios precisos. 
* 