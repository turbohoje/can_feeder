#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time
import sys, getopt

# GPIOid - rpi-PIN
# 16 - 36
# 20 - 38
# 21 - 40


#for p in [36, 38, 40] :

feeder = None
seconds = None

def err(str):
    print(str)
    exit(2)

try:
    opts, args = getopt.getopt(sys.argv[1:],"f:s:",["feeder=","seconds="])
except getopt.GetoptError:
    err(__file__ + ' -f <feeder> -s <seconds> | --feeder=<feeder> --seconds=<seconds>')
for opt, arg in opts:
    if opt in ['-f', '--feeder', '--feeder=']:
        try:
            feeder = [0,36,38,40][int(arg)]
        except:
            err(__file__ + ' -f <feeder> -s <seconds> | --feeder=<feeder> --seconds=<seconds>')
    elif opt in ['-s', '--seconds', '--seconds=']:
        seconds = int(arg)
if(feeder == None or seconds == None):
    err(__file__ + ' -f <feeder> -s <seconds> | --feeder=<feeder> --seconds=<seconds>')

p=feeder

GPIO.setmode(GPIO.BOARD)
GPIO.setup(p,GPIO.OUT)
GPIO.output(p,GPIO.LOW)
time.sleep(seconds)
GPIO.output(p,GPIO.HIGH)

GPIO.cleanup()
