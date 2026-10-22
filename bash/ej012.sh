#!/bin/bash

# Muestra las 10 primeras líneas del fichero passwd
head -n 10 /etc/passwd

# Mensaje separador visual
echo "--- SEPARADOR ---"

# Muestra las 10 últimas líneas
tail -n 10 /etc/passwd
