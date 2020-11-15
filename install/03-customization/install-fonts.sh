#!/bin/bash

echo "Install cns11643 fonts"
sudo apt install fonts-cns11643-kai fonts-cns11643-sung

echo "Install powerline fonts"
sudo apt install fonts-powerline

echo "Patch libxft2 to fix crash while rendering color emoji"
sudo dpkg -i ./libxft2-patched/libxft2_2.3.2-1_amd64.deb

echo "Install nerd fonts for vim nerdtree plugin."
for URL in \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip
do
    mkdir -p ~/.fonts/nerdfonts
    cd ~/.fonts/nerdfonts
    wget -q -O tmp.zip $URL && unzip -o tmp.zip && rm tmp.zip
    cd -
done

fc-cache -fv

