#!/bin/bash

# Crea un fichero y sobreescribe su contenido (operador >)
echo "Primera línea" > notas.txt

# Añade nuevas líneas al final del fichero (operador >>)
echo "Segunda línea" >> notas.txt 
echo "Tercera línea" >> notas.txt 

# Muestra el fichero con las líneas numeradas
cat -n notas.txt
