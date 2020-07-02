# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then rm -rf ~/.oh-my-zsh ~/.zshrc; fi
curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sudo su $USER -c "sh install.sh --unattended"

sh zsh-customize.sh

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
