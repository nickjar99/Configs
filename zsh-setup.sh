#!/bin/bash

echo Reinstalling oh-my-zsh
rm -rf ~/.oh-my-zsh

curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
export RUNZSH=no
export CHSH=no
bash install.sh
rm install.sh

bash git.sh
bash zsh-customize.sh "$@"

if [[ $( grep ^$(id -un): /etc/passwd | cut -d : -f 7- )!="/usr/bin/zsh" ]]; then
    if [[ "$SHELL"!="/usr/bin/zsh" ]]; then
    # export CHSH=no
        sudo chsh -s /usr/bin/zsh
    fi
fi
