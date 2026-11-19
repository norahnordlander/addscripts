#!/bin/bash
# ============================================================
# Ejercicio 46 - El mayor de dos
# Autora: Norah Rodriguez Sanchez
# Descripción: pide dos números y muestra cuál es mayor, o si son
#              iguales.
# ============================================================

read -p "Primer número: " n1
read -p "Segundo número: " n2

# Comparamos los dos números
if [ "$n1" -gt "$n2" ]; then
    echo "El mayor es $n1."
elif [ "$n2" -gt "$n1" ]; then
    echo "El mayor es $n2."
else
    echo "Los dos números son iguales ($n1)."
fi
