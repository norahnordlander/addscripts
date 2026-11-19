#!/bin/bash
# ============================================================
# Ejercicio 32 - Trocear la fecha
# Autora: Norah Rodriguez Sanchez
# Descripción: a partir de date +%d/%m/%Y extrae y muestra por
#              separado el día, el mes y el año usando cut.
# ============================================================

# Guardamos la fecha con formato dd/mm/aaaa
fecha=$(date +%d/%m/%Y)

# Separamos por "/" y cogemos cada campo
dia=$(echo "$fecha" | cut -d/ -f1)
mes=$(echo "$fecha" | cut -d/ -f2)
anio=$(echo "$fecha" | cut -d/ -f3)

echo "Fecha completa: $fecha"
echo "Día:  $dia"
echo "Mes:  $mes"
echo "Año:  $anio"
