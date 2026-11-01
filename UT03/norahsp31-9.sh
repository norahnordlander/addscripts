#!/bin/bash
# norahsp31-9.sh - Norah Rodriguez Sanchez
# Mantiene en /bacnorah/espejo una copia exacta y sincronizada del
# directorio personal usando rsync.
#   -a        modo archivo: conserva permisos, fechas, propietarios y enlaces
#   -v        muestra los ficheros transferidos (queda en el registro)
#   --delete  borra del espejo lo que se ha borrado en el origen
# Lo ejecuta el servicio norah-espejo.service (temporizador diario 22:00).

ORIGEN="/home/usnorah/"
DESTINO="/bacnorah/espejo/"

mkdir -p "$DESTINO"

echo "=== Sincronizacion espejo: $(date '+%d/%m/%Y %H:%M:%S') ==="

# Se excluyen cache y snap (ficheros temporales y muy pesados)
rsync -av --delete --exclude='.cache/' --exclude='snap/' "$ORIGEN" "$DESTINO"

echo "=== Sincronizacion terminada ==="
