 #!/bin/bash

# En el siguiente Ejemplo vamos a crear un Script que liste todos los archivos
# del directorio actual y cuando encuentre un archivo llamado "prueba" lo elimine.

for i in *; do
    if test $i = "prueba"; then
        echo Inspeccionamos el arhivo: $i
        echo Este archivo cumple con el patrón, por tanto, lo borramos.
        rm $i

    else
        echo No borraré el archivo.
fi
done

# * : El asterisco lo utilizamos para referirnos a todos los archivos del directorio.
# if test $i = "prueba"; then : Si algún archivo es igual a "prueba" ejecútame esto.
# else : En caso de que no se cumpla la condición anterior, ejecútame lo siguiente.
# fi : Se usa para cerrar el bucle if.
# done : Se usa para cerrar el bucle for.
