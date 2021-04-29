#!/bin/bash

mkdir ~/local/opt/xmrig/src
cd ~/local/opt/xmrig/src
git clone https://github.com/monero-project/monero-gui
cd monero-gui
docker build --tag monero:build-env-linux --build-arg THREADS=2 --file Dockerfile.linux .
docker run --rm -it -v $(pwd):/monero-gui -w /monero-gui monero:build-env-linux \
    sh -c 'apt install ccache ; git submodule update --init --force --recursive ; make release-static -j2'

mkdir -p ~/local/opt/xmrig/bin
cp build/release/bin/monero-wallet-gui ~/local/opt/xmrig/bin

