- [Pasos previos](#pasos-previos)
- [Tarefa 1 - Corrixe os erros no seguinte script.](#tarefa-1---corrixe-os-erros-no-seguinte-script)
  - [Entregables:](#entregables)
- [Tarefa 2](#tarefa-2)
  - [Entregables:](#entregables-1)
- [Tarefa 3](#tarefa-3)
  - [Entregable](#entregable)
  <h1> Tarefa Winget</h1>

# Pasos previos

- Realiza unha clonación da máquina virtual de maneira link que se chame "MME-22-NomeApelido".
- Realiza unha instantanea da máquina virtual coa configuración inicial.
- Verifica que tes instalado winget.
- Abre o terminal de powershell en modo administrador.
- Recorda que para executar os scripts previamente temos que mudar as "policy". `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine `

# Tarefa 1 - Corrixe os erros no seguinte script.

```ps
 winget install --id=mozilla.firefox -e  ;
 winget install   id=BraveSoftware.BraveBrowser -e  ;
 winget install --id=OperaOpera -e  ;
 winget install  -i=LibreWolf.LibreWolf -e  ;
 winget install --id=Microsoft.Edge -e  ;
 winget install --id=Firefox.DeveloperEdition -v "99.0b6"
```

## Entregables:

- Ficheiro powershell sen erros do script chamado 01.ps1
- Ficheiro de texto explicando os erros chamado 01.txt

# Tarefa 2

Restaura a máquina virtual ao estado inicial. Executa o script da tarefa anterior de maneira que valides o funcionamento. Unha vez executado o script verifica que se instalaron todas as aplicación xerando un ficheiro **json** con winget coa configuración realizada.

## Entregables:

- Ficheiro powershell co comando para xerar o **json** e este tense que chamar 02nomeapelido.ps1
- Ficheiro **json** coas aplicacións instaladas chamado 02nomeapelido.json

# Tarefa 3

Restaura a máquina virtual ao estado inicial e realiza a importación do **json** creado na anterior tarefa.

## Entregable

- Ficheiro powershell co comando para importar o json xerado no exercicio anterio. O ficheiro chamaráse 03nomeapelido.ps1
- Captura donde se visualiza a execución do script. A captura ten que abarcar toda a pantalla da máquina virtual. Chámalle a captura **03NomeApelido.png**



<footer>
<p style="float:left; width: 10%;">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
</p>

<p style="float:left; width: 90%; text-align:center;">
Copyright © <a href="https://www.belay.gal">Pablo Belay Fernández, 2022 | www.belay.gal | </a>
<br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>
</p>
</footer>