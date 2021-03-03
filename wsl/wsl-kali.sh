#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y wget curl git vim nano neofetch \
 htop ncdu unzip rar zsh openssh-server powerline \
 hdparm speedtest-cli python3 python3-pip glances ffmpeg

bash ../sh git.sh
# sh zsh-full.sh
bash ../zsh-setup.sh agnoster
bash ../zsh-customize.sh agnoster