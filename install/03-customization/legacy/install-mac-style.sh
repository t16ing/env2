#!/bin/bash

## for mac style dock

sudo apt install plank -y

## for mac style spotlight

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install albert

## integrted mac themes

sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt-get update -y
sudo apt-get install macbuntu-os-icons-v1804 macbuntu-os-ithemes-v1804 -y

