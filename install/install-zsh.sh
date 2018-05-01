#!/bin/bash

echo "Installing zsh..."
sudo apt install zsh

echo "Please change your shell to /bin/zsh"
chsh

echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc
sed -i -e 's/plugins=(/plugins=( zsh-autosuggestions ssh-agent/g' ~/.zshrc
sed -i -e "s/ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'/ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red'/g" ~/.oh-my-zsh/plugins/zsh-autosuggestions/src/config.zsh
cd ~/.oh-my-zsh/plugins/zsh-autosuggestions/ ; make
