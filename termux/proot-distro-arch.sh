#!/bin/bash

pacman -Syuu git wget curl zsh sudo vim

useradd -m -G wheel user

sed -i "s/#* *%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) NOPASSWD: ALL/"
echo "\nuser ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers

echo "Enter Root Password:"
passwd
echo "Enter User Password:"
passwd user

# only one will work
cp -rv ~/Configs /home/user/Configs
cp -rv ~/configs /home/user/Configs

# cp proot-distro-arch.sh /home/user
