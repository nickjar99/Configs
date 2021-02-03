#!/bin/bash

echo "Customizing oh-my-zsh install..."

# takes away left side of status bar
#sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
#sed "219d; 91,94d; 90s/{/{}/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme

# aliases
echo "alias ytdl=youtube-dl\n" >> ~/.zshrc
echo "alias gcl=\"git clone\"\n" >> ~/.zshrc
echo "alias nf=\"neofetch\"\n" >> ~/.zshrc


echo "function y () { time youtube-dl -o \"%(title)s.%(ext)s\" $@ }" >> ~/.zshrc

echo "function gcl () { git clone $@ }" >> ~/.zshrc
echo "function gpl () { git pull }" >> ~/.zshrc
echo "function gph () { git push }" >> ~/.zshrc
echo "function f () { find . -iname \"$@\" }" >> ~/.zshrc



echo "alias n=ncdu" >> ~/.zshrc




