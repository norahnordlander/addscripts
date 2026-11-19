#!/bin/bash
# ============================================================
# Ejercicio 22 - Usuario y shell con awk
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra el nombre de usuario y su shell separados
#              por una tabulación, usando awk -F:.
# ============================================================

echo -e "USUARIO\tSHELL"

# -F: separador de campos ":"
# $1 = nombre de usuario, $7 = shell de inicio
awk -F: '{ print $1 "\t" $7 }' /etc/passwd
