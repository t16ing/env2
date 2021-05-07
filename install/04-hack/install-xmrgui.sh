#!/bin/bash

mkdir -p ~/local/opt/xmr/src
cd ~/local/opt/xmr/src
git clone --branch master --recursive https://github.com/monero-project/monero-gui.git
git checkout ea01a536ce5d0b332358619585469e5ca5f4de0d
cd monero-gui
docker build --tag monero:build-env-linux --build-arg THREADS=2 --file Dockerfile.linux .
docker run --rm -it -v $(pwd):/monero-gui -w /monero-gui monero:build-env-linux \
    sh -c 'apt install ccache ; make release-static -j4'

mkdir -p ~/local/opt/xmr/bin
cp build/release/bin/* ~/local/opt/xmr/bin

