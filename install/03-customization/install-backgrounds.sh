#!/bin/bash

## update login background

echo '''how to update gdm login background:
#lockDialogGroup {
  background: #111111 url(file:///home/user/wallpapers/lockDialogGroup.jpg);
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover; }
'''

sudo vi /usr/share/gnome-shell/theme/ubuntu.css

## update grub background

echo '''how to update grub background:
1. $ sudo cp wallpaper.png /boot/grub
2. $ sudo update-grub
'''

## update plymouth

echo how to update plymouth:
echo 1. choose a plymouth here: "https://www.gnome-look.org/browse/cat/108/order/latest/"
echo 2. how to install a plymouth: "https://askubuntu.com/questions/770295/how-can-i-install-paw-ubuntu-plymouth-theme-on-ubuntu-16-04/870092#870092"

