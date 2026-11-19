#!/bin/bash
# ============================================================
# Ejercicio 31 - Mi IP
# Autora: Norah Rodriguez Sanchez
# Descripción: muestra únicamente la IP principal de la máquina
#              filtrando la salida de "ip a" (o hostname -I).
# ============================================================

# Forma 1: con "ip a"
# - grep 'inet '     -> líneas con direcciones IPv4
# - grep -v '127.0.0.1' -> descartamos el loopback
# - head -1          -> la primera es la principal
# - awk '{print $2}' -> campo con la IP/máscara (ej. 192.168.1.10/24)
# - cut -d/ -f1      -> quitamos la máscara
ip_principal=$(ip a | grep 'inet ' | grep -v '127.0.0.1' | head -1 | awk '{ print $2 }' | cut -d/ -f1)
echo "IP principal (ip a):        $ip_principal"

# Forma 2: con hostname -I (muestra todas las IPs; cogemos la primera)
ip_hostname=$(hostname -I | awk '{ print $1 }')
echo "IP principal (hostname -I): $ip_hostname"
