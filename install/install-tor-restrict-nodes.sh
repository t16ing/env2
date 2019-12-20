#!/bin/bash

echo "EntryNodes {fr} StrictNodes 1" | sudo tee -a /etc/tor/torrc
echo "ExitNodes {fr} StrictNodes 1" | sudo tee -a /etc/tor/torrc

