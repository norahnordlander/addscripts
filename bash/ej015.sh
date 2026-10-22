#!/bin/bash

# Redirige la salida estándar (1) al listado, y los errores (2) a otro fichero
ls -l /etc > listado.txt
ls /root 2> errores.txt

# Cuenta y muestra las líneas de ambos ficheros usando redirección de entrada (<)
echo "Líneas en listado.txt:"
wc -l < listado.txt

echo "Líneas en errores.txt:"
wc -l < errores.txt
