#!/bin/bash
# ============================================================
# Ejercicio 29 - Top de memoria
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra los 5 procesos que más memoria consumen
#              (usuario, PID y %MEM) usando ps aux, sort y awk.
# ============================================================

echo -e "USUARIO\t\tPID\t%MEM"

# ps aux        -> lista todos los procesos
# tail -n +2    -> quita la cabecera
# sort -k4 -nr  -> ordena por la columna 4 (%MEM) de mayor a menor
# head -5       -> nos quedamos con los 5 primeros
# awk           -> imprimimos usuario ($1), PID ($2) y %MEM ($4)
ps aux | tail -n +2 | sort -k4 -nr | head -5 | awk '{ print $1 "\t\t" $2 "\t" $4 }'
