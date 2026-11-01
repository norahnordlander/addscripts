# norahsp31-6.ps1 - Norah Rodriguez Sanchez
# Crea una tarea programada SOLO con PowerShell (sin interfaz grafica).
# Tarea: al arrancar el servidor, actualiza las firmas de Windows Defender
# y realiza un analisis rapido en busca de malware.

# 1. Accion: que programa se ejecuta y con que argumentos
$accion = New-ScheduledTaskAction -Execute "powershell.exe" `
    -Argument '-NoProfile -WindowStyle Hidden -Command "Update-MpSignature; Start-MpScan -ScanType QuickScan"'

# 2. Desencadenador: se ejecuta cada vez que se inicia el sistema
$desencadenador = New-ScheduledTaskTrigger -AtStartup

# 3. Usuario: se ejecuta como SYSTEM con los maximos privilegios
#    (no necesita que nadie inicie sesion)
$usuario = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# 4. Configuracion: si no pudo ejecutarse a su hora, lo hace en cuanto pueda
$config = New-ScheduledTaskSettingsSet -StartWhenAvailable

# 5. Registro de la tarea en el Programador de tareas
Register-ScheduledTask -TaskName "norah_AnalisisDefender" `
    -Description "Actualiza Defender y hace un analisis rapido al arrancar el servidor" `
    -Action $accion -Trigger $desencadenador -Principal $usuario -Settings $config -Force

# 6. Comprobacion: se muestra el estado de la tarea (debe ser Ready)
Get-ScheduledTask -TaskName "norah_AnalisisDefender" | Format-Table TaskName, State, TaskPath -AutoSize
