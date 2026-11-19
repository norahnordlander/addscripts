#!/bin/bash
# ============================================================
# Ejercicio 48 - ¿Existe el usuario?
# Autora: Norah Rodriguez Sanchez
# Descripción: pide un nombre de usuario y comprueba si existe en
#              el sistema (usando grep sobre /etc/passwd).
# ============================================================

read -p "Nombre de usuario: " usuario

# Buscamos una línea que EMPIECE por "usuario:" (^ = inicio de línea)
# -q = modo silencioso: no muestra nada, solo devuelve si encontró
if grep -q "^$usuario:" /etc/passwd; then
    echo "El usuario '$usuario' existe en el sistema."
    # Mostramos también su información con id
    id "$usuario"
else
    echo "El usuario '$usuario' NO existe en el sistema."
fi
