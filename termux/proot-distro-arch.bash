#!/bin/bash

pacman -Syuu --noconfirm git wget curl zsh sudo vim

useradd -m -G wheel user

sed -i "s/#* *%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) NOPASSWD: ALL/" /etc/sudoers
echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "Enter Root Password:"
passwd
echo "Enter User Password:"
passwd user

# only one will work
cp -rvf ~/Configs /home/user/Configs
cp -rvf ~/configs /home/user/Configs

# cp proot-distro-arch.sh /home/user
