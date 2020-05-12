#!/bin/bash

echo "Install the dependencis..."
# https://gist.github.com/syneart/2d30c075c140624b1e150c8ea318a978
sudo apt install -y \
  build-essential git cmake \
  qttools5-dev qttools5-dev-tools libqt5svg5-dev qtmultimedia5-dev \
  libpcap-dev \
  libgcrypt20-dev \
  libglib2.0-dev \
  flex bison

echo "Install latest wireshark from source..."
mkdir -p ~/local/src/wireshark
pushd ~/local/src/wireshark
  wget https://1.as.dl.wireshark.org/src/wireshark-3.2.2.tar.xz
  tar xf wireshark-*.tar.xz
  mkdir wireshark-ninja
  cd wireshark-ninja
  cmake ../wireshark-3.2.2
  make
  sudo checkinstall
popd
