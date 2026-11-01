#!/bin/bash
# norahsp31-4.sh - Norah Rodriguez Sanchez
# Desinstala automaticamente los programas indicados en programas.txt,
# que debe estar en el mismo directorio que este script.
# Si un programa no esta instalado, avisa y continua con el siguiente.
# Uso: sudo ./norahsp31-4.sh

# Colores para la salida
VERDE='\e[1;32m'; ROJO='\e[1;31m'; AMARILLO='\e[1;33m'; AZUL='\e[1;34m'; NC='\e[0m'

# Se comprueba que se ejecuta como root (necesario para desinstalar)
if [ "$EUID" -ne 0 ]; then
    echo -e "${ROJO}Este script debe ejecutarse con sudo.${NC}"
    exit 1
fi

# Directorio donde esta el script (programas.txt debe estar ahi)
DIR="$(cd "$(dirname "$0")" && pwd)"
FICHERO="$DIR/programas.txt"

# Se comprueba que existe el fichero con la lista de programas
if [ ! -f "$FICHERO" ]; then
    echo -e "${ROJO}No se encuentra el fichero $FICHERO${NC}"
    exit 1
fi

echo -e "${AZUL}=== Desinstalacion de programas desde $FICHERO ===${NC}"

# Se recorre el fichero linea a linea (cada linea = un programa)
while IFS= read -r programa || [ -n "$programa" ]; do
    # Se quitan espacios y se saltan las lineas vacias
    programa=$(echo "$programa" | xargs)
    [ -z "$programa" ] && continue

    echo "-----------------------------------------"
    echo -e "Comprobando ${AZUL}$programa${NC}..."

    # Se comprueba si el paquete esta realmente instalado
    if dpkg-query -W -f='${Status}' "$programa" 2>/dev/null | grep -q "install ok installed"; then
        echo -e "${AMARILLO}Desinstalando $programa...${NC}"
        # < /dev/null evita que apt lea las lineas del fichero
        if apt-get remove -y "$programa" < /dev/null > /dev/null 2>&1; then
            echo -e "${VERDE}OK: $programa desinstalado correctamente${NC}"
        else
            echo -e "${ROJO}ERROR: no se pudo desinstalar $programa${NC}"
        fi
    else
        echo -e "${ROJO}AVISO: $programa no esta instalado. Se continua con el siguiente.${NC}"
    fi
done < "$FICHERO"

echo "-----------------------------------------"
echo -e "${VERDE}Proceso terminado.${NC}"
