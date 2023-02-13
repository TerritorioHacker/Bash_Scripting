#!/bin/bash

# ESCANER DE PUERTOS ABIERTOS
# El siguiente script nos reportará todos los puertos abiertos
# que tenemos en nuestro sistema.

# Función Ctrl+C 
function ctrl_c(){
    echo -e "\n\n [!] Saliendo... \n"
    exit 1
}

# Ctrl+C
trap ctrl_c INT

# Escaneo de puertos:

echo -e "\n\n [+] Iniciando Escaneo de Puertos:"

for port in $(seq 1 65535); do
  (echo '' >/dev/tcp/127.0.0.1/$port) 2>/dev/null && echo -e "\n   [+] $port - OPEN" &
done; wait

