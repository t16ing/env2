#!/bin/bash

## Basic
sudo apt install -y qalculate

## Office
sudo apt install -y lyx
sudo apt install -y latex-cjk-chinese

### fix: cannot keep lyx docked on plank
sudo sed -i 's/StartupWMClass=Lyx/StartupWMClass=lyx/g' /usr/share/applications/lyx.desktop

## Image Editor
sudo apt install -y gimp
sudo apt install -y krita
sudo apt install -y mypaint
sudo apt install -y inkscape

## Productive
sudo apt install -y umbrello
