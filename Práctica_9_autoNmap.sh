#!/bin/bash

test -f /usr/bin/nmap

if [ "$(echo $?)" == "0" ]; then
    echo -e "\n [+] Nmap está Instalado."
else
    echo -e "\n [+] Nmap no está Instalado, procedemos a su instalación:" && sudo apt update > /dev/null && sudo apt install nmap -y > /dev/null
fi

ip=$1

ping -c 1 $ip > ping.log

for i in $(seq 60 70); do 

    if test $(grep ttl=$i ping.log -c) = 1; then
        echo -e "\n [+] Es un Linux."
fi
done
for i in $(seq 100 200); do 

    if test $(grep ttl=$i ping.log -c) = 1; then
        echo -e "\n [+] Es un Windows."
fi
done

rm ping.log

sudo nmap -p- -sV -sC --open -sS -n -Pn $ip -oN Scan > /dev/null

echo -e "\n [+] Escaneo guardado en el archivo: Scan."
