#!/bin/bash
# ============================================================
# Ejercicio 38 - Buscar y contar
# Autora: Norah Rodriguez Sanchez
# Descripción: pide una palabra y un fichero, y muestra cuántas
#              líneas del fichero la contienen y cuáles son
#              (con número de línea).
# ============================================================

read -p "Palabra a buscar: " palabra
read -p "Fichero: " fichero

# grep -c cuenta las líneas que contienen la palabra
total=$(grep -c "$palabra" "$fichero")
echo "La palabra '$palabra' aparece en $total líneas:"

# grep -n muestra cada línea encontrada con su número delante
grep -n "$palabra" "$fichero"
