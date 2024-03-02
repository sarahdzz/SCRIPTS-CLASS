#!/bin/bash
for pag in $(cat pages)
do
    salida=$(curl -s -I "$pag" | sed -n '2p' | tail -1 | awk '{print $3" " $4}' | rev | cut -c3- | rev)

    if [ -z "$salida" ]
    then
        echo -e "$pag FAIL\n"
    else
        echo -e "$pag $salida\n"
    fi
done
