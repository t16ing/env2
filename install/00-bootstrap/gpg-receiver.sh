#!/bin/bash

# Define the roles
source="old-computer"
destination="new-computer"

# Check dependencies
command -v nc > /dev/null 2>&1 || { echo >&2 "netcat is required but not installed. Aborting."; exit 1; }
command -v gpg > /dev/null 2>&1 || { echo >&2 "gnupg is required but not installed. Aborting."; exit 1; }

# Given gpg key name
gpg_real_name=$(whoami)
gpg_email=$(whoami)@$(hostname).localdomain
gpg_key_name=$gpg_email

# Check if gpg key exists
if [[ $(gpg --list-keys $gpg_key_name | grep pub) ]]; then
  echo "The gpg key $gpg_key_name exists already in $destination."
else
  # Create the first gpg key
  echo "Creating the gpg key $gpg_key_name for $destination..."
  gpg --full-generate-key --batch <<EOF
      %no-protection
      Key-Type: RSA
      Key-Length: 4096
      Subkey-Type: RSA
      Subkey-Length: 4096
      Name-Real: ${gpg_real_name}
      Name-Email: ${gpg_email}
      Expire-Date: 0
      %commit
EOF
fi

echo '------------------------------------------------------------------------'

# Display the public key fingerprint and connection information
echo "Public key fingerprint:"
gpg --list-keys --with-fingerprint "$gpg_key_name"
echo "Connection information: $destination IP is $(hostname -I | awk '{print $1}')"

echo '------------------------------------------------------------------------'

# Wait for connection and exchange gpg public key
echo "Waiting for connection from $source..."
gpg --armor --export $gpg_key_name | nc -l 8888

# Request the gpg keys from the source
echo "Requesting gpg keys from $source..."
gpg_keys=$(nc -l 8888)
echo "$gpg_keys" | gpg -d | gpg --import

# Display the result of import
gpg --list-keys
