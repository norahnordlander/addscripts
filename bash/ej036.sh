#!/bin/bash
# ============================================================
# Ejercicio 36 - Informe con tee
# Autora: Norah Rodriguez Sanchez
# Descripción: genera un informe con el nombre de la máquina, la
#              lista de usuarios humanos y su total; lo muestra
#              por pantalla y lo guarda en informe.txt con tee.
# ============================================================

informe="informe.txt"

# Usuarios humanos: UID >= 1000 y distinto de 65534 (nobody)
humanos=$(awk -F: '$3 >= 1000 && $3 != 65534 { print $1 }' /etc/passwd)
total=$(echo "$humanos" | grep -c .)

# Agrupamos todo con { } y lo pasamos a tee:
# tee muestra por pantalla Y escribe en el fichero a la vez
{
    echo "===== INFORME DEL SISTEMA ====="
    echo "Fecha:   $(date)"
    echo "Máquina: $(hostname)"
    echo
    echo "Usuarios humanos:"
    echo "$humanos"
    echo
    echo "Total de usuarios humanos: $total"
} | tee "$informe"

echo
echo "Informe guardado en $informe"
