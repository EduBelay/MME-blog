

# Solución 1
$lista = Get-NetAdapter | Where-Object name -like "Ethernet*"
foreach ($item in $lista)
{
  Write-Host $item.name
  Disable-NetAdapter -Name $item.name -Confirm:$false
}

## Solucion 2 

$lista =  Get-NetAdapter | Where-Object {
  $_.InterfaceDescription -like '*Bluetooth*' -or
  $_.InterfaceDescription -like '*Wi-Fi*'
 } 

foreach ($item in $lista)
{
  Write-Host $item.name
  Disable-NetAdapter -Name $item.name -Confirm:$false
}

 
## Solución 3 - Expresión regular
$lista =  Get-NetAdapter 

foreach ($item in $lista)
{
  Write-Host $item.name
  if( $item.name  -match 'Ethernet [0-9]' ){
      Write-Host "Desactiva!!!!=> "$item.name
      Disable-NetAdapter -Name $item.name -Confirm:$false
  }
  
}

 
 | Select-Object extensionsattribute9, country



 | Where-Object {
  $_.extensionattribute9 -eq 'Smith, Joe' -or
  $_.extensionattribute9 -eq 'Doe, John'
 } | Select-Object extensionsattribute9, country