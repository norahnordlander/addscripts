#!/bin/bash
# ============================================================
# Ejercicio 35 - Contar vocales
# Autora: Norah Rodriguez Sanchez
# Descripción: pide el nombre de un fichero y muestra cuántas
#              vocales contiene en total (usando tr y wc).
# ============================================================

read -p "Introduce el nombre de un fichero: " fichero

# tr -cd 'aeiou...' -> -c (complemento) + -d (borrar):
#   borra todo lo que NO sea vocal, así solo quedan las vocales
# wc -m cuenta los caracteres que quedan, es decir, las vocales
vocales=$(tr -cd 'aeiouAEIOUáéíóúÁÉÍÓÚ' < "$fichero" | wc -m)

echo "El fichero $fichero contiene $vocales vocales."
