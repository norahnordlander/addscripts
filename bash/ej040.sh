#!/bin/bash
# ============================================================
# Ejercicio 40 - Shells del sistema
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra las distintas shells que aparecen en
#              /etc/passwd y cuántos usuarios usa cada una.
# ============================================================

echo "USUARIOS  SHELL"

# cut -d: -f7 -> extraemos la shell (campo 7)
# sort        -> ordenamos para que uniq agrupe las iguales
# uniq -c     -> cuenta cuántas veces se repite cada shell
# sort -nr    -> de la más usada a la menos usada
cut -d: -f7 /etc/passwd | sort | uniq -c | sort -nr
