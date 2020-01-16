

if [ ! -f ./progress1 ]; then
    echo "What kind of pi? (3/4)"
    read version
    
    sudo apt-get update
    sudo apt-get upgrade

    # Making my own janky changes
    sudo cp ./rpi${version}BootConfig.txt /boot/config.txt
fi

    # Have the user change settings
    sudo raspi-config

    # saving progress before restart
    touch progress1
    sudo shutdown -r now


# Checking for progress
if [ ! -f ./progress1 ]; then exit 1; rm progress1; fi


printf "Choose a password: "
read -s password
passwd pi - < $passwd
echo -e "${password}\n${password}\n" | sudo passwd pi


# Setting up ssh keys if they aren't already
if [ ! -d ~/.ssh ]; then
    ssh-keygen -N "" -f ~/.ssh/id_rsa
else
    echo "SSH keys already exist"
fi


# Starting SSH daemon
sudo systemctl enable ssh
sudo systemctl start ssh


# Core programs
sudo apt install -y - < rpi-core.txt


# Git config
git config --global user.email "njarmusz@mymail.mines.edu"
git config --global user.name "njarmusz"
git config --global credential.helper store

sh ../oh-my-zsh-full.sh


# VNC config
if sudo grep -Fq Authentication=VncAuth /root/.vnc/config.d/vncserver-x11
then
    sudo sed 's/AuthenticationystemAuth/AuthenticatioVncAuth/' -i /root/.vnc/config.d/vncserver-x11
else
    sudo su -c 'echo Authentication=VncAuth >> /root/.vnc/config.d/vncserver-x11'
fi
echo -e "${password}\n${password}\n" | sudo vncpasswd -service


# More programs (maybe change later)
sudo apt install -y - < rpi-more.txt
wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -
curl -L https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh | sudo bash

zsh