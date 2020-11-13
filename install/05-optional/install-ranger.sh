#!/bin/bash

sudo apt install -y python3-pip

git clone https://github.com/t16ing/.ranger ~/.config/ranger
cd ~/.config/ranger
~/.config/ranger/preflight.sh
