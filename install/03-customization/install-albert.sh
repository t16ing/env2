#!/bin/bash

## [ref] https://github.com/albertlauncher/albert

## for mac style spotlight

#sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
#curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
#sudo apt-get update -y
#sudo apt-get install albert

mkdir -p ~/local/opt/albert
cd ~/local/opt/albert
git clone --recursive https://github.com/albertlauncher/albert.git
cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
cmake --build build
cmake --install build
cd -
