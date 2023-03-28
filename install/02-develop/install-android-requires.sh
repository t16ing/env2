#!/bin/bash

sudo apt update -y

# Android Studio required libraries for 64-bit machines
# source: https://developer.android.com/studio/install
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y

# KVM to accelerate android emulator
# source: https://linuxconfig.org/install-and-set-up-kvm-on-ubuntu-20-04-focal-fossa-linux
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y

