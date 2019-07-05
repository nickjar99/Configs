ssh-keygen -f ~/.ssh/id_rsa -N ""


# Updating stuff and installing stuff
sudo apt-get update
sudo apt-get -y full-upgrade
sudo apt-get install -y vim nano git neofetch ncdu dialog glances htop wget curl openssh-server zsh powerline
sudo apt autoremove -y

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
