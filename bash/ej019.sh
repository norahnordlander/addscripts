#!/bin/bash

# Crea un fichero original y dos tipos de enlaces hacia él
touch original.txt
ln -s original.txt enlace_blando # Enlace simbólico
ln original.txt enlace_duro # Enlace duro

# Los compara mostrando su número de inodo y propiedades
ls -li original.txt enlace_blando enlace_duro
