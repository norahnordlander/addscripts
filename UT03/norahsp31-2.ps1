# norahsp31-2.ps1 - Norah Rodriguez Sanchez
# Muestra los inicios de sesion (evento 4624 del registro Security)
# producidos entre dos fechas, excluyendo al usuario SYSTEM.
# Uso: .\norahsp31-2.ps1 -Inicio "2026-10-01" -Fin "2026-11-02"

param(
    [Parameter(Mandatory=$true)][datetime]$Inicio,   # fecha de inicio
    [Parameter(Mandatory=$true)][datetime]$Fin       # fecha de fin
)

# Letra o con tilde (evita problemas de codificacion)
$o = [char]0x00F3

# Consulta filtrada: registro Security, evento 4624 (inicio de sesion correcto)
$eventos = Get-WinEvent -FilterHashtable @{
    LogName   = 'Security'
    Id        = 4624
    StartTime = $Inicio
    EndTime   = $Fin
} -ErrorAction SilentlyContinue

Write-Host "Eventos de Inicio de Sesi$($o)n:"

# Si no hay eventos en el rango, se avisa y se termina
if (-not $eventos) {
    Write-Host "No hay inicios de sesi$($o)n en ese rango de fechas."
    exit
}

foreach ($e in $eventos) {
    # Properties[5] = TargetUserName (usuario que inicia sesion)
    $usuario = $e.Properties[5].Value
    # Se excluye SYSTEM porque no corresponde a una persona
    if ($usuario -ne 'SYSTEM') {
        Write-Host ("Fecha: {0} - Usuario: {1}" -f $e.TimeCreated.ToString('dd/MM/yyyy HH:mm:ss'), $usuario)
    }
}
