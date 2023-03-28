#!/bin/bash

# Establish Roles
source="old-computer"
destination="new-computer"

# Verify Dependencies
command -v nc > /dev/null 2>&1 || { echo >&2 "netcat is required but not installed. Aborting."; exit 1; }
command -v gpg > /dev/null 2>&1 || { echo >&2 "gnupg is required but not installed. Aborting."; exit 1; }

# Obtain Destination IP Address
echo "Please enter the IP address of the destination ($destination):"
read destination_ip

echo '------------------------------------------------------------------------'

# Request Public Key from Destination
echo "Requesting public key from $destination ($destination_ip)..."
public_key=$(nc -w 2 $destination_ip 8888)

echo '------------------------------------------------------------------------'

# Validate Public Key
echo "Verifying the public key from $destination..."
FINGERPRINT=$(echo "$public_key" | gpg --with-fingerprint --with-colons 2>/dev/null | awk -F: '$1 == "fpr" {print $10}')
echo "Is this the correct fingerprint $FINGERPRINT? (y/n):"
read answer

echo '------------------------------------------------------------------------'

if [[ $answer == "y" ]]; then
  # Import Destination's GPG Public Key for Secure Data Exchange
  echo "$public_key" | gpg --import
  # Encrypt GPG keys and Send to Destination
  echo "Sending all gpg keys to $destination..."
  encrypted_gpg_keys=$(gpg --armor --export-secret-keys | gpg --armor --encrypt --trust-model always --recipient $FINGERPRINT)
  echo "$encrypted_gpg_keys" | nc -w 2 $destination_ip 8888
else
  echo "Aborting transfer."
fi
