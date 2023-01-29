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

echo -e "${blueColour}[+] Iniciando todas las actualizaciones:${endColour}"

echo -e "${blueColour}[+] Iniciando el update:${endColour}"

sudo apt update

echo -e "${blueColour}[+] Iniciando el upgrade:${endColour}"

sudo apt upgrade -y

echo -e "${blueColour}[+] Iniciando el autoremove:${endColour}"

sudo apt autoremove

echo -e "${blueColour}[+] Actualizando Flatpak:${endColour}"

flatpak update

echo -e "${blueColour}[+] Actualizando paquetes Snap:${endColour}"

snap refresh

# Mostrar un mensaje al finalizar el script.

echo -e "\n ${blueColour}[+] Se han realizado todas las actualizaciones. ${endColour}"
