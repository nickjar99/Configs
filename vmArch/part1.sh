# mirrorlist & repos
sed -i "6i# Mines LUG Mirror\nServer = https://lug.mines.edu/mirrors/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
sed -i "92i[multilib]" /etc/pacman.conf
sed -i "93iInclude = /etc/pacman.d/mirrorlist" /etc/pacman.conf

systemctl dhcpcd@enp0s3.service
pacman --noconfirm -Sy git parted

timedatectl set-ntp true

# Setting up partitions
parted -s /dev/sda mktable msdos
parted -s /dev/sda mkpart primary ext4 0% 100%


# FINALLY this should work now
sed -i "52iHOOKS=(base udev modconf block filesystems keyboard fsck"

echo "y" | mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt --noconfirm base grub sudo man vim nano git wget curl zsh zsh-completions iputils dhcpcd 

cp /root/.zshrc /mnt/root/.zshrc
cp /root/.zshrc /mnt/root/.zshrc-installer
genfstab -U /mnt >> /mnt/etc/fstab


arch-chroot /mnt /usr/bin/zsh -c "cd /root && git clone https://gitlab.com/NickTheSecond/configs.git && cd configs/archVM && /usr/bin/zsh"
# arch-chroot /mnt /usr/bin/zsh -c "cd /root && git clone https://gitlab.com/NickTheSecond/configs.git && cd configs/archVM && sh vmPart2chroot.sh"