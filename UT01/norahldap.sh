#!/bin/bash
# ==========================================================
# Script:      norahldap.sh
# Autora:      Norah Rodriguez Sanchez
# Modulo:      ADD - Supuesto Practico UT01
# Descripcion: Menu interactivo para gestionar el correo de
#              los usuarios del dominio LDAP norah2026.ldap
# ==========================================================

# Datos del dominio LDAP
BASE="dc=norah2026,dc=ldap"
ADMIN="cn=admin,$BASE"

# Se pide la contrasena del administrador una sola vez (no se muestra en pantalla)
read -s -p "Contrasena del administrador LDAP: " PASS
echo

# Funcion que devuelve el DN de un usuario a partir de su uid
buscar_dn() {
    ldapsearch -x -LLL -b "$BASE" "(uid=$1)" dn | sed -n 's/^dn: //p'
}

# Bucle principal del menu
while true; do
    echo
    echo "========= MENU LDAP norah2026.ldap ========="
    echo "1) Eliminar el correo de un usuario"
    echo "2) Modificar el correo de un usuario"
    echo "3) Realizar busquedas"
    echo "4) Salir"
    echo "============================================"
    read -p "Elige una opcion: " OPCION

    case $OPCION in
        1)
            # Opcion 1: borrar el atributo mail de un usuario
            read -p "Usuario (uid) al que quitar el correo: " USUARIO
            DN=$(buscar_dn "$USUARIO")
            if [ -z "$DN" ]; then
                echo "ERROR: el usuario $USUARIO no existe."
                continue
            fi
            ldapmodify -x -D "$ADMIN" -w "$PASS" <<EOF
dn: $DN
changetype: modify
delete: mail
EOF
            [ $? -eq 0 ] && echo "Correo de $USUARIO eliminado correctamente."
            ;;
        2)
            # Opcion 2: sustituir (o crear) el atributo mail de un usuario
            read -p "Usuario (uid) a modificar: " USUARIO
            DN=$(buscar_dn "$USUARIO")
            if [ -z "$DN" ]; then
                echo "ERROR: el usuario $USUARIO no existe."
                continue
            fi
            read -p "Nuevo correo: " CORREO
            ldapmodify -x -D "$ADMIN" -w "$PASS" <<EOF
dn: $DN
changetype: modify
replace: mail
mail: $CORREO
EOF
            [ $? -eq 0 ] && echo "Correo de $USUARIO cambiado a $CORREO."
            ;;
        3)
            # Opcion 3: busquedas mostrando solo nombre (cn) y correo (mail)
            echo "a) Consultar un usuario concreto"
            echo "b) Listar todos los usuarios"
            read -p "Elige a o b: " TIPO
            if [ "$TIPO" = "a" ]; then
                read -p "Usuario (uid) a consultar: " USUARIO
                FILTRO="(uid=$USUARIO)"
            else
                FILTRO="(objectClass=inetOrgPerson)"
            fi
            # Se quitan las lineas dn: para mostrar unicamente nombre y correo
            ldapsearch -x -LLL -b "$BASE" "$FILTRO" cn mail | grep -v "^dn:"
            ;;
        4)
            echo "Saliendo del programa..."
            exit 0
            ;;
        *)
            echo "Opcion no valida, elige 1, 2, 3 o 4."
            ;;
    esac
done
