#!/bin/bash

direccion=$1

echo -e "\n [+] Comprobando conexion con: $direccion"

ping -c 1 $direccion &>/dev/null && echo -e "\n [+] La dirección existe."

ping -c 1 $direccion &>/dev/null || echo -e "\n [+] Error en la conexion."

# Operadores Lógicos:
# && : El segundo argumento se ejecuta si el primero tiene un codigo de estado exitoso.
# || : El segundo argumneto se ejecuta si el primero tiene un codigo de estado erroneo.
