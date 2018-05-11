#!/bin/bash

echo "Remember to mount the VirtualBox Guest Additions.iso before installing..."

sudo apt install gcc make perl -y

sudo mkdir /media/cdrom
sudo mount -t auto /dev/cdrom /media/cdrom

sudo /media/cdrom/VBoxLinuxAdditions.run
sudo usermod -aG vboxsf starl
