#!/bin/bash

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
