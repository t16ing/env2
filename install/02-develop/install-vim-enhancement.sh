#!/bin/bash

# Install neovim
sudo apt install -y neovim
git clone https://github.com/t16ing/.vim ~/.vim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim

# Install vim plugins
vim +silent +VimEnter +PlugInstall +qall

# required for tagbar
sudo apt-get install -y exuberant-ctags

# required for python (ale), javascript (tagbar-javascript), and markdown
sudo apt install -y pylint
zsh -i -c 'nvm install npm'
zsh -i -c 'nvm install node'
zsh -i -c 'npm install -g esctags eslint'
zsh -i -c 'npm install -g instant-markdown-d'

# required for fzf
sudo apt install -y ripgrep

# required for coc
sudo apt install -y ccls

# configure environment dependency
echo "let g:coc_node_path='$(ls $HOME/.nvm/versions/node/*/bin/node | tail -1)'" >> ~/.vimrc.local
