#!/bin/sh
address="0x75"
bus="1"
readadd="0x01"
checkadd="0x01"
i2cget -f -y $bus $address $readadd > /etc/factory/factory_pca9548_log
status_res=`cat /etc/factory/factory_pca9548_log`
echo "read:$status_res"
if [ "$status_res" == "$checkadd" ]; then
        echo "PASS"
else
        echo "FAIL"
fi

### i2cset -f -y $bus $address 0x01 0x01  > /etc/factory_pca9548_write_log
## echo "write:"
# cat /etc/factory_pca9548_write_log
