#!/bin/bash

echo '''
UNZIP="-O CP950"
ZIPINFO="-O CP950"
''' | sudo tee -a /etc/environment

sudo apt-get remove p7zip p7zip-full
