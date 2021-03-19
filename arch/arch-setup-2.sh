# Todo: add more packages
# pacstrap /mnt - < pacman-main.txt


# pacstrap /mnt linux linux-firmware base sudo grub git vim nano
# genfstab -U /mnt >> /mnt/etc/fstab
# arch-chroot /mnt

echo "Enabling multilib"
printf "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

pacman -Sy grub git vim nano networkmanager sudo wget curl os-prober ntfs-3g efibootmgr unzip pigz tar wpa_supplicant iw ncdu zsh 

ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
time locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "Arch" > /etc/hostname
printf "\n\n127.0.0.1	localhost\n::1		localhost\n127.0.1.1	Arch.localdomain Arch" >> /etc/hosts

# mkinitcpio -p linux

echo "Creating user"

# echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
useradd -m -G wheel nick
# useradd -m -G wheel nick

echo "Root password:"
passwd
echo "Nick password:"
passwd nick



echo "Next, setup bootloader & passwords, then reboot into new user. Setup network through networkmanager"