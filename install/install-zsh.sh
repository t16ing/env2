#!/bin/bash

echo "Installing zsh..."
sudo apt install zsh

echo "Please change your shell to /bin/zsh"
chsh

echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
sed -i -e 's/^plugins=(/plugins=( zsh-autosuggestions ssh-agent/g' ~/.zshrc
echo "alias ls='ls --color=tty --group-directories-first'" >> ~/.zshrc
cd ~/.oh-my-zsh/plugins/zsh-autosuggestions/ ; make

echo "Install powerlevel9k"
sudo apt install powerline fonts-powerline
sudo apt install zsh-theme-powerlevel9k
sudo apt install zsh-syntax-highlighting
