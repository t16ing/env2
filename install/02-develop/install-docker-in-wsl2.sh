#!/bin/bash

sudo sh <(curl -fsSL https://get.docker.com)
sudo service docker start

# To fix `docker: Error response from daemon: cgroups: cannot find cgroup mount destination: unknown.`
# Reference: https://github.com/microsoft/WSL/issues/4189
sudo mkdir /sys/fs/cgroup/systemd
sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd
