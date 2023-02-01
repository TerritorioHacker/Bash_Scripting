#!/bin/bash

# Creación de directorios de trabajo, reporte de Ip, Puertos Abiertos, escaneo y automatización de Nmap y Whatweb.

# Sintaxis: ./script.sh [Nombre del Laboratorio] [Dirección]
#       Ej: ./script.sh Machine 10.10.10.10
#       Ej: ./script.sh Prueba www.prueba.com

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


echo -e "\n ${yellowColour}------------------------------------${endColour} "
echo -e "\n ${yellowColour}[+] Iniciando StartLab:${endColour} "
echo -e "\n ${yellowColour}------------------------------------${endColour} "

name=$1
direccion=$2
ip="$(ping -c 1 $direccion | grep bytes | tail -n 1 | awk '{print $5}' | awk '{print $2}' FS='(' | awk '{print $1}'  FS=')')"
whichsystem="$(whichSystem.py $ip | awk '{print $5}' | tail -n 2)"

ports=$(cat portScan | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')
port=$(cat portScan | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs)

echo -e "\n ${greenColour}[+] Creando directorios de trabajo de la máquina: ${endColour}${blueColour} $name ${endColour}"
echo -e "\n ${greenColour}[+] Iniciando fase de Reconocimineto: ${endColour}"

mkdir $name
cd $name
mkdir {nmap,content,exploits,scripts}
cd nmap
nmap -p- --open -sS --min-rate 5000 -n $ip -oG portScan &>/dev/null

echo -e "\n   ${greenColour}[-] IP:${endColour}${blueColour} $ip ${endColour}"
echo -e "\n   ${greenColour}[-] Sistema Operativo:${endColour}${blueColour} $whichsystem ${endColour}"

echo -e "\n   ${greenColour}[-] Puertos Abiertos:${endColour}${blueColour} $port${endColour}"
echo -e "\n ${greenColour}[+] Iniciando reconocimiento exahustivo de puertos con Nmap: ${endColour}"

nmap -sCV -n -p $ports $ip -oN scanTarged &>/dev/null

echo -e "\n   ${greenColour}[-] Resultados en el archivo:${endColour}${blueColour} scanTarged ${endColour}"
echo -e "\n ${greenColour}[+] Escaneo mediante el script http-enum: ${endColour}"

nmap --script http-enum -p $ports $ip -oN webScan &>/dev/null

echo -e "\n   ${greenColour}[-] Resultados en el archivo:${endColour}${blueColour} webScan ${endColour}"

echo -e "\n ${greenColour}[+] Lanzando WhatWeb: ${endColour} \n"

whatweb $direccion

echo -e "\n ${greenColour}[+] Fin del Escaneo. ${endColour} \n"
