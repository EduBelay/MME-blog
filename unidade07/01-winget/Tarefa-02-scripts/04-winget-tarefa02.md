- [Pasos previos](#pasos-previos)
- [Tarefa 1  - Corrixe os erros no seguinte script.](#tarefa-1----corrixe-os-erros-no-seguinte-script)
  - [Entregables:](#entregables)
  - [Solución](#solución)
- [Tarefa 2](#tarefa-2)
  - [Entregables:](#entregables-1)
  - [Solución](#solución-1)
- [Tarefa 3](#tarefa-3)
  - [Entregable](#entregable)
  - [Solución](#solución-2)
<h1> Tarefa Winget</h1>

# Pasos previos
- Realiza unha clonación da máquina virtual de maneira link que se chame  "MME-22-NomeApelido". 
- Realiza unha instantanea da máquina virtual coa configuración inicial.  
- Verifica que tes instalado winget. 
- Abre o terminal de powershell en modo administrador.
- Recorda que para executar os scripts previamente temos que mudar as "policy". ```Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine ```


# Tarefa 1  - Corrixe os erros no seguinte script. 

```ps
 winget install --id=mozilla.firefox -e  ;
 winget install   id=BraveSoftware.BraveBrowser -e  ; 
 winget install --id=OperaOpera -e  ;
 winget install  -i=LibreWolf.LibreWolf -e  ; 
 winget install --id=Microsoft.Edge -e  ; 
 winget install --id=Firefox.DeveloperEdition -v "99.0b6" 
 ```

 ## Entregables:
 * Ficheiro powershell sen erros do script chamado 01.ps1 
 * Ficheiro de texto explicando os erros chamado 01.txt 

## Solución 
Os erros son: 
* Temos un erro no id de Firefox que é "Mozilla.Firefox" recorda que a opción -e obriganos que sexa idéntico. 
* Faltan os "--" no id na segunda liña do script. 
* O ID de opera non é correcto falta un punto no medio sendo o correcto o seguinte: "Opera.Opera". 
* O erro nesta liña ``` winget install  -i=LibreWolf.LibreWolf -e  ; ``` atópase que non existe a opción -i como equivalente de --id . Se revisas a axuda -i é --interactive.
* O erro nesta liña é ``` winget install --id=Firefox.DeveloperEdition -v "99.0b6"  ``` que se comeu parte do nome da aplicación que sería: ```  winget install --id=Mozilla.Firefox.DeveloperEdition -v "99.0b6" -e  ```
```ps
 winget install --id=Mozilla.Firefox -e  ;
 winget install --id=BraveSoftware.BraveBrowser -e  ; 
 winget install --id=Opera.Opera -e  ;
 winget install --id=LibreWolf.LibreWolf -e  ; 
 winget install --id=Microsoft.Edge -e  ; 
 winget install --id=Mozilla.Firefox.DeveloperEdition -v "99.0b6" -e 
```

# Tarefa 2 
Restaura a máquina virtual ao estado inicial. Executa o script da tarefa anterior de maneira que valides o funcionamento. Unha vez executado o script verifica que se instalaron todas as aplicación xerando un ficheiro **json** con winget coa configuración realizada. 

 ## Entregables:
 * Ficheiro powershell co comando para xerar o **json** e este tense que chamar 02nomeapelido.ps1 
 * Ficheiro **json** coas aplicacións instaladas chamado 02nomeapelido.json 

## Solución 
```ps1
winget export -o "02_pablo_belay.json" 
```

```json 
{
  "$schema": "https://aka.ms/winget-packages.schema.1.0.json",
  "WinGetVersion": "0.3.11201",
  "Sources": [
    {
      "Packages": [
        {
          "Id": "Mozilla.Firefox",
          "Version": "98.0.2"
        },
        {
          "Id": "BraveSoftware.BraveBrowser",
          "Version": "100.1.37.107"
        },
        {
          "Id": "Opera.Opera",
          "Version": "85.0.4341.18"
        },
        {
          "Id": "LibreWolf.LibreWolf",
          "Version": "98.0.2"
        },
        {
          "Id": "Microsoft.Edge",
          "Version": "99.0.1150.55"
        },
        {
          "Id": "Mozilla.Firefox.DeveloperEdition",
          "Version": "99.0b6"
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


# Tarefa 3
Restaura a máquina virtual ao estado inicial e realiza a importación do **json** creado na anterior tarefa. 

## Entregable 
 * Ficheiro powershell co comando para importar o json xerado no exercicio anterio. O ficheiro chamaráse 03nomeapelido.ps1 
 * Captura donde se visualiza a execución do script. A captura ten que abarcar toda a pantalla da máquina virtual. Chámalle a captura **03NomeApelido.png**

## Solución 
>  winget import  --import-file "PabloBelay.json" 


<footer>
<p style="float:left; width: 10%;">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
</p>

<p style="float:left; width: 90%; text-align:center;">
Copyright © <a href="https://www.belay.gal">Pablo Belay Fernández, 2022 | www.belay.gal | </a>
<br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>
</p>
</footer>