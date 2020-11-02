#!/bin/bash

# required for ctrlp and tagbar
sudo apt-get install -y exuberant-ctags

# required for tagbar-javascript
sudo apt install -y npm
npm install -g esctags

# required for ack.vim
sudo apt install -y ack

# required for ale
sudo apt install -y pylint
sudo apt install -y eslint
