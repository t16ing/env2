#!/bin/bash

cat << EOF | sudo tee -a /etc/apt/sources.list
## Debian new updated packages available to the user
# https://serverfault.com/questions/550855/how-to-add-debian-testing-repository-to-apt-get
deb http://http.us.debian.org/debian/ testing non-free contrib main
EOF
