#!/bin/bash

echo "Installing kali tools..."
sudo apt install wireshark -y
sudo apt install ettercap ettercap-graphical -y
sudo apt install driftnet -y
sudo apt install dsniff -y
sudo apt install macchanger -y

echo "Installing kali tools for WIFI..."
sudo apt install kismet -y
sudo apt install aircrack-ng -y
