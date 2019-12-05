# mirrorlist & repos
sed -i '6i# Mines LUG Mirror\nServer = https://lug.mines.edu/mirrors/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sed -i "92i[multilib]" /etc/pacman.conf
sed -i "93iInclude = /etc/pacman.d/mirrorlist" /etc/pacman.conf

pacman --noconfirm -Sy git parted

timedate set-ntp true

# Setting up partitions
parted -s /dev/sda mktable msdos
parted -s /dev/sda mkpart primary ext4 0% 100%

mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt --noconfirm base sudo vim nano git wget curl zsh iputils dhcpcd 

cp /root/.zshrc /mnt/root/.zshrc
cp /root/.zshrc /mnt/root/.zshrc-installer
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /usr/bin/bash -c "cd /root && git clone https://gitlab.com/NickTheSecond/configs.git && cd configs/archVM && sh archInstallVM2-chroot.sh"