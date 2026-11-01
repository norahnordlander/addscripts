#!/bin/bash
# norahsp31-7.sh - Norah Rodriguez Sanchez
# Comprueba el porcentaje de ocupacion de cada particion del sistema.
# Si alguna supera el umbral (80% por defecto), anade una linea al
# registro /var/log/norah_disco.log con fecha, hora, particion y uso.
# Uso: sudo ./norahsp31-7.sh          (umbral 80%)
#      sudo ./norahsp31-7.sh 10       (umbral 10%, para pruebas)

# Umbral: primer parametro o 80 si no se indica
UMBRAL=${1:-80}

# Fichero de registro propio
LOG="/var/log/norah_disco.log"

# df -P: formato estandar de una linea por particion
# -x: se excluyen sistemas de ficheros virtuales y CD/DVD
#     (iso9660 y udf son de solo lectura y siempre estan al 100%)
# tail -n +2: se quita la linea de cabecera
df -P -x tmpfs -x devtmpfs -x squashfs -x overlay -x efivarfs -x iso9660 -x udf | tail -n +2 |
while read -r particion tamano usado libre porcentaje montaje; do
    # Se quita el simbolo % para poder comparar numeros
    uso=${porcentaje%\%}

    # Si el uso supera el umbral, se anade una linea al registro
    if [ "$uso" -gt "$UMBRAL" ]; then
        echo "$(date '+%d/%m/%Y') $(date '+%H:%M:%S') - Particion: $particion ($montaje) - Uso: ${uso}% (umbral ${UMBRAL}%)" >> "$LOG"
    fi
done
