
# 1 -Usa os comandos de procesos para lanzar un Internet Explorer que abra www.google.es 
# nunha ventá minimizada ao arrancar. O executable que necesitas está en 
# C:\Program files\Internet Explorer\iexplore.exe. Non necesitas estar conectado a Internet, 
# basta con ver que a barra de direccións apunta a www.google.es. Non peches a aplicación.
Start-Process -WindowStyle Minimized "C:\Program files\Internet Explorer\iexplore.exe" www.google.es

# 2 - Emprega os comandos de procesos para lanzar unha calculadora (o executable está en 
# C:\Windows\System32\calc.exe), a ventá ten que estar maximizada ao arrancar. 
# Faiche caso nisto último? Non peches a aplicación.
 Start-Process -WindowStyle Maximized "C:\Windows\System32\calc.exe"

# 3 -Obtén as librerías DLL empregadas polo proceso da calculadora. Pista: o proceso non se chama igual que o executable.
Get-Process CalculatorApp -module | Where {$_.FileName -Like "*.dll"}

# Este paso non puntúa. Executa o comando Get-Process. 
# Verás que a táboa resultante amosa uns poucos campos. 
# Agora, executa Get-Process | Get-Member para ver todos os campos que realmente se poden amosar.
# Coñecer a existencia destes campos será de axuda no vindeiro exercicio. 
# Discutiremos máis sobre as propiedades dun obxecto no vindeiro módulo.

# 4 -Mediante o comando Get-Process, obtén a clase de prioridade, o tempo total de procesador e a 
# data e hora de comezo dos procesos do Internet Explorer (procesos de nome iexplore). 
# Pista: vas ter que combinar o Get-Process co cmdlet Select-Object para elixir as propiedades que 
# queres amosar.
Get-Process msedge | Select-Object PriorityClass, StartTime, TotalProcessorTime

# 5 - Mediante o comando Get-WmiObject, obtén o tempo en modo usuario dos procesos da calculadora. 
# Pista 1: neste caso o cmdlet Get-WmiObject win32_process si que amosa os procesos con todas as súas propiedades.
# Pista 2: vas ter que empregar o cmdlet Where-Object para filtrar por nome (propiedade Name) e o cmdlet Select-Object para elixir as propiedades que querías amosar.

#?? Get-WmiObject win32_process | Where-Object Name -eq CalculatorApp | Select UserModeTime
## Non logro resultados. 

# 6 - Detén o proceso da calculadora empregando o seu PID.
Stop-Process -id 2600

# 7- Fai que o PowerShell se quede agardando sen poder introducir comandos ata que peches 
# todos as instancias de Internet Explorer que teñas abertas, pero que non espere máis de 30 segundos.
Wait-Process msedge -Timeout 30

# Este paso non puntúa. Crea un traballo en segundo plano que non remate nunca mediante o 
# cmdlet Start-Job –scriptblock {while($true) {$i++}}. 
# Nota: a partir de aquí pode que a máquina che vaia un pouco lenta ata que pares o traballo uns puntos máis adiante.
Start-Job -scriptblock {while($true) {$i++}}

# 8 - Lista os traballos en segundo plano
job 
get-job 

# 9 - Detén o traballo do punto anterior usando o seu nome.
Stop-Job Job1

# 10 - Crea un traballo en segundo plano co nome “listado” que liste os servizos do sistema.
Start-Job -Name  "listado" -scriptblock {Get-Service}

# 11 - Obtén o resultado do traballo “listado” de forma que se garde para posteriores usos.
Receive-Job  "listado" -Keep

# 12 - Elimina da lista de traballos o traballo en segundo plano que non acaba nunca.
Remove-Job *  -force  # elimina todos de maneira forzada
Remove-Job Job7 #Elimina o traballo numero 7
Remove-Job -state NotStarted #elimina os traballos non iniciados 

# ________________________________________________________________________________________________________

Evidencias da adquisición dos desempeños:

Ficheiro PDF cos comandos que realizan o proceso e capturas de pantalla que evidencien o seu correcto funcionamento.
Indicadores de logro:

Crea e detén procesos de forma adecuada.
Lista as propiedades que nos interesan dun proceso.
Crea, lista, detén e elimina traballos en segundo plano de forma adecuad