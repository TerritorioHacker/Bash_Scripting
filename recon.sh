#!/bin/bash

# Colores
verde="\e[0;32m\033[1m"
finColor="\033[0m\e[0m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
morado="\e[0;35m\033[1m"
tuquesa="\e[0;36m\033[1m"
gris="\e[0;37m\033[1m"

# Variables
ip="$1"
validation=$(ping -c 1 $ip | grep received | awk '{print $4}')

if [ $validation -eq 1 ]; then
    echo -e "\n${verde}[+] Conectado"
    so="$(wichSystem.py $ip | awk '{print $5}' | column)"
    
    if [[ $so = "Linux" || $so = "Windows" ]]; then
        echo -e "\n[+] Sistema Operativo = ${azul}$so${finColor}${verde} \n"
    else
        echo -e "\n[+] Sistema Operativo Desconocido. \n"
    fi

    echo -e "[+] Escaneando puertos abiertos: \n"
   
    # Escaneo básico con Nmap:    
    sudo nmap -p- -sS --open --min-rate 5000 -v -n $ip -oG portScan 2&>/dev/null
    echo -e "[+] Archivo ${azul}portScan${finColor}${verde} creado."
    ports="$(cat portScan | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')" 
    echo -e "\n[+] Puertos abiertos: ${azul}$ports${finColor}${azul} \n"
    
    # Ecaneo de puertos abiertos con Nmap:
    nmap -sC -sV -n -v -p $ports $ip -oN infoScan 2&>/dev/null
    targed=$(cat infoScan | sed -n '6,$p' | head -n -5)
    echo -e "$targed \n"
   
    # Información por puertos encontrados: 
    if [[ "$ports" == *"80"* ]]; then
        echo -e "\n${finColor}${verde}[+] Analizando Puerto ${azul}80 http${finColor}${verde} encontrado: \n"
        whatweb "$ip"
        echo -e "\n${verde}[+] Analizando Puerto ${azul}80 http${finColor}${verde} encontrado: \n"


        wfuzz -w /usr/share/wordlists/directory-list-2.3-big.txt --hc 404 http://$ip/FUZZ.php


        if [[ "$ports" == *"443"* ]]; then
            echo -e "\n${verde}[+] Analizando Puerto ${azul}443 http${finColor}${verde} encontrado:"
            whatweb "$ip"
        fi
    elif [[ "$ports" == *"443"* ]]; then
        echo -e "\n${verde}[+] Analizando Puerto ${azul}443 http${finColor}${verde} encontrado:"
        whatweb "$ip"
    fi

else
    echo -e "\n[+] No se ha podido establecer la conexión. \n"
fi
