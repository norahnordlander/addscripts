#!/bin/bash
# ============================================================
# Ejercicio 25 - Duplicados
# Autora: Norah Rodriguez Sanchez
# Descripción: crea un fichero de nombres y lo muestra ordenado
#              alfabéticamente y sin duplicados.
# ============================================================

# Nombre del fichero que vamos a crear
fichero="nombres.txt"

# Creamos el fichero con varios nombres (algunos repetidos)
cat > "$fichero" << EOF
Pedro
Ana
Luis
Ana
Carmen
Pedro
Beatriz
Luis
EOF

echo "Contenido original:"
cat "$fichero"

echo
echo "Ordenado y sin duplicados:"
# sort -u ordena y elimina las líneas repetidas
sort -u "$fichero"
