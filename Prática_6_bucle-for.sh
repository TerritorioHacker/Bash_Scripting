#!/bin/bash

# Crear Bucle For.

# Primer Ejemplo:

echo -e "\n [+] Primer Ejemplo de Bucle For: \n "

for i in Mariano "Territorio Hacker" Lucas Lola; do
        echo El valor de i en esta vuelta es = $i
done

# Segundo Ejemplo:
# Mediante el asterisco seleccionamos todos los archivos que se encuentren en
# la ubicación actual y nos reportará cada uno por vuelta.

echo -e "\n [+] Segundo Ejemplo de Bucle For: \n"

for i in *; do
         echo En esta vuelta, tengo seleccionado el archivo = $i
done
