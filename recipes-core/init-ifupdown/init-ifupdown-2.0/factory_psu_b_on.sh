#!/bin/sh
checkres="0"
gpio="6"
gpiotype="out"
path="/sys/class/gpio/gpio$gpio"

if [ -h "$path" ]
then
        echo "already export"
        echo $gpiotype > /sys/class/gpio/gpio"$gpio"/direction
else
        echo "export"
        echo $gpio > /sys/class/gpio/export
        echo $gpiotype > /sys/class/gpio/gpio"$gpio"/direction
fi
 
        echo " enable"
#write output
echo $checkres > /sys/class/gpio/gpio"$gpio"/value

#echo "0" > /sys/class/gpio/gpio"$gpio"/value

status_res=`cat /sys/class/gpio/gpio"$gpio"/value `
if [ "$status_res" == "$checkres" ]; then
        echo "PASS"
	echo "PASS" > /etc/factory/factory_psu_b_on_log
else
        echo "FAIL"
	echo "FAIL" > /etc/factory/factory_psu_b_on_log
fi

