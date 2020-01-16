# Standardizing the directory
#echo ${BASH_SOURCE}
#sleep 1
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# BAD solution
cd ~/configs/raspi


if [ ! -f .progress1 ]; then
    echo "What kind of pi? (3/4)"
    read version
    
    sudo apt-get update
    sudo apt-get upgrade

    # Making my own janky changes
    sudo cp ./rpi${version}BootConfig.txt /boot/config.txt

    # Have the user change settings
    sudo raspi-config

    # saving progress before restart
    touch .progress1
    sudo shutdown -r now
fi


# Checking for progress
if [ ! -f .progress1 ]; then exit 1; fi

if [ ! -f .[progress2 ]; then
    printf "Choose a password (will be used for accounts & VNC): "
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

    # VNC config
    if sudo grep -Fq Authentication=VncAuth /root/.vnc/config.d/vncserver-x11
    then
        sudo sed 's/AuthenticationystemAuth/AuthenticatioVncAuth/' -i /root/.vnc/config.d/vncserver-x11
    else
        sudo su -c 'echo Authentication=VncAuth >> /root/.vnc/config.d/vncserver-x11'
    fi
    echo -e "${password}\n${password}\n" | sudo vncpasswd -service

    # Git config
    git config --global user.email "njarmusz@mymail.mines.edu"
    git config --global user.name "njarmusz"
    git config --global credential.helper store

    touch .progress2
fi

# Core programs
#sudo apt install -y - < rpi-core.txt
sudo apt install -y wget curl vim ncdu powerline zsh git nano zip pigz pbzip2 unzip exfat-utils realvnc-vnc-server realvnc-vnc-viewer


# Zsh setup
sh ../oh-my-zsh-full.sh

# More programs (maybe change later)
#sudo apt install -y - < rpi-more.txt
sudo apt install -y neofetch glances htop gparted gedit baobab chromium imagemagick ffmpeg youtube-dl firefox-esr python3 python3-pip dialog speedtest-cli hdparm
wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -
curl -L https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh | sudo bash

zsh