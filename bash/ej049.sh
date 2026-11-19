#!/bin/bash
# ============================================================
# Ejercicio 49 - Calificaciones
# Autora: Norah Rodriguez Sanchez
# Descripción: pide una nota de 0 a 10 y muestra la calificación
#              (insuficiente, suficiente, bien, notable o
#              sobresaliente), controlando que la nota sea válida.
# ============================================================

read -p "Introduce una nota (0-10): " nota

# Validamos que sea un número entero (solo dígitos)
if ! [[ "$nota" =~ ^[0-9]+$ ]]; then
    echo "Error: la nota debe ser un número entero."
    exit 1
fi

# Validamos el rango 0-10
if [ "$nota" -lt 0 ] || [ "$nota" -gt 10 ]; then
    echo "Error: la nota debe estar entre 0 y 10."
    exit 1
fi

# Asignamos la calificación según el tramo
if [ "$nota" -lt 5 ]; then
    echo "$nota -> Insuficiente"
elif [ "$nota" -eq 5 ]; then
    echo "$nota -> Suficiente"
elif [ "$nota" -eq 6 ]; then
    echo "$nota -> Bien"
elif [ "$nota" -le 8 ]; then
    echo "$nota -> Notable"
else
    echo "$nota -> Sobresaliente"
fi
