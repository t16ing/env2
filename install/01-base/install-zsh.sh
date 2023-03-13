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
sudo apt install -y thefuck || pip install thefuck

echo "In case dependency installation failed, install plugin from git"
if ! command -v neofetch > /dev/null
then
    git clone https://github.com/dylanaraps/neofetch ${ZSH_LOCAL:-~/local}/install/neofetch
    cd ${ZSH_LOCAL:-~/local}/install/neofetch
    make PREFIX=${HOME}/.local install
fi
if ! command -v fzf > /dev/null
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ${FZF_BASE:-~/.fzf}
    cd ${FZF_BASE:-~/.fzf}
    ./install --key-bindings --completion --update-rc --no-zsh
fi
if ! command -v autojump > /dev/null
then
    git clone https://github.com/wting/autojump ${ZSH_LOCAL:-~/local}/install/autojump
    cd ${ZSH_LOCAL:-~/local}/install/autojump
    ./install.py
fi
[[ -d "/usr/share/zsh-autosuggestions/" ]] \
    && { \
        ln -s /usr/share/zsh-autosuggestions/ ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    } || { \
        git clone https://github.com/zsh-users/zsh-autosuggestions/ ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/
    }
[[ -d "/usr/share/zsh-syntax-highlighting/" ]] \
    && { \
        ln -s /usr/share/zsh-syntax-highlighting/ ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    } || { \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting/ ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/
    }

echo "Install oh-my-zsh custom theme: powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sudo apt install -y powerline fonts-powerline

echo "Install oh-my-zsh custom plugins"
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo "To fix plugin thefuck error: No module named 'distutils.spawn'"
echo "Refernce: https://github.com/platformio/platformio-vscode-ide/issues/1731"
sudo apt install -y python3-distutils

