#!/bin/bash

sudo apt install -y neovim
git clone https://github.com/t16ing/.vim ~/.vim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim

zsh -i -c 'nvm install 12'
zsh -i -c 'npm install -g neovim'
zsh -i -c 'nvm ls'
