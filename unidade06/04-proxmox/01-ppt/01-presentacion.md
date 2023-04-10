---
marp: false
paginate: true
# header: '**Montaxe e mantemento de equipos**'
footer: 'Pablo Belay Fernández'



---
<!--
Notas para a presentación
-->
# Proxmox 
![height:450px ](img/00-proxmox.png)
  
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
# Que é? 

 *  Un servidor de virtualización basado en Debian  e cuxa administración pódese realizar dende unha web. 
 *  Permite empregar as tecnoloxías de : KVM e contenedores LXC. 
 * KVM fai a reserva de recursos no intre que arrinca a MV mentras  LXC  vai reservando recursos a demanda. 
   ![w:200px](img/01-diferencia-kvm-container.png)

  * Fonte: [https://www.nine.ch/en/engineering-logbook/kvm-vs-container-en](https://www.nine.ch/en/engineering-logbook/kvm-vs-container-en)

--- 
# Instalación
* RAM: 8 GiB
* Procesadores: 8
* Disco: 120 Gib (tipo vdi con reserva dinámica)
![](img/02.png)

--- 
![h:100px](img/03.png)
![h:200px](img/04.png)

--- 
## Configuración da ISO Booteable. 

![](img/04.png)

---

![](img/05.png)

---

![](img/06.png)

---

![](img/07.png)

--- 

![](img/08.png)

---

![](img/09.png)

---

![](img/10.png)

---

![](img/11.png)

---

![](img/12.png)

---

![](img/13.png)

---

---

---
# Vagrant Proxmox Provider
* [Documentación](https://github.com/telcat/vagrant-proxmox)
* Instalar o plugin 
```bash
$ Vagrant Proxmox Provider

```
Uso
```bash
$ vagrant box add dummy dummy_box/dummy.box

```
--- 

## Vagrant Proxmox Provider
O ficheiro Vagrant será semellante ao seguinte:
```ruby
Vagrant.configure('2') do |config|

    config.vm.provider :proxmox do |proxmox|
        proxmox.endpoint = 'https://your.proxmox.server:8006/api2/json'
        proxmox.user_name = 'proxmox_username@pam'
        proxmox.password = 'proxmox_password'
        proxmox.vm_id_range = 900..910
        proxmox.vm_name_prefix = 'vagrant_'
        proxmox.openvz_os_template = 'local:vztmpl/vagrant-proxmox-ubuntu-12.tar.gz'
        proxmox.vm_type = :openvz
        proxmox.vm_memory = 256
    end
    
    config.vm.define :box, primary: true do |box|
        box.vm.box = 'dummy'
        box.vm.network :public_network, ip: '192.168.0.1'
    end
    
end
```
