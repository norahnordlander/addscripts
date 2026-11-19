#!/bin/bash
# ============================================================
# Ejercicio 39 - Mis procesos
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra los procesos del usuario actual mostrando
#              solo PID y comando, ordenados por PID.
# ============================================================

usuario=$(whoami)
echo "Procesos de $usuario:"

# -u $usuario -> procesos del usuario actual (whoami)
# -o pid,cmd -> solo las columnas PID y comando
# --sort=pid -> ordenados por PID de menor a mayor
ps -u "$usuario" -o pid,cmd --sort=pid
