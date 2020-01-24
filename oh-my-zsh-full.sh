# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then rm -rf ~/.oh-my-zsh ~/.zshrc; fi
curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sudo su $USER -c "sh install.sh --unattended"

echo "Customizing oh-my-zsh install..."
sed "11s/robbyrussell/agnoster/" -i ~/.zshrc
sed "219d; 91,94d; 90s/{/{}/" -i ~/.oh-my-zsh/themes/agnoster.zsh-theme
# aliases
echo "alias ytdl=youtube-dl\n" >> ~/.zshrc
echo "alias gcl=\"git clone\"\n" >> ~/.zshrc
echo "alias nf=\"neofetch\"\n" >> ~/.zshrc

###########################################################################################################
# zsh install (root)
sudo su -c '
if [ -d ~/.oh-my-zsh ]; then rm -rf ~/.oh-my-zsh ~/.zshrc; fi
sudo su $USER -c "sh install.sh --unattended"
'
# Changing default shells
if [ $SHELL!=/usr/bin/zsh ]; then
    # needs password
    chsh -s /usr/bin/zsh
    sudo su -c "chsh -s /usr/bin/zsh"
fi
rm install.sh

###########################################################################################################
