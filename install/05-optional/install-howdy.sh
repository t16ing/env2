#!/bin/bash

echo "NOTICE: assert that gtop and fail2cam is installed"

sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update -y
sudo apt install -y howdy

pam_auth_file="/etc/pam.d/common-auth"
pam_howdy="auth [success=3 default=ignore] pam_python.so \/lib\/security\/howdy\/pam.py"

grep howdy ${pam_auth_file} || sudo sed -i "/pam_unix.so nullok_secure/i ${pam_howdy}" ${pam_auth_file}
