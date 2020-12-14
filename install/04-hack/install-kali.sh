#!/bin/bash

echo "Installing kali tools..."

echo "Use install-kali-wireshark-local-build.sh instead to install latest wireshark."
#sudo apt install wireshark -y

echo "Use ettercap for intranet MITM..."
sudo apt install ettercap ettercap-graphical -y

echo "Use driftnet for picture sniff..."
sudo apt install driftnet -y

echo "Use dsniff for password sniff and traffic MITM..."
sudo apt install dsniff -y
