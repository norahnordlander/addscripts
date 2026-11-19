#!/bin/bash
# ============================================================
# Ejercicio 27 - Sustituciones con sed
# Autora: Norah Rodriguez Sanchez
# Descripción: crea un fichero con varias líneas que contienen
#              "Windows" y sustituye todas por "Linux".
# ============================================================

fichero="sistemas.txt"

# Creamos el fichero de ejemplo
cat > "$fichero" << EOF
Windows es un sistema operativo.
En clase usamos Windows Server y Windows 11.
Me gusta más Windows que nada... por ahora.
EOF

echo "Fichero original:"
cat "$fichero"

echo
echo "Después de sustituir:"
# s/buscar/reemplazar/g -> la "g" sustituye TODAS las apariciones
# de cada línea, no solo la primera
sed 's/Windows/Linux/g' "$fichero"
