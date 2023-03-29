#!/bin/bash

# install google gpg key
wget -qO- https://packages.cloud.google.com/apt/doc/apt-key.gpg > packages.google.gpg
sudo install -D -o root -g root -m 644 packages.google.gpg /etc/apt/trusted.gpg.d/packages.google.gpg
rm -f packages.google.gpg

# install google chrome repository
cat << EOF | sudo tee /etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

sudo apt update -y
sudo apt install -y google-chrome-stable
