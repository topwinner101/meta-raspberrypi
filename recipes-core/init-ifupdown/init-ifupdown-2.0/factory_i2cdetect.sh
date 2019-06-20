#!/bin/sh
 
BEGIN=0
END=10
for bus  in $(seq $BEGIN $END);
do
   i2cdetect -r -y  $bus  > /etc/factory/factory_i2c"$bus"_log
done

