#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

direccion=$1

echo -e "\n ${yellowColour}------------------------------------${endColour} "
echo -e "\n ${yellowColour}[+] Iniciando Fase de Reconocimieto:${endColour} "
echo -e "\n ${yellowColour}------------------------------------${endColour} "

ip="$(ping -c 1 $1 | grep bytes | tail -n 1 | awk '{print $5}' | awk '{print $2}' FS='(' | awk '{print $1}'  FS=')')"

whichsystem="$(whichSystem.py $ip | awk '{print $5}')"

echo -e "\n   ${greenColour}[+] IP:${endColour}${blueColour} $ip ${endColour}"
echo -e "\n   ${greenColour}[+] Sistema Operativo:${endColour} \n${blueColour} $whichsystem ${endColour}"

# Fase de Reconocimiento básico con Nmap.

sudo nmap -p- -sS --min-rate 5000 -n -Pn $ip -oG allPorts &>/dev/null
ports="$(cat allPorts | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"

echo -e "\n   ${greenColour}[+] Puertos abiertos encontrados:${endColour}${blueColour} $ports ${endColour}\n"

# Escaneo exahustivo con Nmap.

sudo nmap -sCV -n -p $ports $ip -oN Targed &>/dev/null

echo -e "\n   ${greenColour}[+] Escaneo Exahustivo con Nmap guardados en el archivo:${endColour}${blueColour} Targed${endColour}"

whatweb $1 > webScan

echo -e "\n   ${greenColour}[+] Reconocimiento con Whatweb guardado en el archivo:${endColour}${blueColour} WebScan${endColour} \n"
