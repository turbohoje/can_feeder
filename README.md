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

