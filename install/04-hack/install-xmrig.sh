#!/bin/bash

sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

mkdir -p ~/local/opt/xmrig/src
cd ~/local/opt/xmrig/src
git clone https://github.com/xmrig/xmrig
mkdir xmrig/build
cd xmrig/build
cmake ..
make -j$(nproc)

mkdir -p ~/local/opt/xmrig/bin
cp xmrig ~/local/opt/xmrig/bin

