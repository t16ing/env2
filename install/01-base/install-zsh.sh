#!/bin/bash

echo "Installing zsh..."
sudo apt install zsh

echo "Please change your shell to /bin/zsh"
chsh

echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
sed -i -e 's/^plugins=(/plugins=( zsh-autosuggestions ssh-agent autojump/g' ~/.zshrc
echo "alias ls='ls --color=tty --group-directories-first'" >> ~/.zshrc
cd ~/.oh-my-zsh/plugins/zsh-autosuggestions/ ; make

echo "Install oh-my-zsh plugin dependency"
sudo apt install autojump

echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sudo apt install powerline fonts-powerline
sudo apt install zsh-syntax-highlighting

