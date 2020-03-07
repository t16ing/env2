#!/bin/bash

## for mac style spotlight

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
curl https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install albert
