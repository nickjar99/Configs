# Prompts for password at the start
sudo su -c ""

SSHFILE=~/.ssh/id_rsa

if not test -f "$SSHFILE"; then
    ssh-keygen -f ~/.ssh/id_rsa -N ""
else
    echo "SSH keys already set up, skipping"
fi

# Updating stuff and installing stuff
sudo apt-get update
sudo apt-get -y full-upgrade
sudo apt-get install -y vim nano git neofetch ncdu dialog glances htop wget curl openssh-server zsh powerline
sudo apt autoremove -y

# Configuring git
git config --global user.name nick
git config --global user.email nickjar99@gmail.com
git config --global credential.helper store


# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
