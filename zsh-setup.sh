#!/bin/bash

echo "Installing oh-my-zsh..."
rm -rf ~/.oh-my-zsh ~/.zshrc

curl -s -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
export RUNZSH=no
export CHSH=no
bash install.sh 1>/dev/null 2>&1
rm install.sh

bash zsh-customize.sh $1

