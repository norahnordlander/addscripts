#!/bin/bash
# ============================================================
# Ejercicio 37 - Suma con awk
# Autora: Norah Rodriguez Sanchez
# Descripción: suma el tamaño en bytes de todos los ficheros del
#              directorio actual usando ls -l y awk.
# ============================================================

# ls -l       -> listado largo; la columna 5 es el tamaño en bytes
# /^-/        -> solo las líneas de ficheros regulares
# suma += $5  -> acumulamos el tamaño
# END         -> al terminar, mostramos el total
ls -l | awk '/^-/ { suma += $5 } END { print "Tamaño total: " suma+0 " bytes" }'
