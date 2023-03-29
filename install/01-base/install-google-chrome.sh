#!/bin/bash

# [ref] https://www.google.com/linuxrepositories/

# install google gpg key
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# install google chrome repository
cat << EOF | sudo tee /etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

sudo apt update -y
sudo apt install -y google-chrome-stable
