#!/bin/bash

cd ~
mkdir aur
git clone https://github.com/nickjar99/Configs.git

cd Configs
sh oh-my-zsh-original.sh
sh zsh-customize.sh
sh git.sh

# Arch setup scripts
cd termux/archbins
./makeyay

yay -Syuu yay-git ncdu zsh ncdu neofetch git-lfs base-devel
