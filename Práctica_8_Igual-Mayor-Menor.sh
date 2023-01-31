#!/bin/bash

# En el siguiente ejemplo, vamos a crear un Script, al que podamos pasarle dos números
# y nos devuelva cual es mayo, menor o si son iguales.

primernum=$1
segundonum=$2

if test $primernum -eq $segundonum; then
    echo -e "\n [+] Los dos números son iguales."
elif test $primernum -gt $segundonum; then
    echo -e "\n [+] El número $primernum es mayor que $segundonum"
elif test $primernum -lt $segundonum; then
    echo -e "\n [+] El número $primernum es menor que $segundonum"
else 
    echo -e "\n [+] Hubo un error."
fi
