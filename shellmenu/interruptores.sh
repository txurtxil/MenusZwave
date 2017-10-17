#!/bin/bash
set -e

# This script is used to manage SmartHomeBox shell
# Write: surfero75
# Date:  2017-06-28

MENUSTR="Selecciona opcion:"

#El tamano de la ventana viene definido por 20 50 8
OPTION=$(whiptail --title "Panel administración SmartHomeBox - surfero75" \
    --menu "$MENUSTR" 20 50 8 --cancel-button Finish --ok-button Select \
    "0"   "Encender Interruptor01" \
    "1"   "Apagar Interruptor01" \
    "2"   "Encender Interruptor02" \
    "3"   "Apagar Interruptor02" \
    3>&1 1>&2 2>&3)

#Bucle principal, insertar las llamadas a los scripts
if [ $OPTION = "0" ]; then
    # Luces Salon
       /usr/bin/curl "http://192.168.1.10x:8080/json.htm?type=command&param=switchlight&idx=19&switchcmd=On"
    elif [ $OPTION = "1" ]; then
       /usr/bin/curl "http://192.168.1.10x:8080/json.htm?type=command&param=switchlight&idx=19&switchcmd=Off"
    elif [ $OPTION = "2" ]; then
        /usr/bin/curl "http://192.168.1.10x:8080/json.htm?type=command&param=switchlight&idx=19&switchcmd=On"
    elif [ $OPTION = "3" ]; then
        /usr/bin/curl "http://192.168.1.10x:8080/json.htm?type=command&param=switchlight&idx=19&switchcmd=Off"
else
        echo "Bad Operation"
fi


