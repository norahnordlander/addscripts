#!/bin/bash
# copia_total.sh - Norah Rodriguez Sanchez
# Copia de seguridad TOTAL de /home en /bacnorah.
# Nombre: CopTot-<mes completo><año completo>.tar.bz2  (ej. CopTot-noviembre2026)
# Se ejecuta mensualmente con anacron.

# Idioma espanol para que el nombre del mes salga en castellano
export LC_ALL=es_ES.UTF-8

DESTINO="/bacnorah"
MARCA="$DESTINO/.marca_total"      # guarda la fecha de la ultima copia total
FICHERO="$DESTINO/CopTot-$(date +%B%Y).tar.bz2"

mkdir -p "$DESTINO"

# Copia completa de /home comprimida con bzip2
# (se excluyen cache y snap para que la copia sea mas rapida)
tar -cjf "$FICHERO" --exclude='.cache' --exclude='snap' /home 2>/dev/null

# Se actualiza la marca: las diferenciales copiaran lo cambiado desde aqui
touch "$MARCA"

echo "$(date '+%d/%m/%Y %H:%M:%S') - Copia TOTAL creada: $FICHERO" >> "$DESTINO/copias.log"
