# Wet Cat Food Feeder
Butters is a very special kitty, he can only keep wet food off the white duvets and furniture.  He cant seem to keep dry food down.

This is a bot to open wet cans by winching the lid off.

![image](./images/IMG_0010.JPG?raw=true)

Zoomed view of the whole setup.  Arlo camera under the bench to watch the process.  The PI is wired to a block of relays and a manual mechanical H-bridge is wired to allow for an easy reverse stage as well.

![image](./images/IMG_0011.JPG?raw=true)

cascade of 3 units.  PLA was not strong enough for the winch hub, had 3 of the gray pieces made at shapeways to prevent the shaft from stripping out the winch hub which happened after about 10 cycles. 

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

