#!/bin/bash
# ============================================================
# Ejercicio 26 - Mayúsculas con tr
# Autora: Norah Rodriguez Sanchez
# Descripción: pide una frase y la muestra en mayúsculas y
#              después sin espacios.
# ============================================================

# Pedimos la frase
read -p "Escribe una frase: " frase

# tr 'a-z' 'A-Z' convierte minúsculas en mayúsculas
# ([:lower:] y [:upper:] también admite letras con tilde según el locale)
echo "En mayúsculas: $(echo "$frase" | tr '[:lower:]' '[:upper:]')"

# tr -d ' ' borra todos los espacios
echo "Sin espacios:  $(echo "$frase" | tr -d ' ')"
