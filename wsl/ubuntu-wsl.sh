#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y wget curl git vim nano neofetch \
 htop ncdu unzip rar zsh openssh-server powerline \
 hdparm speedtest-cli python3 python3-pip glances ffmpeg mediainfo zip rclone rsync

# Setting up ssh keys if they aren't already
if [ ! -d ~/.ssh ]; then
    ssh-keygen -N "" -f ~/.ssh/id_rsa
else
    echo "SSH keys already exist"
fi

bash ../git.sh
# sh zsh-full.sh
# sh oh-my-zsh-custom.sh
bash ../zsh-setup.sh