#!/bin/bash

echo "vm.oom_kill_allocating_task=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
