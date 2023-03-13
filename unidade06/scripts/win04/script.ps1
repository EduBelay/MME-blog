#Script tarefa 5.2

# 6  O comando Get-ACL serve para obter un obxecto representando a ACL dun ficheiro.
#     Obtén a devandita ACL para o cartafol "proba". Cando vexas o resultado de executar 
#     este comando volve a executalo gardando o resultado nunha variable chamada $acl.
$acl = Get-Acl "C:\proba"

# 7  Agora lista os campos e métodos (ou dito de forma xeral, os membros)
#    que ten o obxecto $acl tal e como aprendiches a facelo neste módulo.
#     Como podes ver, no obxecto están representadas tanto a DACL (métodos que terminan en "AccessRules" ou en "AccessRule"), como a SACL (métodos que terminan en "AuditRules" ou "AuditRule"). 
$acl | Get-Member
$acl | Get-Member -MemberType Method
$acl | Get-Member -MemberType  NoteProperty

#8 - Usa o método getAccessRules(Boolean, Boolean, Type) para obter as ACEs do cartafol proba. O primeiro parámetro serve para dicir se queremos obter os permisos dados directamente. 
#    O segundo parámetro serve para dicir se queremos obter os permisos heredados. O terceiro parámetro indica o tipo de conta e pode ser
#     [System.Security.Principal.SecurityIdentifier] ou ben [System.Security.Principal.NTAccount]. 
#    Como podes ver, se obtés todos os permisos, heredados ou non para as contas [System.Security.Principal.NTAccount],
#    vaiche saír unha entrada para Susana dicindo que ten un Allow nos permisos ReadAndExecute e Synchronize, e que estes permisos non son herdados
#    Volve a executar este comando gardando o resultado na variable $reglas.
$reglas = $acl.GetAccessRules($true,$true, [System.Security.Principal.NTAccount])

#9 - $reglas é un tipo de colección especial de só lectura, pero compórtase como un array
#     Busca a regla de Susana accedendo aos seus elementos e cando a atopes gárdaa na variable $susi.
$susi = $reglas[0]

#10 Agora imos ver qué outros tipos de permisos poden ter os usuarios. 
#    Para iso, podes executar o seguinte comando: 
#   [system.enum]::getnames([System.Security.AccessControl.FileSystemRights

[system.enum]::getnames([System.Security.AccessControl.FileSystemRights])


#11 - Ata aquí a exploración. Agora imos darlle permiso de Control Total a Vicente. 
#     O primeiro paso é crear un obxecto de tipo System.Security.AccessControl.FileSystemAccessRule co comando
#     New-Object System.Security.AccessControl.FileSystemAccessRule(USUARIO,PERMISOS,ACCIÓN), onde o USUARIO pode
#     ser da forma "NOME", "EQUIPO\NOME", "DOMINIO\NOME", o PERMISO é algún dos vistos no paso 10, e a acción pode 
#    ser "Allow" o "Deny". Garda o obxecto creado unha variable chamada $AccessRuleUser.

$AccessRuleUser = New-Object System.Security.AccessControl.FileSystemAccessRule("Vicente","FullControl","Allow")

#12 - Engade este obxecto á ACL mediante o método AddAcessRule da mesma, pasando o obxecto como parámetro.
$acl.AddAccessRule($AccessRuleUser)


#13 - Volve a listar as reglas da variable $acl e comproba que agora a regla de Vicente tamén está na lista.
$acl.GetAccessRules($true,$true, [System.Security.Principal.NTAccount])

#14 - Agora imos a cambiar o dono do cartafol a Vicente. Primeiro, temos que conseguir un obxecto
#     de tipo NTAccount a partir do nome do usiario con: New-Object System.Security.Principal.Ntaccount(String). 
#     Garda este obxecto na variable $conta.

$conta = New-Object System.Security.Principal.Ntaccount("Vicente")

#15  - Agora, empregamos o método SetOwner da ACL para cambiarlle o dono,
#      pasándolle o obxecto que acabamos de crear.
$acl.setOwner($conta)

#16 - Se vamos ao Explorador de Windows, veremos que os permisos de Vicente aínda non están dados de verdade.
#     Para iso, necesitamos empregar o método Set-Acl, pasándolle o ACL manipulado.
Set-Acl -Path "C:\proba" -AclObject $acl

#Version 2
$arquivo = $args[0]
$usuario = $args[1]
$permiso = $args[2]
$accion = $args[3]
$cambio = $args[4]
$acl = Get-Acl $arquivo
$AccessRuleUser = New-Object System.Security.AccessControl.FileSystemAccessRule($usuario, $permiso, $accion)
$acl.AddAccessRule($AccessRuleUser)
if ($cambio) {
   $conta = New-Object System.Security.Principal.Ntaccount($usuario)
   $acl.setOwner($conta)
}
Set-Acl -Path $arquivo -AclObject $acl