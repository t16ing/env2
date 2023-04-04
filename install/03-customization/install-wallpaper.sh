#!/bin/bash

mkdir -p ~/.config
git clone https://github.com/t16ing/.variety ~/.config/variety

mkdir -p ~/Pictures
git clone https://github.com/t16ing/wallpapers ~/Pictures/wallpapers

sudo apt install variety -y

echo "Setting Up variety as a Startup Application Manually"
gnome-tweaks
