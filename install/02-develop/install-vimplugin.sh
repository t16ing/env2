#!/bin/bash

# required for ctrlp and tagbar
sudo apt-get install -y exuberant-ctags

# required for ack.vim
sudo apt install -y ack

# required for python (ale) and javascript (tagbar-javascript)
sudo apt install -y pylint
sudo apt install -y npm
zsh -i -c 'npm install -g esctags eslint'

# required for fzf
sudo apt install -y ripgrep
