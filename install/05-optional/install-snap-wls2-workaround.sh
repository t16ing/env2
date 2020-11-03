#!/bin/bash

# snap not work on WLS2 ubuntu
# [ref] https://github.com/microsoft/WSL/issues/5126

sudo apt-get update && sudo apt-get install -yqq daemonize dbus-user-session fontconfig
sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME
