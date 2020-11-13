#!/bin/bash

# required for tagbar
sudo apt-get install -y exuberant-ctags

# required for python (ale), javascript (tagbar-javascript), and markdown
sudo apt install -y pylint
zsh -i -c 'nvm install node'
zsh -i -c 'npm install -g esctags eslint'
zsh -i -c 'npm install -g instant-markdown-d'

# required for fzf
sudo apt install -y ripgrep

# required for coc
sudo apt install -y ccls
