# Wet Cat Food Feeder
Butters is a very special kitty, he can only keep wet food off the white duvets and furniture. 

This is a bot to open wet cans by winching the lid off.

## Raspberry Pi

Running on a pi3, with pios lite https://www.raspberrypi.org/downloads/raspberry-pi-os/

How to get this server on its feet:
Get on the host with a keyboard and screen, expand filesystem, enable ssh server.
```
apt-get install python3-pip
pip3 install RPi.GPIO git zsh
git clone git@github.com:turbohoje/can_feeder.git
```

## OpenSCAD Models
Below are the models in this project

This base below will cascade hook to other bases.
![base](./baseClamp.scad.png?raw=true)
The base and the top are joined with .25" rod (x4).
![base](./top_motormount.scad.png?raw=true)

#### The following are supplemental models
Prototype winch.
![prototype](./can_feeder.scad.png?raw=true)
This is a gear motor from sparkfun.  This is subtracted from the material above.
![base](./gear_motor.scad.png?raw=true)
This is the spool that goes on the motor.  1/2" nylon strap wraps up around ths.
![base](./spool.scad.png?raw=true)

