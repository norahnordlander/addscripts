<div align="center">

# 🧪 Supuesto Práctico UT03
## ⚙️ Automatización de tareas de mantenimiento

![Windows Server](https://img.shields.io/badge/Windows%20Server-2025-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-26-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)

**👩‍💻 Norah Rodríguez Sánchez** · 2º ASIR · CIFP Villa de Agüimes

![Estado](https://img.shields.io/badge/Estado-Completado-success?style=flat-square)

</div>

---

## 🎯 Objetivos

- 📋 Consultar y filtrar registros de eventos en Windows Server.
- 💻 Crear scripts en PowerShell que trabajen con los registros de eventos.
- 📦 Automatizar la gestión de software y el mantenimiento en Ubuntu.
- ⏰ Programar tareas en Windows de forma gráfica y con PowerShell.
- 💾 Planificar tareas y copias de seguridad con `cron`, `anacron`, `systemd` y `rsync`.
- 📊 Monitorizar el rendimiento del sistema con `sysstat`.

---

## 🪟 Windows Server

| Nº | Apartado | Archivo | Estado |
|:--:|----------|---------|:------:|
| 1 | 🔍 Vista personalizada de advertencias y errores | `norahwarning` *(Visor de eventos)* | ✅ |
| 2 | 🔐 Inicios de sesión entre dos fechas | [`norahsp31-2.ps1`](norahsp31-2.ps1) | ✅ |
| 3 | 📑 Menú de registros de eventos | [`norahsp31-3.ps1`](norahsp31-3.ps1) | ✅ |
| 6 | ⏰ Tareas programadas (gráfica + PowerShell) | [`norahsp31-6.ps1`](norahsp31-6.ps1) | ✅ |

## 🐧 Ubuntu

| Nº | Apartado | Archivo | Estado |
|:--:|----------|---------|:------:|
| 4 | 🗑️ Desinstalación de programas desde un listado | [`norahsp31-4.sh`](norahsp31-4.sh) + [`programas.txt`](programas.txt) | ✅ |
| 5 | 🩺 Informe de errores de `/var/log` | [`norahsp31-5.sh`](norahsp31-5.sh) | ✅ |
| 7 | 💽 Monitorización del espacio en disco con `cron` | [`norahsp31-7.sh`](norahsp31-7.sh) | ✅ |
| 8 | 💾 Copias de seguridad con `cron` y `anacron` | [`copia_total.sh`](copia_total.sh) · [`copia_diferencial.sh`](copia_diferencial.sh) · [`limpieza.sh`](limpieza.sh) | ✅ |
| 9 | 🔄 Sincronización con `rsync` + temporizador `systemd` | [`norahsp31-9.sh`](norahsp31-9.sh) · [`.service`](norah-espejo.service) · [`.timer`](norah-espejo.timer) | ✅ |
| 10 | 🔥 Prueba de estrés y monitorización con `sysstat` | [`norahsp31-10.json`](norahsp31-10.json) | ✅ |

---

## ⏱️ Programación de tareas

| Herramienta | Programación | Tarea |
|-------------|--------------|-------|
| 🪟 Programador de tareas | Diaria, 02:00 | Limpieza de `C:\Windows\Temp` |
| 🪟 PowerShell | Al iniciar el sistema | Actualización y análisis de Windows Defender |
| 🐧 `cron` | `*/15 8-14 * * 1-5` | Monitorización del disco (umbral 80 %) |
| 🐧 `cron` | `0 23 * * 5` | Copia diferencial semanal `CopDifSem-<semana>` |
| 🐧 `anacron` | `@monthly` | Limpieza de diferenciales |
| 🐧 `anacron` | `@monthly` | Copia total `CopTot-<mes><año>` |
| 🐧 `systemd timer` | Diario, 22:00 | Espejo de `/home/usnorah` con `rsync` |

---

## 🚀 Uso rápido

### PowerShell (como administrador)

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force

.\norahsp31-2.ps1 -Inicio "2026-10-01" -Fin "2026-11-02"   # Inicios de sesión
.\norahsp31-3.ps1                                          # Menú de registros
.\norahsp31-6.ps1                                          # Crear tarea programada
```

### Bash

```bash
chmod +x *.sh

sudo ./norahsp31-4.sh       # Desinstalar programas de programas.txt
sudo ./norahsp31-5.sh       # Informe de errores de /var/log
sudo ./norahsp31-7.sh       # Comprobar ocupación de disco (umbral 80 %)
sudo ./norahsp31-7.sh 10    # Prueba con umbral 10 %
sudo ./norahsp31-9.sh       # Sincronización espejo con rsync
```

---

## 📁 Estructura

```
UT03/
├── 📄 README.md
├── 🪟 norahsp31-2.ps1
├── 🪟 norahsp31-3.ps1
├── 🪟 norahsp31-6.ps1
├── 🐧 norahsp31-4.sh
├── 🐧 programas.txt
├── 🐧 norahsp31-5.sh
├── 🐧 norahsp31-7.sh
├── 💾 copia_total.sh
├── 💾 copia_diferencial.sh
├── 💾 limpieza.sh
├── 🔄 norahsp31-9.sh
├── ⏲️ norah-espejo.service
├── ⏲️ norah-espejo.timer
└── 📊 norahsp31-10.json
```

---

<div align="center">

⚠️ *Los scripts de Windows deben ejecutarse en PowerShell **como administrador** y los de Ubuntu con **sudo**.*

📚 **Módulo SGY** · Curso 2026-2027

</div>
