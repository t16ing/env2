#!/bin/bash

echo "NOTICE: fail2cam is required."

sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update -y
sudo apt install -y howdy

pam_auth_file="/etc/pam.d/common-auth"
pam_howdy="auth [success=4 default=ignore] pam_python.so \/lib\/security\/howdy\/pam.py"
pam_fail2cam="auth [default=ignore] pam_exec.so seteuid \/usr\/local\/bin\/fail2cam"

grep fail2cam ${pam_auth_file} || {
  echo "FAILED: fail2cam not found in pam."
  exit 1
}
grep howdy ${pam_auth_file} || sudo sed -i "/pam_unix.so nullok_secure/i ${pam_howdy}\n${pam_fail2cam}" ${pam_auth_file}
