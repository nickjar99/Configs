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
pacstrap /mnt --noconfirm base base-devel sudo vim nano neofetch ncdu git wget curl zsh make pigz pbzip2 unzip xz iputils dhcpcd 

cp /root/.zshrc /mnt/root/.zshrc-install
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc

# Locales
sed -i "14ien_US.UTF-8 UTF-8" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Hostname
echo "Choose a hostname:"
read hostname
echo "$hostname" >> /etc/hostname
echo "127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\t$hostname.localdomain $hostname"

# add nick user and passwords
sed -i "82i%wheel ALL=(ALL) ALL" /etc/sudoers
useradd -G wheel -m -s /usr/bin/zsh nick
read -ps "Enter a password for both accounts: " password
echo "$password" | passwd
echo "$password" | passwd nick

# makepkg
sed -i "40iCFLAGS=\"-march=native -02 -pipe -fno-plt"\" /etc/makepkg.conf
sed -i "41iCXXFLAGS=\"${CFLAGS}\"" /etc/makepkg.conf
sed -i "44iMAKEFLAGS=\"-j$(nproc)" / etc/makepkg.conf
sed -i "130iCOMPRESSGZ=(pigz -c -f -n)" /etc/makepkg.conf
sed -i "132iCOMPRESSXZ=(xz -c -z - --threads=0)" /etc/makepkg.conf
sed -i "131iCOMPRESSBZ2=(pbzip2 -c -f)" /etc/makepkg.conf
sed -i "133iCOMPRESSZST=(zstd -c -z -q - --threads=0)

# more packages
pacman -S zstd gcc-libs glances

# Bootloader
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg