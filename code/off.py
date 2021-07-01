#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# GPIOid - rpi-PIN https://www.raspberrypi.org/documentation/usage/gpio/
# 16 - 36
# 20 - 38
# 21 - 40
# 19 - 35
# 26 - 37

for p in [35, 37, 36, 38, 40] :

   GPIO.setmode(GPIO.BOARD)
   GPIO.setup(p,GPIO.OUT)
   #GPIO.output(p,GPIO.LOW)
   GPIO.output(p,GPIO.HIGH)

GPIO.cleanup()
