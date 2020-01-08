#!/bin/bash

REINSTALL=-1

while [ $REINSTALL = -1 ]; do
    printf "Reinstall oh-my-zsh? (y/n) "
    read answer
    if [ ${#answer} != 0 ] && ([ $answer = "y" ] || [ $answer = "Y" ]); then
        REINSTALL=1
    elif [ ${#answer} != 0 ] && ([ $answer = "n" ] || [ $answer = "N" ]); then
        REINSTALL=0
    else
        printf "Invalid input, try again.\n"
    fi
done

if [ $REINSTALL = 1 ]; then
    echo "Uninstalling zsh..."
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.zshrc.pre-oh-my-zsh
    mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh

    echo "Reinstalling zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    sed "11 s/robbyrussell/agnoster" ~/.zshrc
    echo "\nalias ytdl=youtube-dl\n" >> ~/.zshrc
    echo "\nalias gcl=\"git clone\"\n" >> ~/.zshrc

else
    echo "Not reinstalling zsh"
fi

