#!/bin/bash

echo "Customizing oh-my-zsh install..."

sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "219d; 91,94d; 90s/{/{}/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme
# aliases
echo "alias ytdl=youtube-dl\n" >> ~/.zshrc
echo "alias gcl=\"git clone\"\n" >> ~/.zshrc
echo "alias nf=\"neofetch\"\n" >> ~/.zshrc


echo "function y () { youtube-dl -o "%(title)s.%(ext)s" $@ }" >> ~/.zshrc


