#!/bin/sh
pwm_id="0"
pwm_period="1000000"
pwm_duty_cycle="800000"
pwm_enable="1"
 
path="/sys/class/pwm/pwmchip0/pwm$pwm_id"
if [ -d "$path" ]

then
        echo " already export"
        echo "$pwm_period" > /sys/class/pwm/pwmchip0/pwm"$pwm_id"/period   
        echo "$pwm_duty_cycle" > /sys/class/pwm/pwmchip0/pwm"$pwm_id"/duty_cycle
        echo "$pwm_enable" > /sys/class/pwm/pwmchip0/pwm"$pwm_id"/enable

else
      
        echo "$pwm_id" > /sys/class/pwm/pwmchip0/export
        echo " export"
        echo "$pwm_period" > /sys/class/pwm/pwmchip0/pwm"$pwm_id"/period   
        echo "$pwm_duty_cycle" > /sys/class/pwm/pwmchip0/pwm"$pwm_id"/duty_cycle
        echo "$pwm_enable" > /sys/class/pwm/pwmchip0/pwm"$pwm_id"/enable

fi
 
        echo " enable"

status_res=`cat /sys/class/pwm/pwmchip0/pwm"$pwm_id"/enable `
if [ "$status_res" == "$pwm_enable" ]; then
        echo "PASS"
	echo "PASS" > /etc/factory/factory_pwm1_80p_log
else
        echo "FAIL"
	echo "FAIL" > /etc/factory/factory_pwm1_80p_log
fi


