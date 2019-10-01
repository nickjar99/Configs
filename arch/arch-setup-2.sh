# Todo: add more packages
pacstrap /mnt - < pacman-main.txt
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8"

echo "ArchLaptop" > /etc/hostname
echo "\n\n127.0.0.1	localhost\n::1		localhost\n127.0.1.1	ArchLaptop.localdomain ArchLaptop" > /etc/hosts

mkinitcpio -p linux

echo "Creating user"

echo "%wheel ALL=(ALL:ALL) ALL"
useradd -m -G wheel nick
useradd -m -G wheel nick

echo "Enabling multilib"
echo "[multilib]\nInclude = /etc/pacman.d/mirrorlist" > /etc/pacman.conf

echo "Next, setup bootloader & passwords, then reboot into new user. Setup network through networkmanager"