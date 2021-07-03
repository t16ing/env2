#!/bin/bash

PREFIX="${HOME}/local/opt/"

## Dependency Build Instructions: Ubuntu & Debian
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
sudo apt-get install libboost-all-dev
sudo apt-get install libminiupnpc-dev
sudo apt-get install libzmq3-dev

## Dependencies for the GUI: Ubuntu & Debian
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
sudo apt-get install libqrencode-dev

## libdb5.1    | Berkeley DB      | Wallet storage (only needed when wallet enabled)
LIBDB_PREFIX="${PREFIX}/libdb"
BDB_PREFIX="${LIBDB_PREFIX}/BerkeleyDB.5.1"
mkdir -p "${LIBDB_PREFIX}/src" && cd "${LIBDB_PREFIX}/src" && \
    wget http://download.oracle.com/berkeley-db/db-5.1.29.NC.tar.gz && \
    echo '08238e59736d1aacdd47cfb8e68684c695516c37f4fbe1b8267dde58dc3a576c db-5.1.29.NC.tar.gz' | sha256sum -c && \
    tar -xzvf db-5.1.29.NC.tar.gz && \
    cd db-5.1.29.NC/build_unix && \
    ../dist/configure --enable-cxx --disable-shared --with-pic "--prefix=$BDB_PREFIX" && \
    make install

## dogecoin build
DOG_PREFIX="${PREFIX}/dogecoin"
mkdir -p "${DOG_PREFIX}/src" && cd "${DOG_PREFIX}/src" && \
    git clone https://github.com/dogecoin/dogecoin && \
    cd dogecoin && \
    ./autogen.sh && \
    ./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/" "--prefix=${DOG_PREFIX}" && \
    make install

