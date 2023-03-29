#!/bin/bash

sudo apt install -y tmux

echo "Install tmux plugin manger"
mkdir -p ~/.tmux/plugins
sudo apt install -y tmux-plugin-manager \
    && ln -s /usr/share/tmux-plugin-manager ~/.tmux/plugins/tpm

echo "Install tmux plugins dependency"
sudo apt install -y xclip

echo "Install tmux plugins"
~/.tmux/plugins/tpm/scripts/install_plugins.sh
