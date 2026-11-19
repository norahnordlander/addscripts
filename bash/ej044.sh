#!/bin/bash
# ============================================================
# Ejercicio 44 - ¿Fichero o directorio?
# Autora: Norah Rodriguez Sanchez
# Descripción: recibe una ruta como parámetro e indica si es un
#              fichero regular, un directorio o si no existe
#              (usando if / elif / else).
# Uso: ./ej044.sh <ruta>
# ============================================================

# Comprobamos que nos pasan la ruta
if [ $# -eq 0 ]; then
    echo "Uso: $0 <ruta>"
    exit 1
fi

ruta="$1"

# -f = fichero regular, -d = directorio
if [ -f "$ruta" ]; then
    echo "'$ruta' es un fichero regular."
elif [ -d "$ruta" ]; then
    echo "'$ruta' es un directorio."
else
    echo "'$ruta' no existe."
fi
