echo "Enabling networkmanager"
sudo systemctl enable NetworkManager.service

echo "Setting up yay"

mkdir -p projects/aur
cd projects/aur
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

cd ~
yay -Syuu - < pacman-aur.txt