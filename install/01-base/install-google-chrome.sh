#!/bin/bash

cat << EOF | sudo tee /etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

sudo apt update -y
sudo apt install -y google-chrome 
