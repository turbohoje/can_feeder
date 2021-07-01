#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time
import sys, getopt


# GPIOid - rpi-PIN
# 16 - 36
# 20 - 38
# 21 - 40
# 19 - 35
# 13 - 33
# 26 - 37

#for p in [36, 38, 40] :
rev_pins = [35, 37]

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


#GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)

for r in rev_pins + [p]:
    print(r)
    GPIO.setup(r, GPIO.OUT)

for r in rev_pins:
    GPIO.output(r, GPIO.LOW)

GPIO.output(p,GPIO.LOW)

time.sleep(seconds)

for r in rev_pins:
    GPIO.output(r,GPIO.HIGH)

GPIO.output(p,GPIO.HIGH)

GPIO.cleanup()
