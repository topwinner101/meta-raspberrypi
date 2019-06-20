#!/bin/sh
 
dev="ttyUSB0"
path="/dev/$dev"
gpio="6"
gpiopath="/sys/class/gpio/gpio6"
if [ -e "$path" ]

then
        echo " find $dev"
        status_res=1
else
        echo " not find $dev"
		status_res=0
fi

if [ -h "$gpiopath" ]
then
	echo "gpio ready"
else
        echo 6 > /sys/class/gpio/export
        echo "out" > "$gpiopath"/direction
fi


value_res=`cat "$gpiopath"/value`
if [ "$value_res" == "0" ]; then
	echo " slot1 ready"
else
    echo 0 > "$gpiopath"/value	 
   	echo " turn on slot1"
	for bus  in $(seq 0 10);
	do
	sleep 2
	echo "."
	done
fi



if [ "$status_res" == "1" ]

then
	screen -S serial"$dev" -L -Logfile usb0log -d -m /dev/"$dev" 115200
	stty -F /dev/ttyUSB0  speed 115200 raw
	echo "root" > /dev/ttyUSB0
	sleep 1
	echo "dmesg" > /dev/ttyUSB0
	sleep 5
	screen -S serial"$dev"  -D /dev/"$dev" 115200
fi


# status_res=`cat /sys/class/pwm/pwmchip0/pwm"$pwm_id"/enable `
if [ "$status_res" == "1" ]; then
	echo "PASS"
	echo "PASS" > /etc/factory/factory_"$dev"_log
else
	echo "FAIL"
	echo "FAIL" > /etc/factory/factory_"$dev"_log
fi


