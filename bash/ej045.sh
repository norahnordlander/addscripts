#!/bin/bash
# ============================================================
# Ejercicio 45 - Permisos
# Autora: Norah Rodriguez Sanchez
# Descripción: recibe un fichero como parámetro y comprueba, uno a
#              uno, si tienes permiso de lectura, escritura y
#              ejecución sobre él.
# Uso: ./ej045.sh <fichero>
# ============================================================

# Comprobamos el parámetro
if [ $# -eq 0 ]; then
    echo "Uso: $0 <fichero>"
    exit 1
fi

fichero="$1"

# Comprobamos primero que exista
if [ ! -e "$fichero" ]; then
    echo "El fichero '$fichero' no existe."
    exit 1
fi

echo "Permisos de $(whoami) sobre '$fichero':"

# -r = lectura
if [ -r "$fichero" ]; then
    echo "  Lectura:   SÍ"
else
    echo "  Lectura:   NO"
fi

# -w = escritura
if [ -w "$fichero" ]; then
    echo "  Escritura: SÍ"
else
    echo "  Escritura: NO"
fi

# -x = ejecución
if [ -x "$fichero" ]; then
    echo "  Ejecución: SÍ"
else
    echo "  Ejecución: NO"
fi
