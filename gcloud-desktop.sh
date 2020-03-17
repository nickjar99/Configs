wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt update
sudo apt --assume-yes upgrade

sudo apt install --assume-yes wget curl dirmngr vim nano neofetch ncdu htop neofetch powerline zsh git

git clone https://gitlab.com/NickTheSecond/configs.git

sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken

sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo apt install --assume-yes xscreensaver task-xfce-desktop

sudo systemctl disable lightdm.service

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken

sudo apt install --assume-yes wget curl dirmngr vim nano neofetch ncdu htop neofetch powerline zsh git

git clone https://gitlab.com/NickTheSecond/configs.git
