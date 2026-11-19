#!/bin/bash
# ============================================================
# Ejercicio 43 - ¿Existe el fichero?
# Autora: Norah Rodriguez Sanchez
# Descripción: recibe un nombre de fichero como parámetro y dice
#              si existe o no. Sin parámetro, muestra un error de
#              uso y termina con exit 1.
# Uso: ./ej043.sh <fichero>
# ============================================================

# $# es el número de parámetros recibidos
if [ $# -eq 0 ]; then
    echo "Error: falta el parámetro."
    echo "Uso: $0 <fichero>"
    exit 1
fi

fichero="$1"

# -e comprueba si existe (sea fichero, directorio, etc.)
if [ -e "$fichero" ]; then
    echo "El fichero '$fichero' existe."
else
    echo "El fichero '$fichero' NO existe."
fi
