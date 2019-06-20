#!/usr/bin/env python

import time

import pigpio

FAN1_TACH1_GPIO=20
FAN1_TACH2_GPIO=21
FAN2_TACH1_GPIO=16
FAN2_TACH2_GPIO=26

f1t1_pi = pigpio.pi() # Connect to local Pi.
f1t2_pi = pigpio.pi()
f2t1_pi = pigpio.pi()
f2t2_pi = pigpio.pi()

f1t1_callback = f1t1_pi.callback(FAN1_TACH1_GPIO) # Create default tally callback.
f1t2_callback = f1t2_pi.callback(FAN1_TACH2_GPIO) 
f2t1_callback = f2t1_pi.callback(FAN2_TACH1_GPIO) 
f2t2_callback = f2t2_pi.callback(FAN2_TACH2_GPIO) 

start = time.time()

f1t1_last_count = f1t1_callback.tally()
f1t2_last_count = f1t2_callback.tally()
f2t1_last_count = f2t1_callback.tally()
f2t2_last_count = f2t2_callback.tally()

while (time.time() - start) < 100.0:
   f1t1_count = f1t1_callback.tally()
   f1t2_count = f1t2_callback.tally()
   f2t1_count = f2t1_callback.tally()
   f2t2_count = f2t2_callback.tally()
   print("f1t1 {} rpm".format(f1t1_count - f1t1_last_count))
   f1t1_last_count = f1t1_count
 
   time.sleep(1.0)

callback.cancel()

pi.stop() # Disconnect from local Pi.
