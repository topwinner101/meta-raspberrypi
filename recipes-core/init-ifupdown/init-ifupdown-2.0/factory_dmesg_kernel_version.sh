#!/bin/sh
check_version="4.14.98"
dmesg | grep "Linux version"   > linux_ver


echo "$check_version"
status_res=`cat linux_ver | awk '/Linux/{x=$5} END{print x}'  `
if [ "$status_res" == "$check_version" ]; then
        echo "PASS"
        echo "PASS" > /etc/factory/factory_dmesg_log
else
        echo "FAIL"
        echo "FAIL" > /etc/factory/factory_dmesg_log
fi


