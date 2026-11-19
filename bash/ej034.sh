#!/bin/bash
# ============================================================
# Ejercicio 34 - Líneas concretas
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra solo las líneas 5 a 10 de /etc/passwd de
#              dos formas: head + tail y sed -n.
# ============================================================

echo "=== Forma 1: head + tail ==="
# head -10 se queda con las 10 primeras líneas
# tail -n +5 muestra desde la línea 5 en adelante (de esas 10)
head -10 /etc/passwd | tail -n +5

echo
echo "=== Forma 2: sed -n ==="
# -n evita que sed imprima todo; '5,10p' imprime de la 5 a la 10
sed -n '5,10p' /etc/passwd
