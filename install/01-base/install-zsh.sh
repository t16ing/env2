#!/bin/bash

echo "Installing zsh..."
sudo apt install zsh

echo "Please change your shell to /bin/zsh"
chsh

echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Install oh-my-zsh plugin dependency"
sudo apt install autojump

echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sudo apt install -y powerline fonts-powerline
sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting

