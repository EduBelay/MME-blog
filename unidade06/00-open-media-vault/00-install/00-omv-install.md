---
marp: false
paginate: true
 header: '**Montaxe e mantemento de equipos**'
footer: 'Pablo Belay Fernández'



---
<!--
Notas para a presentación
-->
# Instalación OpenMediaVault 
 
  
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

  footer{
    float: right;
  }
</style>

<!-- _colorPreset: dark -->
---
# 01
![](01.png)

---
# 02
![](02.png)

---
# 03
![](03.png)

---
# 04
![](04.png)

---
# 05
![](05.png)

---
# 06
![](06.png)

---
# 07
![](07.png)

---
# 08
![](08.png)

---
# 09
![](09.png)

---
# 10
![](10.png)

---
# 11
![](11.png)

---
# 12
![](12.png)

---
# 13
![](13.png)

---
# 14
![](14.png)



---

Se tes algún problema coa instalación podes probar con empregar o box seguinte:
 * [Documentación](https://app.vagrantup.com/belay/boxes/omv)
```ruby 
Vagrant.configure("2") do |config|
  config.vm.box = "belay/omv"
  config.vm.box_version = "1.1"
end
```
---
# 15 -Formateo deo disco agregado de 1 GB 

![](15.png)
---
# 16
![](16.png)

---
# 17
![](17.png)

![](18.png)

---
# 19
![](19.png)

---
# Configuracion do directorio de usuarios
![](20.png)

---
# Configuracion do directorio de usuarios
## Creación do directorio

![](21.png)

---
