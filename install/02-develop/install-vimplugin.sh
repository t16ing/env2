#!/bin/bash

# required for tagbar
sudo apt-get install -y exuberant-ctags

# required for python (ale), javascript (tagbar-javascript), and markdown
sudo apt install -y pylint
sudo apt install -y npm
zsh -i -c 'npm install -g esctags eslint'
zsh -i -c 'npm install -g instant-markdown-d'

# required for fzf
sudo apt install -y ripgrep
