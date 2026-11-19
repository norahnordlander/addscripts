#!/bin/bash
# ============================================================
# Ejercicio 21 - Usuarios con cut
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra únicamente los nombres de usuario de
#              /etc/passwd utilizando cut.
# ============================================================

echo "Usuarios del sistema:"

# -d: indica el delimitador de campos (los dos puntos)
# -f1: nos quedamos solo con el primer campo (nombre de usuario)
cut -d: -f1 /etc/passwd
