#!/bin/bash

echo Reinstalling oh-my-zsh
rm -rf ~/.oh-my-zsh
curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
export RUNZSH=no
sh install.sh
rm install.sh

sh zsh-customize.sh
