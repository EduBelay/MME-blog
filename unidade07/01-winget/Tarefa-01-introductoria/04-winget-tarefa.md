- [Tarefa Winget](#tarefa-winget)
  - [Pasos previos](#pasos-previos)
  - [Tarefa 1](#tarefa-1)
  - [Tarefa 2](#tarefa-2)
  - [Tarefa 3](#tarefa-3)
  - [Tarefa 4](#tarefa-4)
  - [Tarefa 5](#tarefa-5)
# Tarefa Winget

## Pasos previos
- Realiza unha instantanea da máquina virtual. 
- Verifica que tes instalado winget. 
- Abre o terminal de powershell en modo administrador.
## Tarefa 1 

1. Revisa os repositorios que emprega winget e mostraos nunha lista.
> winget source list 

2. Mostra a información detallada do repositorio etiquetado co nome "winget"
> winget source list winget
> winget source list -name winget

3. Engade o repositorio winget dispoñible na seguinte url "https://nexus3.onap.org/" e que teña como nome "Nexus3" 
> winget source add --name Nexus3 https://nexus3.onap.org/

4. Actualiza todos os repositorio. 
>winget source update

5. Elimina o anterior repositorio que engadiches.
> winget source remove --name Nexus3

6. Busca o id da aplicación Microsoft Teams
> winget search Teams

7. Instala  a aplicación de Microsoft Teams
> winget install --id=Microsoft.Teams  -e

8. Busca o id de  Discord
> winget search Discord

9. Instala a aplicación Discord
> winget install --id=Discord.Discord  -e

10. Desinstala a aplicación Discord 
> winget uninstall --id=Discord.Discord

11. Exporta a configuración existente nun ficheiro json co nome teu concatenado ao teu apelido. Por exemplo Pablo Belay sería **PabloBelay.json** .
> winget export -o PabloBelay.json

12. Amosa os metadatos da aplicación que instalaches previamente chamada  Microsoft.Teams
> winget show --id=Microsoft.Teams -e

## Tarefa 2 
Restaura a máquina virtual ao estado inicial e realiza a instalación das aplicacións previas empregando o ficheiro exportado no exercicio anterior.
> winget import  --import-file "PabloBelay.json" 

## Tarefa 3
Restaura a máquina virtual ao estado inicial e realiza un script en powershell para instalar as seguintes aplicacións:
- Zoom (Programa de videoconferencias)
- Gimp (Editor fotográfico)
- Notepad++
- Winrar
- VLC media Player
- Audacity


```ps1
#Script en Powershell 
 winget install --id=Zoom.Zoom -e 
 winget install --id=GIMP.GIMP -e  ; 
 winget install --id=Notepad++.Notepad++ -e  ; 
 winget install --id=RARLab.WinRAR -e  ;
 winget install --id=VideoLAN.VLC -e  ; 
 winget install --id=Audacity.Audacity -e  ; 

```

## Tarefa 4
Restaura a máquina virtual ao estado inicial e realiza un script en Batch para instalar as seguintes aplicacións:
- Zoom (Programa de videoconferencias)
- Gimp (Editor fotográfico)
- Notepad++
- Winrar
- VLC media Player
- Audacity


```bash
#Script en CMD 
winget install --id=Notepad++.Notepad++ -e  && winget install --id=RARLab.WinRAR -e  && winget install --id=GIMP.GIMP -e  && winget install --id=VideoLAN.VLC -e  && winget install --id=Audacity.Audacity -e  && winget install --id=Zoom.Zoom -e 
```

Outra posible solución:
```ps1
#Script en CMD 
  winget install --id=Zoom.Zoom -e 
  winget install --id=GIMP.GIMP -e  
  winget install --id=Notepad++.Notepad++ -e  
  winget install --id=RARLab.WinRAR -e  
  winget install --id=VideoLAN.VLC -e 
  winget install --id=Audacity.Audacity -e  
```

## Tarefa 5
Realiza o ficheiro de exportación (json) para instalar as seguintes aplicacións:
- Zoom (Programa de videoconferencias)
- Gimp (Editor fotográfico)
- Notepad++
- Winrar
- VLC media Player
- Audacity


```bash 
# comando a executar para xerar o ficheiro json coa configuración. 

  winget export -o "configuracion.json" 
```

```json 
{
  "$schema": "https://aka.ms/winget-packages.schema.1.0.json",
  "WinGetVersion": "0.3.11201",
  "Sources": [
    {
      "Packages": [
        {
          "Id": "Notepad++.Notepad++",
          "Version": "8.3.3"
        },
        {
          "Id": "RARLab.WinRAR",
          "Version": "6.11.0"
        },
        {
          "Id": "GIMP.GIMP",
          "Version": "2.10.30"
        },
        {
          "Id": "VideoLAN.VLC",
          "Version": "3.0.17"
        },
        {
          "Id": "Audacity.Audacity",
          "Version": "3.1.3"
        },
        {
          "Id": "Zoom.Zoom",
          "Version": "5.9.3931"
        }
      ],
      "SourceDetails": {
        "Argument": "https://winget.azureedge.net/cache",
        "Identifier": "Microsoft.Winget.Source_8wekyb3d8bbwe",
        "Name": "winget",
        "Type": "Microsoft.PreIndexed.Package"
      }
    }
  ]
}
```



<footer>
<p style="float:left; width: 10%;">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
</p>

<p style="float:left; width: 90%; text-align:center;">
Copyright © <a href="https://www.belay.gal">Pablo Belay Fernández, 2022 | www.belay.gal | </a>
<br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>
</p>
</footer>