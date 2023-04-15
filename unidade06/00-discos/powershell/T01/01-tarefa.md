# Exercicio 1 
Na máquina virtual proporcionada agrega 5 discos cos seguintes tamaños dous discos de 1GB, un disco de  2GB, un disco de 3GB e un disco de 1GB 4GB. 
Para cada un dos discos aplícallle o seguinte sistema de ficheiros:
* Cos dous discos de 1GB crea un RAID espello. 
* Disco 2GB , táboa MBR con un disco que ocupe todo o espazo dispoñible co sistema de ficheiros FAT32
* Disco 3GB , táboa MBR con un disco que ocupe todo o espazo dispoñible co sistema de ficheiros NTFS
* Disco 4GB , táboa GPT con un disco que conteña duas particións co mesmo tamaño e coas seguintes etiquetas: "**Datos**" e "**Backup**". 

## get-disk 
1. Agrega na MV de Virtualbox con Windows10 un disco de 50 GB e logo verifica cal é a súa táboa de particións. Que comando debes empregar? 
   ```powershell
   get-disk 
   ```
2. Como podemos mostrar a información anterior en formato lista? 
   ```powershell
   get-disk  | fl 
   ```

3. Como podes obter unha lista dos discos que son booteables? 
    ```powershell
   get-disk | where-object IsBoot -eq $true
   ```

4.  Como podes obter unha lista dos discos que NON son booteables? 
    ```powershell
    get-disk | where-object IsBoot -eq $false
    ```

5.  Como podes obter unha lista dos discos que teñen a táboa de particións GPT? 
    ```powershell
    get-disk | Where-Object PartitionStyle -eq GPT
    ```
6. Como podes obter unha lista dos discos que teñen táboa de particións GPT e a vez son booteables? Para isto tes esta pequena axuda que nos permite seleccionar dous discos polo con identificadores distintos `get-disk | Where-Object {($_.Number -eq "1") -or ($_.Number -eq "0")}`
   ```powershell
    get-disk | Where-Object {($_.IsBoot -eq $true) -and ($_.PartitionStyle -eq "GPT")}
    ```
7. Como podes obter unha lista dos discos que teñen táboa de particións GPT **OU** que sexan booteables? 
   ```powershell
    get-disk | Where-Object {($_.IsBoot -eq $true) -or ($_.PartitionStyle -eq "GPT")}
    ```
 8. Como podes obter unha lista dos discos que teñen  un tamaño inferior a 52 GB
    ```powershell
    get-disk | Where-Object Size -lt 52GB
    ```   
 9. Como podes obter unha lista dos discos que teñen  tres particións. 
    ```powershell
     get-disk | Where-Object NumberOfPartitions -eq 3
    ```  
 10. Como podes obter unha lista dos discos que teñen  tres particións e teñan un tamaño superior a 52GB. 
        ```powershell
        get-disk | Where-Object {($_.NumberOfPartitions -eq 3) -or ($_.Size -gt 52GB)}
        ```  
 11. Obter información dun único disco sabendo o seu número e sen empregar `where-object` 
        ```powershell
        Get-Disk -Number 0
        ```  
 12.  obter a información sobre cal é o disco que ten instalado o sistema operativo. Fíxate o parámetro despois de  Where-Object  é unha das propiedades que obtemos ao realizar Get-Disk
        ```powershell
          # Opcion 1
          Get-Disk | Where-Object IsSystem -eq $True | fl
          # Opción 2 
         Get-Disk | Where-Object IsSystem -eq $True 
        ```  

 13.  Obtén que discos se atopan desconectados (offline)
        ```powershell
           Get-Disk | Where-Object IsOffline –Eq $True| ft
        ```  

 ## Get-PhysicalDisk 

14. Obter todos os discos que sexan de tipo Pool.

   ```powershell
   Get-PhysicalDisk -CanPool $True
   ```  
15. Obter todos os discos que sexan de tipo "SATA"
   ```powershell
    Get-PhysicalDisk | Where-Object Bustype -eq "SATA"
   ```  

16.  Obter todos os discos que sexan de tipo "NVMe"
  ```powershell
    Get-PhysicalDisk | Where-Object Bustype -eq "NVMe"
   ```  

17. Obter todos os discos que sexan de tipo "SSD" (MediaType)
  ```powershell
    Get-PhysicalDisk | Where-Object MediaType -eq "SSD"
   ```  
18. Obter todos os discos que non teña un estado saudable. (HealthStatus)  
  ```powershell
    Get-PhysicalDisk | Where-Object HealthStatus -ne "Healthy"
   ```  

 ## Get-Partition

 19. Obtén toda a información das particións do sistema
  ```powershell
     Get-Partition
   ```  

20. Obtén toda a información das particións do sistema do disco número 1
  ```powershell
     Get-Partition -DiskNumber 1
   ```  
21. Obtén toda a información das particións do sistema do disco  con letra C
  ```powershell
     Get-Partition -DriveLetter C
   ```  

22. Obtén toda a información das particións do sistema do disco número 1 e 2 (a vez)
  ```powershell
     Get-Partition -DiskNumber 1,2
   ```  
23. Obtén toda a información da partición por medio dos seguintes identificadores:
    1.  Disco nº : 1
    2.  Partición nº: 2
    
     (Non empregues o comando where-object)
  ```powershell
      get-partition  -disknumber 1 -partitionnumber  2
   ```  
24.   Obtén todas as particións que NON se atopan ocultas
  ```powershell
     Get-Partition | where-object  IsHidden -ne $True
   ```  
25.   Obtén todas as particións que  se atopan ocultas
  ```powershell
     Get-Partition | where-object  IsHidden -eq $True
   ``` 
26.   Obtén todas as particións que non sexan de *tipo* de sistema. 
  ```powershell
     Get-Partition | where-object  Type -ne System
  ```  
27.  Obtén todas as particións con tamaño menor a 500MB
  ```powershell
  Get-Partition | where-object  Size -lt 500MB

  ```   
28.  Obtén todas as particións con tamaño menor ou igual a 500MB
  ```powershell
     Get-Partition | where-object  Size -le 500MB
   ```  

## Get-Volume

29.  Obtén unha lista dos volumes do sistema. 
  ```powershell
     get-volume
  ```  
30.  Obtén unha lista dos volumes do sistema que teña asignada a letra “D”
  ```powershell
     Get-Volume -DriveLetter D
  ```  
31.  Obtén unha lista dos volumes cuxa saúde e Healthy
  ```powershell
  get-volume | Where-Object HealthStatus -eq Healthy
  ```  
32.  Obtén unha lista dos volumes cuxa sistema de ficheiros é NTFS
  ```powershell
  get-volume | Where-Object FileSystem -eq NTFS 
  ```  

33.  Obtén todos os volumenes con tamaño maior a 600MB
  ```powershell
   get-volume | where-object Size -gt 600MB
  ```  

34.   Obtén todos os volumenes co sistema de ficheiros NTFS
  ```powershell
  get-volume | where-object FileSystem -eq "NTFS"
  ```  

Chegado a este punto terás que agregar a MV un disco de 150 GB e realizar as seguintes operacións 

35.  Obtén un listado  dos discos sen táboa de particións en formato lista 
  ```powershell
    Get-Disk | where-object PartitionStyle -eq RAW | fl 
  ```  

36.   Obtén un listado  dos discos con táboa de particións en formato táboa 
  ```powershell
    Get-Disk | where-object PartitionStyle -ne RAW | ft 
  ```  

37.  Inicializa o disco  agregado indicando o seu número de identificación e cunha táboa de partición  *MBR* 
  ```powershell
   Initialize-Disk -Number 1 -PartitionStyle MBR
  ```  

38.  Recorda que se queremos mudar a táboa de particións teremos que empregar *Set-Disk -Number 1 -PartitionStyle GPT* ,verifica que se pode realizar o cambio de táboa de particóns. Poderaimos realizar o cambio ao tipo RAW? 
  ```powershell
    Set-Disk -Number 1 -PartitionStyle MBR
  ```  
39.  Crea unha nova partición indicando o nº do disco creado previamente e con tamaño do disco de 500MB
  ```powershell
  New-Partition -DiskNumber 1 -Size 500MB 
  ```  

40.  Obtén un listado de todas as particións dispoñibles no disco que empregamos anteriormente. 
  ```powershell
    Get-Partition -DiskNumber 1
  ```  
41.  Obtén un listado das particións con tamaño igual a 500MB. Fíxate no número da partición para o seguinte suposto. 
  ```powershell
    Get-Partition -DiskNumber 1 | where-object Size -eq 500MB
  ```  



## Format-Volume

Agrega un disco de 150 GB a MV e realiza os seguintes supostos. 


42.  Obtén todas as particións que non teñan táboa de particións.
  ```powershell
   get-disk | where-object PartitionStyle -eq "RAW"

  ```  

43.  Obtén todas as particións que teñan táboa de particións.
  ```powershell
   get-disk | where-object PartitionStyle -ne "RAW"

  ```  
44.  Inicializa a táboa de particións cun tipo MBR
  ```powershell
    Initialize-Disk -Number 1 -PartitionStyle MBR
  ```  

45.  Muda a táboa de particións ao tipo GPT, recorda que a inicialización só se pode realizar unha vez nas seguintes terás que empregar Set-Disk
  ```powershell
    set-disk -number 1 -partitionStyle GPT  
    ```  

46.  Crea unha nova partición no disco anterior e que teña un tamaño de 400MB e tamén coa letra de volumen P
  ```powershell
     New-Partition -DiskNumber 1 -Size 400MB  -DriveLetter P
    ```  
47.  Crea unha nova partición no disco anterior e que  ocupe todo o espazo dispoñible  e teña a letra de volumen Q
  ```powershell
     New-Partition -DiskNumber 1 -UseMaximumSize  -DriveLetter Q
    ```  

48.  Obtén todos os volumenes que teña un sistema de arquivos descoñecido (Unknown)
  ```powershell
      get-volume | where-object FileSystemType -eq "Unknown"
    ```  
49.  Obtén todos os volumenes que teña un sistema de arquivos descoñecido (Unknown) e a vez teñan como driver calquera que sexa distinto de "CD-ROM"
    ```powershell
      get-volume | where-object FileSystemType -eq "Unknown"  | where-object DriveType -ne "CD-ROM"
    ```  

50. Formatea o volume Q empregando a súa letra identificativa cun sistema de ficheiros NTFS e que teña como etiqueta identificativa "PROBAS". 

 ```powershell
      Format-Volume -DriveLetter Q -FileSystem NTFS -NewFileSystemLabel "PROBAS"
  ```  


51. Muda a etiqueta do volume por Backup 

 ```powershell
       set-volume -FileSystemLabel "PROBAS"  -NewFileSystemLabel "Backup"
 ```  


52. Formatea o volume Q de "Backup" en NTFS. 

 ```powershell
       Format-Volume -DriveLetter Q -FileSystem NTFS -Full -Force 
 ```  
53. Busca se existen erros no volume Q 

 ```powershell
       Repair-Volume -DriveLetter Q -Scan
 ```  

54. Busca se existen erros no volume coa etiqueta "Backup"

 ```powershell
        Repair-Volume -FileSystemLabel "Backup" -scan
 ```  


55. Elimina o disco P  empregando a súa letra como identificador. 

 ```powershell
       Remove-Partition -DriveLetter P
 ```  

56. Elimina o disco Q  empregando o nº de disco e nº de partición para o seu borrado. 

 ```powershell
        Remove-Partition -DiskNumber 1 -PartitionNumber 2
 ```  
