#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# GPIOid - rpi-PIN
# 16 - 36
# 20 - 38
# 21 - 40
# 19 - 35
# 13 - 33
# 26 - 37

#for p in [36, 38, 40] :

rev_pins = [35, 37]

p=38


#GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)

for r in rev_pins + [p]:
    print(r)
    GPIO.setup(r, GPIO.OUT)

for r in rev_pins:
    GPIO.output(r, GPIO.LOW)

GPIO.output(p,GPIO.LOW)

time.sleep( 38)

for r in rev_pins:
    GPIO.output(r,GPIO.HIGH)

GPIO.output(p,GPIO.HIGH)

GPIO.cleanup()
