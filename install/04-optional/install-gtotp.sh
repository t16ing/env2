#!/bin/bash

pam_auth_file="/etc/pam.d/common-auth"

pam_gtotp="auth [success=1 default=ignore] pam_google_authenticator.so"
pam_deny="auth requisite pam_deny.so"

sudo apt-get install libpam-google-authenticator -y

google-authenticator

grep pam_google_authenticator ${pam_auth_file} || sudo sed -i "/pam_unix.so nullok_secure/i ${pam_gtotp}\n${pam_deny}" ${pam_auth_file}
