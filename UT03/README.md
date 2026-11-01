<div align="center">

# 🧪 Supuesto Práctico UT03
## ⚙️ Automatización de tareas de mantenimiento

![Windows Server](https://img.shields.io/badge/Windows%20Server-2025-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-26-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)

**👩‍💻 Norah Rodríguez Sánchez** · 2º ASIR · CIFP Villa de Agüimes

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
| 4 | 🗑️ Desinstalación de programas desde un listado | `norahsp31-4.sh` + `programas.txt` | ⏳ |
| 5 | 🩺 Informe de errores de `/var/log` | `norahsp31-5.sh` | ⏳ |
| 7 | 💽 Monitorización del espacio en disco con `cron` | `norahsp31-7.sh` | ⏳ |
| 8 | 💾 Copias de seguridad con `cron` y `anacron` | scripts en `/scrnorah` | ⏳ |
| 9 | 🔄 Sincronización con `rsync` + temporizador `systemd` | `norahsp31-9.sh` + `.service` + `.timer` | ⏳ |
| 10 | 🔥 Prueba de estrés y monitorización con `sysstat` | `norahsp31-10.json` | ⏳ |

---

## 🚀 Uso rápido

### PowerShell (como administrador)

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force

# Inicios de sesión entre dos fechas
.\norahsp31-2.ps1 -Inicio "2026-10-01" -Fin "2026-11-02"

# Menú interactivo de registros de eventos
.\norahsp31-3.ps1

# Crear la tarea programada con PowerShell
.\norahsp31-6.ps1
```

### Bash

```bash
chmod +x norahsp31-*.sh
sudo ./norahsp31-4.sh
```

---

## 📁 Estructura
