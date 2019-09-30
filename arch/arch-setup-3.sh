echo "Enabling networkmanager"
sudo systemctl enable NetworkManager.service

echo "Setting up yay"

mkdir -p projects/aur
cd projects/aur
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

cd ~
yay -Syuu dislocker lightdm lightdm-slick-greeter xorg-xinit alacritty xorg-server-xephyr lightdm-settings volctl ttf-ms-fonts ttf-vista-fonts ttf-ms-win10 ttf-google-fonts-git ttf-inconsolata-g font-mathematica ttf-mac-fonts gnome-commander transmission-gtk file-roller ark 