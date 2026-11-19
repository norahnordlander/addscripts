#!/bin/bash
# ============================================================
# Ejercicio 50 - Cadenas
# Autora: Norah Rodriguez Sanchez
# Descripción: pide dos cadenas, comprueba si la primera está
#              vacía y si ambas son iguales o distintas.
# ============================================================

read -p "Primera cadena: " cad1
read -p "Segunda cadena: " cad2

# -z comprueba si la cadena está vacía (longitud 0)
if [ -z "$cad1" ]; then
    echo "La primera cadena está vacía."
else
    echo "La primera cadena no está vacía."
fi

# = compara cadenas (no números)
if [ "$cad1" = "$cad2" ]; then
    echo "Las dos cadenas son iguales."
else
    echo "Las dos cadenas son distintas."
fi
