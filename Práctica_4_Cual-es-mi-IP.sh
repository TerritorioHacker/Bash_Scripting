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

miIpPrivada="$(ip a | grep eth0 | tail -n 1 | awk '{print $2}' | awk '{print $1}' FS='/')"
miIpPublica="$(curl ifconfig.me)"

echo -e "\n ${greenColour}[+] ¿Cual es mi Ip?${endColour} \n"
echo -e "\n ${greenColour}[+]${endColour} Esta es tu direccion Ip Privada: -->${greenColour} ${miIpPrivada} ${endColour}"
echo -e " ${greenColour}[+]${endColour} Esta es tu direccion Ip Pública: -->${greenColour} ${miIpPublica} ${endColour} \n"
