#!/bin/bash

# Pide el año de nacimiento para hacer el cálculo
echo "Introduce tu año de nacimiento:"
read anio

# Variable que guarda la ejecución del comando date para obtener el año actual
actual=$(date +%Y)

# Calcula la edad y la muestra
echo "Tu edad aproximada es $((actual - anio)) años."
