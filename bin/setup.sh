#!/bin/bash

git clone --no-checkout https://github.com/t16ing/env2 ~/.git~ ; mv ~/.git~/.git ~/.git ; rmdir ~/.git~
cd ~ ; git restore --staged . && git checkout -- .
