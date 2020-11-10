#!/bin/bash

echo "Install tmux plugins"
sudo apt install -y tmux-plugin-manager || \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Install tmux plugins dependency"
sudo apt install -y xsel

