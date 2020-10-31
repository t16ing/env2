#!/bin/bash

echo "Installing zsh..."
sudo apt install zsh

echo "Please change your shell to /bin/zsh"
chsh -s zsh

echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Install oh-my-zsh plugin dependency"
sudo apt install -y autojump fzf thefuck
sudo apt install -y neofetch
sudo apt install -y zsh-autosuggestions
sudo apt install -y zsh-syntax-highlighting

echo "Install oh-my-zsh custom theme: powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sudo apt install -y powerline fonts-powerline

echo "Install oh-my-zsh custom plugins"
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo "Install plugin manager"
sudo apt install -y tmux-plugin-manager

echo "To fix plugin thefuck error: No module named 'distutils.spawn'"
echo "Refernce: https://github.com/platformio/platformio-vscode-ide/issues/1731"
sudo apt-get install python3-distutils

