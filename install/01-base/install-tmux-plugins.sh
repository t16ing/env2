#!/bin/bash

echo "Install tmux plugin manger"
sudo apt install -y tmux-plugin-manager \
    && ln -s /usr/share/tmux-plugin-manager ~/.tmux/plugins/tmux \
    || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Install tmux plugins dependency"
sudo apt install -y xsel

echo "Install tmux plugins"
~/.tmux/plugins/tpm/scripts/install_plugins.sh
