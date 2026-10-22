#!/bin/bash

# Pide el nombre de un fichero por teclado
echo "Introduce el nombre del fichero:"
read fichero

# Muestra el tamaño legible y el tipo de contenido
ls -lh "$fichero"
file "$fichero"
