#!/bin/sh -e

 
tar xvf  pigpio.tar1 
cd /etc/pigpio-master/
make -f MakeRemote
make -f MakeRemote install


# pigpio_path="/etc/pigpio-master/"
# includedir="/usr/include/"
# libdir="/usr/lib/"
# bindir="/usr/bin/"
# mandir="/usr/share/man/"

# cp -f "$pigpio_path"pigpio.h                       "$includedir"
# cp -f "$pigpio_path"pigpiod_if.h                   "$includedir"
# cp -f "$pigpio_path"pigpiod_if2.h                  "$includedir"

# cp -f "$pigpio_path"libpigpio.so.1                 "$libdir"
# cp -f "$pigpio_path"libpigpiod_if.so.1             "$libdir"
# cp -f "$pigpio_path"libpigpiod_if2.so.1            "$libdir"
# cp -f "$pigpio_path"libpigpio.so                   "$libdir"
# cp -f "$pigpio_path"libpigpiod_if.so               "$libdir"
# cp -f "$pigpio_path"libpigpiod_if2.so              "$libdir"

# cp -f "$pigpio_path"pig2vcd                        "$bindir"
# cp -f "$pigpio_path"pigpiod                        "$bindir"
# cp -f "$pigpio_path"pigs                           "$bindir"

# mkdir  "$mandir"man1
# cp  "$pigpio_path"*.1                            "$mandir"man1
# mkdir  "$mandir"man3
# cp  "$pigpio_path"*.3                           "$mandir"man1