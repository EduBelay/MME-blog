#Script tarefa 5.1
Import-Module SmbShare

Write-Host "Elixa a opción a executar:"
Write-Host "0: Sae do script sen facer nada."
Write-Host "1: Lista as comparticións Smb"
Write-Host "2: Crea unha compartición Smb."
Write-Host "3: Elimina unha compartición Smb. "
Write-Host "4: Lista os privilexios de acceso dunha compartición "
Write-Host "5: Grante privilexios de acceso a unha compartición "
Write-Host "6: Elimina os privilexios de acceso a unha compartición para un usuario.  "

$opcion = Read-Host "Introduzca un nº: "


switch ($opcion) {
  0 {
    Write-Host "0. Saimos do script";
    Exit
  }
  1 {
    # Opción 1: Lista as comparticións Smb, incluídas as ocultas. Só amosará o nome da compartición e o path, en formato de táboa.
     Write-Host "1: Lista as comparticións Smb";
    SmbShare -IncludeHidden | Select Name , Path

    break
  }
  2 {
    # Opción 2: Crea unha compartición Smb. O nome da compartición e o path do recurso compartido se lle deben pedir ao usuario. O usuario debe obter privilexios completos sobre esta compartición
   #DOC: https://learn.microsoft.com/en-us/powershell/module/smbshare/new-smbshare?source=recommendations&view=windowsserver2022-ps
     Write-Host "2: Crea unha compartición Smb."
     $nome = Read-Host "Cal é o nome do recurso?: "
     $directorio = Read-Host "Cal é o directorio do recurso?: "
     $usuario = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name;
    
     New-SmbShare -Name $nome -Path  $directorio  -FullAccess $usuario 
    break;
  }
  3 {
    #Opción 3: Elimina unha compartición Smb. O nome da compartición se lle debe pedir ao usuario.
    #DOC: 
    Write-Host "3: Elimina unha compartición Smb. "
    $nome = Read-Host "Cal é o nome do recurso?: "
    remove-smbshare -name $nome -force


  }
  4 {
    #Opción 4: Lista os privilexios de acceso dunha compartición.
    Write-Host "4: Lista os privilexios de acceso dunha compartición "
    $nome = Read-Host "Cal é o nome do recurso?: "
    Get-SmbShareAccess -name $nome

  }
  5 {
    #Opción 5: Grante privilexios de acceso a unha compartición. Cómpre pedirlle ao usuario que introduza
    # o nome da compartición, o nome do usuario e o tipo de privilexio. Este debe ser Full, Change ou Read.
    # De non ser ningún deles, o script debe producir un erro.
    Write-Host "5: Grante privilexios de acceso a unha compartición "
    $nome    = Read-Host "Cal é o nome do recurso?: "
    $usuario = Read-Host "Cal é o nome do usuario?: "
    $conta   = [System.Net.Dns]::GetHostName()+"\"+$usuario
    $privilexio = Read-Host "Que privilexio dexexa configurar?  (0) Full,  (1) Change ou (2) Read. "

    $result ="";
    switch ( $privilexio )
    {
        0 { $result = 'Full'    }
        1 { $result = 'Change'    }
        2 { $result = 'Read'   }
        default {   Write-Host "ERRO!! Opción incorrecta!! "; 
                    Exit
                 }
    }

    Grant-SmbShareAccess -Name $nome -AccountName $conta -AccessRight $result -Force

  }
  6 {
    #Opción 6: Elimina os privilexios de acceso a unha compartición para un usuario. 
    #Cómpre pedirlle ao usuario que introduza o nome da compartición, o nome do usuario.
    Write-Host "6: Elimina os privilexios de acceso a unha compartición para un usuario.  "
    $nome    = Read-Host "Cal é o nome do recurso?: "
    $usuario = Read-Host "Cal é o nome do usuario?: "
    $conta   = [System.Net.Dns]::GetHostName()+"\"+$usuario
    Revoke-SmbShareAccess -Name $nome -AccountName $conta -Force

  }


  default {Write-Host "Error. Debe introducir un valor entre 0 e 6";}
}