#!/bin/bash

sudo apt install -y neovim
git clone https://github.com/t16ing/.vim ~/.vim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim

nvim +silent +VimEnter +PlugInstall +qall
