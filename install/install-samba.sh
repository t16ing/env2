#!/bin/bash

cd
mkdir .samba
echo $USER > ~/.samba/user
echo `gpg2 --gen-random --armor 1 20` > ~/.samba/pass

mkdir store
