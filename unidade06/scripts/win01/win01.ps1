
# 1 Empregando unha ruta absoluta, cambia o directorio de traballo ao cartafol do usuario que empregas regularmente (faino aínda que xa estiveras nel).
Set-Location C:\Users\usuario\

# 2 Descomprime o arquivo facturas.zip no cartafol do usuario que empregas regularmente.
 Expand-Archive C:\Users\usuario\facturas.zip -DestinationPath C:\Users\usuario\

# 3 - Crea un cartafol chamado "facturas 2020 - 2021" en C: Non podes empregar as comiñas para indicar o nome do directorio, polo que terás que buscar o carácter de escape de PowerShell.
New-Item -Path "facturas 2020 - 2021" -ItemType "directory"

# 4-  Crea un arquivo de texto chamado "facturas.txt" no cartafol principal do teu usuario. Este arquivo debe conter o texto "Facturas".
Write-Host "Facturas">facturas.txt

# 5- Cambia o nome do arquivo "facturas.txt" a "resumo.txt".
Write-Host "Facturas">facturas.txt

# 6- Verifica que no cartafol do usuario agora tes un subdirectorio chamado "facturas". Para isto, aplica un filtrado no que só se amosen directorios que # concorden co termo "facturas".
Get-ChildItem -Path C:\Users\usuario\facturas* -Directory

# 7 Lista os ficheiros descendentes (a calquera nivel) do directorio "facturas" que comecen por "Factura".
 Get-ChildItem -Path C:\Users\usuario\facturas\Factura* -Recurse

# 8 Agora lista os ficheiros descendentes do directorio "facturas" que non conteñen un "Anexo" no seu nome.
 Get-ChildItem -Path C:\Users\usuario\facturas\* -Exclude "Anexo"

# 9 Copia os directorios e ficheiros que non teñen un "Anexo" no seu nome ao directorio "facturas 2020 - 2021".
Get-ChildItem -Path C:\Users\usuario\facturas\* -Exclude "Anexo" |  Copy-Item -destination "C:\Users\usuario\facturas\facturas 2020 - 2021"


# 10 Move o ficheiro "resumo.txt" ao cartafol "facturas 2020 - 2021.
 Move-Item .\facturas\resumo.txt -Destination "C:\Users\usuario\facturas 2020 - 2021"

# 11 Engade no ficheiro "resumo.txt" o texto correspondente a listar o cartafol "facturas 2020 - 2021", sen incluír o propio ficheiro "resumo.txt" no # listado. Emprega o formato de lista, en lugar de empregar o formato de táboa que é o que o comando saca por defecto. O formato de lista é o que inclúe # data e hora de creación do ficheiro, do último acceso e da última escritura, así coma outros atributos como "version", "target", etc.
Get-ChildItem -Path C:\Users\usuario\facturas\* -Exclude "resumo.txt" -recurse | Format-List >> 'C:\Users\usuario\facturas 2020 - 2021\resumo.txt'


# 12 Amosa o contido do ficheiro "resumo.txt"
Get-Content 'C:\Users\usuario\facturas 2020 - 2021\resumo.txt'

# 13 Amosa as cinco últimas liñas do ficheiro "resumo.txt"
Get-Content 'C:\Users\usuario\facturas 2020 - 2021\resumo.txt' -tail 5

# 14 Comprime o cartafol "facturas 2020 - 2021", poñendo o resultado no cartafol principal do teu usuario.
Compress-Archive 'C:\Users\usuario\facturas 2020 - 2021\'  -DestinationPath 'C:\Users\usuario\copia.zip' 

# 15 No directorio "facturas", elimina todos os ficheiros e directorios descendentes que conteñan "Factura" no seu nome, xunto con todo o seu contido.
Remove-Item  C:\Users\usuario\facturas\ -recurse 