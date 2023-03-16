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

---

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
