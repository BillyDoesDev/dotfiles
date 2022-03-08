#!/bin/bash

## INCLUDES ALMOST EVERYTHING AFTER CHROOT

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "billy" >> /etc/hostname
echo "127.0.0.1       localhost
::1             localhost
127.0.1.1       billy.localdomain       billy" >> /etc/hosts

pacman -Sy --needed base-devel vi nano grub efibootmgr os-prober neofetch htop xorg plasma firefox konsole dolphin gwenview mpv sof-firmware xf86-input-synaptics networkmanager iwd ntfs-3g
systemctl enable networkmanager
systemctl enable sddm

mkdir /mnt2
mount /dev/nvme0n1p1 /mnt2
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "

All DONE!
Now set up root passwd, users, pacman, nvidia, sudo and reboot
(network manager, furryfox and a gui has been already set up!)"
