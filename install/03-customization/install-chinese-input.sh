#!/bin/bash

## [ref] https://github.com/fcitx/fcitx5-table-extra

sudo apt install fcitx5 fcitx5-chinese-addons

## [ref] https://samwhelp.github.io/note-about-ubuntu/read/subject/im/fcitx5/howto/install-fcitx5-table-boshiamy.html

mkdir -p ~/local/opt
git clone https://github.com/fcitx/fcitx5-table-extra ~/local/opt/fcitx5-table-extra

cd ~/local/opt/fcitx5-table-extra/tables
libime_tabledict boshiamy.txt boshiamy.main.dict
sudo install -Dm644 boshiamy.main.dict "/usr/share/fcitx5/table/boshiamy.main.dict"
sudo install -Dm644 boshiamy.conf.in "/usr/share/fcitx5/inputmethod/boshiamy.conf"
cd -

## Switch input method to fcitx5

gnome-language-selector
im-config -n fcitx5

## [ref] https://zhuanlan.zhihu.com/p/508797663
echo "Setting Up FCITX5 as a Startup Application Manually"
gnome-tweaks
