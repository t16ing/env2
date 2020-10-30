#!/bin/bash

sudo apt install neovim
git clone https://github.com/t16ing/.vim ~/.vim
ln -s ~/.vim ~/.config/nvim

npm install -g neovim
