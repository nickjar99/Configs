#!/bin/bash

cd ~
mkdir aur
git clone https://github.com/nickjar99/Configs.git

cd Configs
# oh-my-zsh manual install
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh --unattended
echo Removing installer
rm -v install.sh
#sh oh-my-zsh-original.sh
sh zsh-customize.sh
sh git.sh

# Arch setup scripts
cd ~/Configs/termux/
./archbins/patchmakepkg
./archbins/makeyay

yay -Syuu yay-git ncdu zsh ncdu neofetch git-lfs base-devel
