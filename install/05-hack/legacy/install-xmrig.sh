#!/bin/bash

sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

mkdir -p ~/local/opt/xmr/src
cd ~/local/opt/xmr/src
git clone https://github.com/xmrig/xmrig
mkdir xmrig/build
cd xmrig/build
cmake ..
make -j$(nproc)

mkdir -p ~/local/opt/xmr/bin
cp xmrig ~/local/opt/xmr/bin

