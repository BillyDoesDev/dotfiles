#!/bin/bash

# we'll edit this file
sudo cat /etc/fstab
# making a directory where I wanna mount it
sudo mkdir /mnt/Snorlax
sudo blkid
sudo nano /etc/fstab
cat /etc/fstab
# UUID=C8329D69696969696	/mnt/Snorlax	ntfs	defaults	0	2
# this line above is appended to the /etc/fstab file
