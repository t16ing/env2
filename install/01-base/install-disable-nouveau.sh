#!/bin/bash

conf="
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off
"

echo "${conf}" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf

sudo update-initramfs -u
