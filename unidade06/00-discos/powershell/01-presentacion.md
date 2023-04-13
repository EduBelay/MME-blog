---
marp: true
paginate: true
# header: '**Montaxe e mantemento de equipos**'
footer: 'Pablo Belay Fernández'



---
<!--
Notas para a presentación
-->
<h1> Xestión de discos en Powershell</h1>

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



 ---
# Administración do disco en PowerShell
Recorda sempre abrir o terminal como administrador (tes que facer co botón dereito sobre a icona e picar en *executar como Administrador*). Os comandos máis habituais:
* Get-Disk
* Get-PhysicalDisk 
* Get-StoragePool
* Initialize-Disk
* Format-Volume 
  * Format-Volume -DriveLetter D-FileSystem NTFS -NewFileSystemLabel DATA 
* Optimize-Volume 
  * Optimize-Volume -DriveLetter C -ReTrim -Verbose
  * Optimize-Volume -DriveLetter C -Defrag -Verbose
* Resize-VirtualDisk

---
# Administración do disco en PowerShell
Para coñecer tódalas alternativas en PowerShell para a xestión do almacenamento podes empregar o comando  
```Powershell
Get-Command -Module Storage 
```

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
# Initialize-Disk
* Inicializa un disco novo cando é agregado a primeira vez é decir crealle unha táboa de particións.  
* Por exemplo agrega un novo disco e verifica con `Get-Disk` que este ten a primeira vez unha táboa de particións de tipo **RAW**, a continuación inicializa o disco.
* Exemplos de inicialización:

```powershell 
# Inicializa o disco número 1 e por defecto se non lle indicamos nada será de tipo GPT
Initialize-Disk -Number 1

# Inicializa o disco 1 cunha táboa de tipo MBR
Initialize-Disk -Number 1 -PartitionStyle MBR

```
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
# Format-Volume 
* [Documentación](https://learn.microsoft.com/en-us/powershell/module/storage/format-volume?view=windowsserver2022-ps) .
  * `help format-volume`
* Tipos de sist. de ficheiros válidos `FAT, FAT32, exFAT, NTFS, ReFS`
```powershell 
# Formato rápido
Format-Volume -DriveLetter D
# Formato FAT32 
Format-Volume -DriveLetter D -FileSystem FAT32 -Full -Force
# Formato NTFS con tamaño de cluster 8192 
Format-Volume -DriveLetter D -FileSystem NTFS -AllocationUnitSize 8192

```

---
# Get-Partition
 * [Documentación](https://learn.microsoft.com/en-us/powershell/module/storage/get-partition?view=windowsserver2022-ps)
   * `help Get-Partition`

* Obtén toda a información das particións do sistema
  ```powershell
      Get-Partition
    ``` 
--- 
## Get-Partition
* Obtén toda a información das particións do sistema do disco número 1
  * ```powershell
    Get-Partition -DiskNumber 1
     ``` 

* Obtén toda a información das particións do sistema do disco  con letra C
  * ```powershell
     Get-Partition -DriveLetter C
    ``` 
* Obtén toda a información das particións do sistema do disco número 1 e 2 (a vez)
  * ```powershell
      Get-Partition -DiskNumber 1,2
    ``` 

---
## New-Partition e  Remove-Partition
* Crea unha nova partición 
    ```Powershell
    # Crea unha nova partición no disco 1 do máximo do espazo dispoñible  
    New-Partition -DiskNumber 0 -UseMaximumSize -DriveLetter T

    # Elimina a partición polo súa letra 
    Remove-Partition -DriveLetter T

    # Crea  unha partición de 500MB 
    New-Partition -DiskNumber 0 -Size 500MB

    # Elimina o disco por medio do nº de disco e nº de partición 
    Remove-Partition -DiskNumber 0 -PartitionNumber 1
    ```
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
* Obtén unha lista dos volumes cuxa saúde e **Healthy**
  * ```powershell
      get-volume | Where-Object HealthStatus -eq Healthy
    ``` 
--- 
## Get-Volume 

* Obtén unha lista dos volumes cuxa sistema de ficheiros  é **NTFS**
* ```powershell
    get-volume | Where-Object FileSystem -eq NTFS 
  ``` 
---
#  Optimize-Volume
* Optimiza o volumen con operacións como a desfragmentación, consolidación ,... 
  * [Documentación](https://learn.microsoft.com/en-us/powershell/module/storage/optimize-volume?view=windowsserver2022-ps)
* ```powershell
    #Analiza o volumen
    Optimize-Volume -DriveLetter H -Analyze -Verbose

    # Desfragmenta
    Optimize-Volume -DriveLetter H -Defrag -Verbose

    #  realizar la optimización TRIM
    Optimize-Volume -DriveLetter H -ReTrim -Verbose
  ``` 
