#!/bin/bash
# copia_diferencial.sh - Norah Rodriguez Sanchez
# Copia de seguridad DIFERENCIAL de /home en /bacnorah: guarda todo lo que
# ha cambiado desde la ultima copia TOTAL.
# Nombre: CopDifSem-<numero de semana del año>.tar.bz2  (ej. CopDifSem-45)
# Se ejecuta semanalmente con cron.

export LC_ALL=es_ES.UTF-8

DESTINO="/bacnorah"
MARCA="$DESTINO/.marca_total"
FICHERO="$DESTINO/CopDifSem-$(date +%V).tar.bz2"

mkdir -p "$DESTINO"

if [ -f "$MARCA" ]; then
    # Solo los ficheros modificados despues de la ultima copia total
    tar -cjf "$FICHERO" --exclude='.cache' --exclude='snap' \
        --newer-mtime="@$(stat -c %Y "$MARCA")" /home 2>/dev/null
else
    # Si aun no hay copia total, se copia todo
    tar -cjf "$FICHERO" --exclude='.cache' --exclude='snap' /home 2>/dev/null
fi

echo "$(date '+%d/%m/%Y %H:%M:%S') - Copia DIFERENCIAL creada: $FICHERO" >> "$DESTINO/copias.log"
