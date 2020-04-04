#!/bin/bash

echo '''
UNZIP="-O CP936"
ZIPINFO="-O CP936"
''' | sudo tee -a /etc/environment  

sudo apt-get remove p7zip p7zip-full
