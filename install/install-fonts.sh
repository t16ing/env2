#!/bin/bash

echo "Install nerd fonts for vim nerdtree plugin."
URL=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Ubuntu.zip

mkdir -p ~/.fonts
cd ~/.fonts
wget -q -O tmp.zip $URL && unzip tmp.zip && rm tmp.zip
fc-cache -fv
cd -

