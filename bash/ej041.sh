#!/bin/bash
# ============================================================
# Ejercicio 41 - Positivo o negativo
# Autora: Norah Rodriguez Sanchez
# Descripción: pide un número y muestra si es positivo, negativo
#              o cero.
# ============================================================

read -p "Introduce un número: " num

# Comparamos el número con 0 usando operadores numéricos
if [ "$num" -gt 0 ]; then
    echo "$num es positivo."
elif [ "$num" -lt 0 ]; then
    echo "$num es negativo."
else
    echo "El número es cero."
fi
