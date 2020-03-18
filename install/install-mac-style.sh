#!/bin/bash

## for mac style spotlight

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
curl https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install albert

## integrted mac themes

sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt-get update
sudo apt-get install macbuntu-os-icons-v1804 macbuntu-os-ithemes-v1804 -y

## install paper icons, in case you do not like mac icons on ubuntu

sudo add-apt-repository ppa:snwh/ppa
sudo apt update -y
sudo apt install paper-icon-theme -y
