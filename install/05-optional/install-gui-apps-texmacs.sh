#!/bin/bash

cat << EOF | sudo apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.14 (GNU/Linux)

mQENBF0txR4BCACq9Xmg0Ek+uo4JQYO3LvKeb/X89LxuhDe56Szz6Bvhr9FapE6L
8go0ya/RabzaFn0D/MmZUhi7JEJEfU5Yz7UC46WzNGzSpwvITup0ad1hE+TmzjqF
bRHAzUgrzuNo0I4vT2UOSWZ4CZZyqboOk3ivCr/dc3ASBxcvfThhfIikJ3+oYU5O
K+ElCYYNKQF5zVN5PgjYDmA3UWfdGOQWIeF7F38azoy1VQPvEMHqYFdlAJ8cHCmC
idrHMti1xNTUzggkJ4GieHlLbxh1AouDYu6WXwyUv7T7rDS0ec2gbjHJynW7aL3z
zg6hlMGU/GUXz7qXEnCMaJdJ6LDj27vB5grNABEBAAG0IlRlWG1hY3MgVGVhbSA8
Y29udGFjdEB0ZXhtYWNzLm9yZz6JAT4EEwECACgFAl0txR4CGwMFCQeEzgAGCwkI
BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEIyt4URAotbWNxoIAJlMP325cdzHSyxb
yhX1riO2mXLCxVRxv+/Xrl09RbBGIawUn1Iar5gkQRzLDM7N7I8RnMRRp8z7kcgk
F4wdX9MZd/2SwNGCCZHUv3OsLw/ATS8VZMdL6mHaYiGWhTOGyQsdkdq9zBYDsbel
sa9VagN5wG7j+2/SM6oY8Ng8m4h3+EufKjp7/Ba0+Hc3zMd7GUm53Ne8Y+byfOYI
fwZk+lofotQKF72Jn1cmWehOwMPCZRDQdkc9abZqA4OZ+djqzJUgDL2UIeH5e2/Y
VgZg7GF34HmMdVt6KAUMAtxL0oz1JLfiRqoqcnrV6YNEqQUpfKH8pE9FdEOFURB0
z+8GCVA=
=VV5C
-----END PGP PUBLIC KEY BLOCK-----
EOF

sudo add-apt-repository "deb http://ftp.texmacs.org/TeXmacs/tmftp/repos/apt/ $(lsb_release -cs) universe"

sudo apt-get update -y
sudo apt-get install -y texmacs
