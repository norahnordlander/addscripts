#!/bin/bash
# ============================================================
# Ejercicio 30 - Contando entradas
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra cuántos ficheros y cuántos directorios hay
#              en el directorio actual (sin contar ocultos).
# ============================================================

# ls -l muestra un carácter de tipo al principio de cada línea:
#   "-" = fichero regular, "d" = directorio
# ls sin -a no muestra los ocultos
ficheros=$(ls -l | grep -c '^-')
directorios=$(ls -l | grep -c '^d')

echo "Directorio actual: $(pwd)"
echo "Ficheros:    $ficheros"
echo "Directorios: $directorios"
