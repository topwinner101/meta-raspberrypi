#!/bin/sh
INTERFACE="eth0"
SETTING_IP="192.168.1.1"
PING_IP="192.168.1.2"
DHCP_TIMEOUT="3"
NEW_DHCP="0"
RESULT=0
PING_TIMEOUT="5"
#       if ! ifconfig $INTERFACE down; then
#               echo "Device $INTERFACE not found!"
#               RESULT=1
#       else
#               echo "Device $INTERFACE down!"
#       fi
#       sleep 1
        if ! ifconfig $INTERFACE up; then
            echo "Device $INTERFACE not found!"
            RESULT=1
        else 
                echo "Device $INTERFACE up"
        fi
        sleep 2
        echo "wait interface.."
        sleep 2
        state=`cat /sys/class/net/$INTERFACE/operstate`

        if [ "$state" != "up" ]; then
            echo "$INTERFACE state not up! please check RJ45"
            RESULT=1
        fi
        if [ "$state" == "up" ]; then
            echo "$INTERFACE state up!"
            RESULT=0
        fi

        if [ "$NEW_DHCP" == "1" ]; then
                if [ "$RESULT" == "0" ]; then
                        read -p "Please input request DHCP yes=1 or no=0(enter to default:$DHCP_TIMEOUT): " 
                fi

                        if [ "${DHCP_TIMEOUT}" != "0" ] && [ "${RESULT}" == "0" ]; then
                        ps |grep "udhcpc -i $INTERFACE" |awk '{print $1;}' |xargs kill -9 &>/dev/null

                        udhcpc -i $INTERFACE -t $DHCP_TIMEOUT -T 6 -n > temp_ping
                        dhcp_ip='cat temp_ping | grep for'
                        if  [ -z "$dhcp_ip" ]; then
                                echo "Could not get IP Address"
                                RESULT=1
                        else 
                                echo "get IP Address"
                        fi
                fi

        else

                ifconfig $INTERFACE $SETTING_IP
                echo "host ip: $SETTING_IP"
        fi
 
 

#       if [ "$RESULT" == "0" ]; then
#               read -p "Please input PING_IP(enter to default:$PING_IP): " NEW_PING
#       fi
        if [ -z "$NEW_PING" ]; then
                        echo "PING_IP $PING_IP"
                else
                        PING_IP=$NEW_PING
                        echo "PING_IP $PING_IP"
        fi

        if [ "${SKIPPINGTEST}" != "1" ] && [ "${RESULT}" == "0" ]; then
                ping -I $INTERFACE $PING_IP -c $PING_TIMEOUT | grep %   | awk '/packet loss/{x=$7} END{print x}' > temp_ping
                ping_res=`cat temp_ping`
                if [ "$ping_res" == "0%" ]; then
                        echo "ping $PING_IP !"
                        echo "PASS"
                        echo "PASS" > /etc/factory/factory_eth0_log
                else
                        echo "ping $PING_IP timeout loss:$ping_res"
                        echo "FAIL"
                        echo "FAIL" > /etc/factory/factory_eth0_log
                        RESULT=1
                fi
        fi

