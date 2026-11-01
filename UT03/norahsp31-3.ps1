# norahsp31-3.ps1 - Norah Rodriguez Sanchez
# Muestra un menu con los registros de eventos que existen en el sistema.
# Al elegir uno, muestra cuantos eventos tiene y los 12 ultimos.
# Se sale con 0. Cualquier otra opcion inexistente se indica como no valida.

# Letras con tilde (evita problemas de codificacion)
$o = [char]0x00F3   # o con tilde
$a = [char]0x00E1   # a con tilde
$u = [char]0x00FA   # u con tilde

do {
    # Se obtienen los registros reales de la maquina (no se escriben a mano)
    $registros = Get-EventLog -List

    # Se muestra el menu numerado
    Write-Host ""
    Write-Host "===== MEN$($u) DE REGISTROS DE EVENTOS =====" -ForegroundColor Cyan
    for ($i = 0; $i -lt $registros.Count; $i++) {
        Write-Host ("{0}. {1}" -f ($i + 1), $registros[$i].Log)
    }
    Write-Host "0. Salir"

    $opcion = Read-Host "Elige una opci$($o)n"

    # Opcion 0: salir del script
    if ($opcion -eq '0') {
        Write-Host "Saliendo..." -ForegroundColor Yellow
        break
    }

    # Se comprueba que la opcion sea un numero dentro del rango del menu
    if ($opcion -match '^\d+$' -and [int]$opcion -ge 1 -and [int]$opcion -le $registros.Count) {
        $reg   = $registros[[int]$opcion - 1]
        $total = $reg.Entries.Count

        Write-Host ""
        Write-Host "Registro: $($reg.Log) - N$($u)mero de eventos: $total" -ForegroundColor Green

        # Si el registro tiene eventos, se muestran los 12 ultimos
        if ($total -gt 0) {
            Get-EventLog -LogName $reg.Log -Newest 12 -ErrorAction SilentlyContinue |
                Format-Table TimeGenerated, EntryType, Source, EventID -AutoSize | Out-Host
        }
    }
    else {
        Write-Host "Opci$($o)n no v$($a)lida" -ForegroundColor Red
    }
} while ($true)
