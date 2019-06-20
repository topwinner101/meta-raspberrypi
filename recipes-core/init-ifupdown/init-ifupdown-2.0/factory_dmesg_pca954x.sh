#!/bin/sh
check_string="pca954x"
dmesg | grep "pca954x"   > dmesg_temp


echo "$check_string"
status_res=`cat dmesg_temp | awk '/pca954x/{x=$3} END{print x}'  `
if [ "$status_res" == "$check_string" ]; then
        echo "PASS"
        echo "PASS" > /etc/factory/factory_dmesg_pca954x_log
else
        echo "FAIL"
        echo "FAIL" > /etc/factory/factory_dmesg_pca954x_log
fi


