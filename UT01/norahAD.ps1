# ==========================================================
# Script:      norahAD.ps1
# Autora:      Norah Rodriguez Sanchez
# Modulo:      ADD - Supuesto Practico UT01
# Descripcion: Menu para administrar el dominio norah.aws:
#              informacion del dominio, crear OU, crear grupo
#              y crear usuario asignado a un grupo.
# ==========================================================

# Se carga el modulo de Active Directory
Import-Module ActiveDirectory

# Datos del dominio que se usan en varias opciones
$dominio = Get-ADDomain
$dnDominio = $dominio.DistinguishedName      # DC=norah,DC=aws
$dnsDominio = $dominio.DNSRoot               # norah.aws

# Funcion que pide una OU y devuelve su ruta (DN).
# Si se deja en blanco, se usa el contenedor por defecto.
function Obtener-Ruta($contenedorPorDefecto) {
    $ou = Read-Host "OU donde crearlo (Enter para usar $contenedorPorDefecto)"
    if ([string]::IsNullOrWhiteSpace($ou)) {
        return "CN=$contenedorPorDefecto,$dnDominio"
    }
    return "OU=$ou,$dnDominio"
}

do {
    # Menu principal
    Write-Host ""
    Write-Host "========== MENU DOMINIO $dnsDominio ==========" -ForegroundColor Cyan
    Write-Host "1) Mostrar informacion del dominio"
    Write-Host "2) Crear una nueva Unidad Organizativa"
    Write-Host "3) Crear un nuevo grupo"
    Write-Host "4) Crear una nueva cuenta de usuario"
    Write-Host "5) Salir"
    Write-Host "===============================================" -ForegroundColor Cyan
    $opcion = Read-Host "Elige una opcion"

    switch ($opcion) {
        "1" {
            # Opcion 1: nombre del equipo, del dominio y numero de OUs, grupos y usuarios
            Write-Host "Nombre del equipo : $env:COMPUTERNAME"
            Write-Host "Nombre del dominio: $dnsDominio"
            Write-Host "Numero de OUs     : $(@(Get-ADOrganizationalUnit -Filter *).Count)"
            Write-Host "Numero de grupos  : $(@(Get-ADGroup -Filter *).Count)"
            Write-Host "Numero de usuarios: $(@(Get-ADUser -Filter *).Count)"
        }
        "2" {
            # Opcion 2: se crea la OU en la raiz del dominio
            $nombreOU = Read-Host "Nombre de la nueva OU"
            try {
                New-ADOrganizationalUnit -Name $nombreOU -Path $dnDominio -ProtectedFromAccidentalDeletion $false
                Write-Host "OU '$nombreOU' creada correctamente." -ForegroundColor Green
            } catch {
                Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
        "3" {
            # Opcion 3: grupo de seguridad global, en la OU que indique el usuario
            $nombreGrupo = Read-Host "Nombre del nuevo grupo"
            $ruta = Obtener-Ruta "Users"
            try {
                New-ADGroup -Name $nombreGrupo -GroupScope Global -GroupCategory Security -Path $ruta
                Write-Host "Grupo '$nombreGrupo' creado en $ruta." -ForegroundColor Green
            } catch {
                Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
        "4" {
            # Opcion 4: se piden las caracteristicas del usuario
            $nombre    = Read-Host "Nombre"
            $apellido  = Read-Host "Apellido"
            $login     = Read-Host "Nombre de inicio de sesion"
            $password  = Read-Host "Contrasena inicial" -AsSecureString
            $grupo     = Read-Host "Grupo al que pertenecera"
            $ruta      = Obtener-Ruta "Users"
            try {
                # Se comprueba que el grupo existe antes de crear el usuario
                Get-ADGroup -Identity $grupo | Out-Null
                # -ChangePasswordAtLogon obliga a cambiar la contrasena en el primer inicio
                New-ADUser -Name "$nombre $apellido" -GivenName $nombre -Surname $apellido `
                    -SamAccountName $login -UserPrincipalName "$login@$dnsDominio" `
                    -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $true -Path $ruta
                # Se anade el usuario al grupo indicado
                Add-ADGroupMember -Identity $grupo -Members $login
                Write-Host "Usuario '$login' creado y anadido al grupo '$grupo'." -ForegroundColor Green
                Write-Host "Debera cambiar la contrasena en el primer inicio de sesion."
            } catch {
                Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
        "5" {
            Write-Host "Saliendo del programa..."
        }
        default {
            Write-Host "Opcion no valida, elige del 1 al 5." -ForegroundColor Yellow
        }
    }
} while ($opcion -ne "5")
