#!/bin/bash
# limpieza.sh - Norah Rodriguez Sanchez
# Elimina SOLO las copias diferenciales del directorio de copias.
# Las copias totales se conservan. Se ejecuta mensualmente con anacron.

DESTINO="/bacnorah"

for copia in "$DESTINO"/CopDifSem-*.tar.bz2; do
    # Si no hay diferenciales, el patron no coincide y se sale
    [ -e "$copia" ] || continue
    rm -f "$copia"
    echo "$(date '+%d/%m/%Y %H:%M:%S') - Limpieza: eliminada $copia" >> "$DESTINO/copias.log"
done
