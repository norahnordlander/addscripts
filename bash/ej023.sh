#!/bin/bash
# ============================================================
# Ejercicio 23 - Contador wc
# Autora: Norah Rodriguez Sanchez
# Descripción: pide el nombre de un fichero y muestra por separado
#              su número de líneas, palabras y caracteres.
# ============================================================

# Pedimos el fichero al usuario
read -p "Introduce el nombre de un fichero: " fichero

# Contamos cada cosa por separado. Usamos "< fichero" para que
# wc devuelva solo el número, sin el nombre del fichero.
lineas=$(wc -l < "$fichero")
palabras=$(wc -w < "$fichero")
caracteres=$(wc -m < "$fichero")

# Mostramos los resultados
echo "Fichero:     $fichero"
echo "Líneas:      $lineas"
echo "Palabras:    $palabras"
echo "Caracteres:  $caracteres"
