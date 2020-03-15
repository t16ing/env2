#!/bin/bash

echo "Install latest wireshark from source..."
mkdir -p ~/local/src/wireshark
pushd ~/local/src/wireshark
  wget https://1.as.dl.wireshark.org/src/wireshark-3.2.2.tar.xz
  tar xf wireshark-*.tar.xz
  cd wireshark-3.2.2
  cmake
  make
  sudo make install
popd
