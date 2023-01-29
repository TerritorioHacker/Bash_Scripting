#/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
# Script para actualizar el Sistema Operativo

echo "\n ${blueColour}[+] Iniciando todas las actualizaciones:${endColour}"

echo "\n ${blueColour}[+] Iniciando el Update:${endColour}"

sudo apt update

echo "\n ${blueColour}[+] Iniciando el Upgrade:${endColour}"

sudo apt upgrade -y

echo "\n ${blueColour}[+] Iniciando el Autoremove:${endColour}"

sudo apt autoremove

echo "\n ${blueColour}[+] Actualizando Flatpak:${endColour}"

sudo flatpak update

# Mostrar un mensaje al finalizar el script.

echo "\n ${blueColour}[+] Se han realizado todas las Actualizaciones. ${endColour}"
