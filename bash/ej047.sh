#!/bin/bash
# ============================================================
# Ejercicio 47 - Validar parámetros
# Autora: Norah Rodriguez Sanchez
# Descripción: exige exactamente dos parámetros. Si no los recibe,
#              muestra la sintaxis correcta y sale con código 1;
#              si los recibe, los muestra numerados.
# Uso: ./ej047.sh <param1> <param2>
# ============================================================

# -ne = "distinto de": si no son exactamente 2, error
if [ $# -ne 2 ]; then
    echo "Error: se necesitan exactamente 2 parámetros (has pasado $#)."
    echo "Sintaxis: $0 <param1> <param2>"
    exit 1
fi

# Mostramos los parámetros numerados
echo "Parámetro 1: $1"
echo "Parámetro 2: $2"
