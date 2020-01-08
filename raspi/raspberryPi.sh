sudo apt-get update
sudo apt-get upgrade

echp "What kind of pi? (3/4)"
read version

sudo raspi-config

sudo cp ./rpi${version}BootConfig.txt /boot/config.txt