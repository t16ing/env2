#!/bin/bash

## Dev dependencies
sudo apt install clang libsecret-1-dev libssl-dev libusb-1.0-0-dev libudev-dev

## Rust is required
curl https://sh.rustup.rs -sSf | sh

## build and install firefly
mkdir -p ~/local/opt/iota/src
cd ~/local/opt/iota/src
git clone https://github.com/iotaledger/firefly

cd firefly
yarn

cd packages/backend/bindings/node
yarn
cd -

cd packags/desktop
yarn build
yarn compile:linux
cd -

mkdir -p ~/local/opt/iota/bin
cp out/firefly-desktop-1.1.0.AppImage ~/local/opt/iota/bin/firefly-desktop

