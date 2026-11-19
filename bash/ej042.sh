#!/bin/bash
# ============================================================
# Ejercicio 42 - Par o impar
# Autora: Norah Rodriguez Sanchez
# Descripción: pide un número y muestra si es par o impar usando
#              el operador módulo (%).
# ============================================================

read -p "Introduce un número: " num

# El resto de dividir entre 2 es 0 si el número es par
resto=$(( num % 2 ))

if [ "$resto" -eq 0 ]; then
    echo "$num es par."
else
    echo "$num es impar."
fi
