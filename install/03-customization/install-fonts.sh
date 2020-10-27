#!/bin/bash

echo "Install cns11643 fonts"
sudo apt install fonts-cns11643-kai fonts-cns11643-sung

echo "Install powerline fonts"
sudo apt install fonts-powerline

echo "Install nerd fonts for vim nerdtree plugin."
for URL in \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
do
    mkdir -p ~/.fonts/nerdfonts
    cd ~/.fonts/nerdfonts
    wget -q -O tmp.zip $URL && unzip tmp.zip && rm tmp.zip
    cd -
done

fc-cache -fv

