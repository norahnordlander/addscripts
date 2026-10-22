#!/bin/bash

# Crea un fichero vacío, lo renombra y lo mueve a una carpeta nueva
touch borrador.txt
mv borrador.txt definitivo.txt

mkdir entregado
mv definitivo.txt entregado/
