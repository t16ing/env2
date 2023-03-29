#!/bin/bash

sudo apt install -y php-curl php-xml php-bcmath php-gd php-zip php-ldap
sudo apt install -y composer

sudo sed -i -e "s|;extension=curl|extension=curl|g" $(php --ini 2>&1 | grep 'Loaded Configuration File' | cut -d: -f2)
