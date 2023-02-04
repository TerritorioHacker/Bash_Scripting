#!/bin/bash

#Colour
greenColour="\e[0;32m\033[1m"

level=$1

echo -e "\n ${greenColour}[+] Over The Wire: Bandit${endColour}"
echo -e "\n ${greenColour}[+] Nivel: $1${endColour}"

ssh bandit$1@bandit.labs.overthewire.org -p 2220

