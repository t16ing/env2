#!/bin/bash

sudo apt update -y
sudo apt install variety -y

mkdir -p ~/.config
git clone https://github.com/t16ing/.variety ~/.config/variety

mkdir -p ~/Pictures
git clone https://github.com/t16ing/wallpapers ~/Pictures/wallpapers

