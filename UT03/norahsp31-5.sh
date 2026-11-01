#!/bin/bash
# norahsp31-5.sh - Norah Rodriguez Sanchez
# Revisa todos los archivos de registro de /var/log y localiza las lineas
# que contienen "error" o "fail". Genera un informe nuevo separando
# visualmente cada archivo de origen para revisarlo rapidamente.
# Uso: sudo ./norahsp31-5.sh

# Colores para la salida por pantalla
VERDE='\e[1;32m'; ROJO='\e[1;31m'; AMARILLO='\e[1;33m'; AZUL='\e[1;34m'; NC='\e[0m'

# Se necesita root para poder leer todos los registros
if [ "$EUID" -ne 0 ]; then
    echo -e "${ROJO}Este script debe ejecutarse con sudo.${NC}"
    exit 1
fi

# El informe se guarda junto al script, con fecha y hora en el nombre
DIR="$(cd "$(dirname "$0")" && pwd)"
INFORME="$DIR/informe_errores_$(date +%Y%m%d_%H%M%S).txt"

# Cabecera del informe
{
    echo "=================================================================="
    echo "              INFORME DE ERRORES DEL SISTEMA"
    echo "  Equipo: $(hostname)"
    echo "  Fecha:  $(date '+%d/%m/%Y %H:%M:%S')"
    echo "  Busqueda: lineas que contienen 'error' o 'fail' en /var/log"
    echo "=================================================================="
} > "$INFORME"

total=0
ficheros=0

echo -e "${AZUL}=== Revisando los registros de /var/log ===${NC}"

# Se recorren todos los archivos de /var/log
# (se excluyen los comprimidos y el journal binario de systemd)
while IFS= read -r -d '' fichero; do
    # -I ignora binarios, -i no distingue mayusculas, -E permite "error|fail"
    lineas=$(grep -I -i -E "error|fail" "$fichero" 2>/dev/null)

    if [ -n "$lineas" ]; then
        num=$(echo "$lineas" | wc -l)
        total=$((total + num))
        ficheros=$((ficheros + 1))

        # Bloque separado visualmente para cada archivo de origen
        {
            echo ""
            echo "##################################################################"
            echo "## ARCHIVO: $fichero   ($num lineas)"
            echo "##################################################################"
            echo "$lineas"
        } >> "$INFORME"

        echo -e "${AMARILLO}$fichero${NC}: $num lineas encontradas"
    fi
done < <(find /var/log -type f ! -name "*.gz" ! -name "*.xz" ! -path "/var/log/journal/*" -print0 | sort -z)

# Resumen final del informe
{
    echo ""
    echo "=================================================================="
    echo "  RESUMEN: $total lineas encontradas en $ficheros archivos"
    echo "=================================================================="
} >> "$INFORME"

# El informe pasa a ser del usuario que lanzo sudo (para poder abrirlo)
[ -n "$SUDO_USER" ] && chown "$SUDO_USER":"$SUDO_USER" "$INFORME"

echo -e "${VERDE}Informe generado: $INFORME${NC}"
echo -e "${VERDE}Total: $total lineas en $ficheros archivos${NC}"
