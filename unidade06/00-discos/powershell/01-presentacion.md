---
marp: true
paginate: true
# header: '**Montaxe e mantemento de equipos**'
footer: 'Pablo Belay Fernández'



---
<!--
Notas para a presentación
-->
# Xestión de discos en Powershell
 ![](https://i.imgur.com/QIwMinq.png)  
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
- [Xestión de discos en Powershell](#xestión-de-discos-en-powershell)
- [Get-Disk](#get-disk)
  - [Exemplos: Get-Disk](#exemplos-get-disk)
  - [Exemplos: Get-Disk](#exemplos-get-disk-1)
  - [Exemplos: Get-Disk](#exemplos-get-disk-2)
  - [Exemplos: Get-Disk](#exemplos-get-disk-3)
  - [Exemplos: Get-PhysicalDisk](#exemplos-get-physicaldisk)
- [Get-Partition](#get-partition)
- [Get-Volume](#get-volume)
  - [Get-Volume](#get-volume-1)

 


---
# Get-Disk
* [Documentación](https://learn.microsoft.com/en-us/powershell/module/storage/get-disk?view=windowsserver2022-ps)
* Este cmdlet devolve obxectos de disco físico como discos básicos e particións de unidades particionadas
* <span style="color:red">Os discos dinámicos poden abarcar varios elementos físicos, polo que Get-Disk non os devolverá. </span>

---
## Exemplos: Get-Disk

* Mostrar información sobre os discos, para elo teremos información como estado de “saúde” tipo de táboa de particións, nome, nº de disco.
* ```powershell
    Get-disk
  ``` 
* A información anterior podemos mostrala en formato lista realizando unha tubería con “fl” (Formato Lista) .
* ```powershell
    Get-disk | fl 
  ``` 
---
## Exemplos: Get-Disk

* Obter información dun único disco sabendo o seu número
* ```powershell
    Get-Disk -Number 0
  ``` 
* O comando permítenos obter información sobre cal é o disco que ten instalado o sistema operativo. **Fíxate o parámetro despois de  Where-Object  é unha das propiedades que obtemos ao realizar Get-Disk**
* ```powershell
    Get-Disk | Where-Object IsSystem -eq $True | fl

    Get-Disk | Where-Object IsSystem -eq $True 
  ``` 
---
## Exemplos: Get-Disk

* Ao empregar   **Where-Object**  é sinxelo filtrar aqueles discos que se atopan **offline**.
* ```powershell
    Get-Disk | Where-Object IsOffline –Eq $True| ft
  ``` 
* Ao empregar    **Where-Object**  é sinxelo filtrar aqueles discos que sexan **Boot**
* ```powershell
    Get-Disk | Where-Object IsBoot –Eq $True| ft
  ``` 
---
## Exemplos: Get-Disk

* Ao empregar    **Where-Object**  é sinxelo filtrar aqueles discos que teñan un tamaño de 12Gb
* ```powershell
    Get-Disk | Where-Object IsBoot –Eq $True| ft

    # Discos con tamaño maior a 600 GB 
    Get-Disk | Where-Object size –gt 600GB | ft

    # Discos con tamaño menor a 600 GB 
    Get-Disk | Where-Object size le 600GB | ft
  ``` 
* [Documentación comparación PS](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.3) 


---
# Get-PhysicalDisk
* [Documentación de Microsoft.](https://learn.microsoft.com/en-us/powershell/module/storage/get-physicaldisk?view=windowsserver2022-ps)
* Obtén unha lista de todos os obxectos de PhysicalDisk visibles. 

```powershell  
# axuda 
help Get-PhysicalDisk
```

---
## Exemplos: Get-PhysicalDisk

* Obtén a información física dos discos existentes no sistema
* ```powershell
    Get-PhysicalDisk
  ``` 

* Obtén a información física dos discos existentes no sistema, que teñan como modelo “Vbox Harddisk”.
* ```powershell
    Get-PhysicalDisk | Where-Object model -like SAMSUNG
  ``` 
---
# Get-Partition
* Obtén unha lista de todas as particións
* [Documentación](https://learn.microsoft.com/en-us/powershell/module/storage/get-partition?view=windowsserver2022-ps)

* Obtén toda a información das particións do sistema
* ```powershell
    Get-Partition
  ``` 
--- 
## Get-Partition
* Obtén toda a información das particións do sistema do disco número 1
* ```powershell
    Get-Partition -DiskNumber 5
  ``` 

* Obtén toda a información das particións do sistema do disco  con letra C
* ```powershell
    Get-Partition -DriveLetter C
  ``` 
--- 
## Get-Partition
* Obtén toda a información das particións do sistema do disco número 1 e 2 (a vez)
* ```powershell
    Get-Partition -DiskNumber 1,2
  ``` 
* 
--- 
# Get-Volume 

* Obtén unha lista dos volumes do sistema.
* ```powershell
    get-volume
  ``` 

* Obtén unha lista dos volumes do sistema que teña asignada a letra “C”
* ```powershell
    Get-Volume -DriveLetter C
  ``` 

--- 
## Get-Volume 
* Obtén unha lista dos volumes cuxa saúde e **Healthy**
* ```powershell
    get-volume | Where-Object HealthStatus -eq Healthy
  ``` 
* Obtén unha lista dos volumes cuxa sistema de ficheiros  é **NTFS**
* ```powershell
    get-volume | Where-Object FileSystem -eq NTFS 
  ``` 