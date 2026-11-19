#!/bin/bash
# ============================================================
# Ejercicio 33 - Los 5 más pesados
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra los 5 ficheros o carpetas que más ocupan
#              dentro del HOME del usuario.
# ============================================================

echo "Los 5 elementos que más ocupan en $HOME:"

# du -sh  -> tamaño total de cada elemento, en formato legible
# $HOME/* -> cada fichero/carpeta del HOME (sin ocultos)
# 2>/dev/null -> ocultamos errores de permisos
# sort -hr -> ordena tamaños "humanos" (K, M, G) de mayor a menor
# head -5 -> los 5 primeros
du -sh "$HOME"/* 2>/dev/null | sort -hr | head -5
