#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# GPIOid - rpi-PIN
# 16 - 36
# 20 - 38
# 21 - 40


#for p in [36, 38, 40] :

p=40
GPIO.setmode(GPIO.BOARD)
GPIO.setup(p,GPIO.OUT)
GPIO.output(p,GPIO.LOW)
time.sleep(52)
GPIO.output(p,GPIO.HIGH)

GPIO.cleanup()
