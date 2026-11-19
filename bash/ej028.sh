#!/bin/bash
# ============================================================
# Ejercicio 28 - UID más alto
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra la línea de /etc/passwd del usuario con el
#              UID más alto (orden numérico por el campo 3).
# ============================================================

echo "Usuario con el UID más alto:"

# sort -t: -> separador ":"
#      -k3 -> ordena por el campo 3 (UID)
#      -n  -> orden numérico
#      -r  -> de mayor a menor
# head -1 se queda con la primera línea (la del UID mayor)
sort -t: -k3 -n -r /etc/passwd | head -1
