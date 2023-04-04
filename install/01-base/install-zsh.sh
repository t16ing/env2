#!/bin/bash

echo "Installing zsh..."
sudo apt install zsh

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "Install oh-my-zsh plugin dependency"
sudo apt install -y gpg
sudo apt install -y neofetch fzf autojump
sudo apt install -y zsh-autosuggestions
sudo apt install -y zsh-syntax-highlighting
sudo apt install -y thefuck

echo "Install oh-my-zsh custom theme: powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sudo apt install -y powerline fonts-powerline

echo "Install oh-my-zsh custom plugins"
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

