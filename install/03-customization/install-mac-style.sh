#!/bin/bash

## [ref] https://www.youtube.com/watch?v=Y6k7THQ3x6U
## Title: How to MAKE Ubuntu 22.04 Look Like Mac OS Monterey

echo "Step 1: Install gnome shell extension support and tweaks"

sudo apt install gnome-tweaks gnome-shell-extensions -y

echo "Step 2: Install GNOME shell extension manager"

sudo apt install gnome-shell-extension-manager -y

echo "Step 3: Install extensions:"

echo "User Themes"
echo "Blur my shell"
echo "Compiz windows effect"
echo "Hide Top Bar"

read wait

echo "Step 4: Install WhiteSur Theme"

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme ~/local/opt/WhiteSur-gtk-theme
cd ~/local/opt/WhiteSur-gtk-theme
./install.sh
cd -

echo "Step 5: Install WhiteSur Icon (skipped)"

# git clone https://github.com/vinceliuice/WhiteSur-icon-theme ~/local/opt/WhiteSur-icon-theme

#echo "Open Appearance to change Icons to Mkos-Big-Sur-Night and Shell/Legacy to WhiteSur-Dark-red"
#read wait

echo "Step 6: Customize gnome shell..."

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
echo "In Blur my shell extension, disable Dash to Dock blur."

