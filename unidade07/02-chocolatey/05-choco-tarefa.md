- [Tarefa choco](#tarefa-choco)
- [Tarefa 1](#tarefa-1)
- [Tarefa 2](#tarefa-2)
  - [Tarefa 2: solución script.](#tarefa-2-solución-script)
  - [Tarefa 2: solución ficheiro xml](#tarefa-2-solución-ficheiro-xml)
- [Tarefa 3](#tarefa-3)
- [Tarefa 4](#tarefa-4)
- [Tarefa 5](#tarefa-5)


# Tarefa choco
AVISO: Antes de realizar calquera tarefa tes que crear unha **instantanea** do estado inicial do sistema operativo. 
# Tarefa 1
* Busca as aplicacións que se chama  **git**
  > choco search  git

* Busca as aplicacións que se chama  **winrar**
  > choco search  winrar

* Instala a aplicación de **winrar**
  > choco install  winrar

* Busca as aplicacións que se chama  **GoogleChrome**
  > choco search  googlechrome

* Instala a aplicación de **GoogleChrome**  a versión 99.0.4844.82 
  > choco install googlechrome
  > choco install googlechrome --version 99.0.4844.82


* Desinstala o navegador **GoogleChrome** 
  > choco uninstall googlechrome

* Instala a aplicación de **GoogleChrome**  a versión 99.0.4844.82 e que accepte todo de maneira automática. 
  > choco install googlechrome --version 99.0.4844.82 -y

* Desinstala o navegador Microsoft Edge
  > choco uninstall microsoft-edge

* Busca todas as versións dispoñibles en chocolatey da aplicación AnyDesk
  > choco list AnyDesk --all


* Instala a versión 5.5.3 de AnyDesk
  > choco install anydesk --version 5.5.3

* Actualiza a versión 6.0.5 de AnyDesk
  > choco upgrade anydesk --version 6.0.5

* Desinstala a aplicación anydesk
   > choco uninstall anydesk
* 



  
# Tarefa 2
Antes de iniciar a tarefa tes que restaurar o sistema operativo ao estado inicial. Xera un script en powershell que permita instalar as seguintes aplicacións de forma totlamente desantendida. 
* Adobe reader 2022.001.20085 
* Mozilla Firefox 98.0.1
* Notepad ++ 8.3.3

Unha vez realizado o script proba a executalo e finalmente garda o ficheiro export. 
## Tarefa 2: solución script. 

```bash
#script tarefa2 
choco install adobereader --version 2022.001.20085 -y
choco install firefox --version 98.0.1 -y
choco install notepadplusplus.install --version 8.3.3 -y
```
## Tarefa 2: solución ficheiro xml 

> choco export tarefa2.xml 

```xml
<?xml version="1.0" encoding="utf-8"?>
<packages>
	<package id="adobereader" version="2022.001.20085"/>
	<package id="firefox" version="98.0.1"/>
	<package id="notepadplusplus.install" version="8.3.3"/>
</packages>
```


# Tarefa 3
Instala nunha única as seguintes aplicacións: notepad+++, Google Chrome, Atom, 7zip.
> choco install notepadplusplus googlechrome atom 7zip

# Tarefa 4
Realiza a búsqueda dos paquetes coincidentes con **libreoffice** e que amose os resultados ordeados por popularidade. 

> choco search libreoffice --order-by-popularity 


# Tarefa 5
Realiza a actualización de tódolos paquetes dispoñibles excepto o paquete  *7zip*. 

> choco upgrade all -except="7zip"
