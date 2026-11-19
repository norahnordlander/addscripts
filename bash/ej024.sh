#!/bin/bash
# ============================================================
# Ejercicio 24 - Filtrando con grep
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra los usuarios de /etc/passwd que usan bash
#              como shell y cuántos son.
# ============================================================

echo "Usuarios que usan bash:"

# Buscamos las líneas que terminan en "bash" ($ = final de línea)
# y nos quedamos solo con el nombre de usuario (campo 1)
grep 'bash$' /etc/passwd | cut -d: -f1

# grep -c cuenta las líneas que coinciden
total=$(grep -c 'bash$' /etc/passwd)

echo "Total: $total usuarios"
