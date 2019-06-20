#!/bin/sh
 
dev="ttyUSB3"
path="/dev/$dev"
gpio="5"
gpiopath="/sys/class/gpio/gpio5"
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

        echo 1 > "$gpiopath"/value
		sleep 1
        echo 0 > "$gpiopath"/value
else
        echo 6 > /sys/class/gpio/export
        echo "out" > "$gpiopath"/direction
        echo 1 > "$gpiopath"/value
        sleep 1
        echo 0 > "$gpiopath"/value
fi

if [ "$status_res" == "1" ]; then

	echo " turn on slot2"

	screen -S serial"$dev" -L -Logfile usb0log -d -m /dev/"$dev" 115200
	sleep 1
	echo " record ."
	BEGIN=0
	END=10
	for bus  in $(seq $BEGIN $END);
	do
	sleep 2
	echo "."
	done

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


