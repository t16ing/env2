#!/bin/bash

## install vscode from microsoft repo

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

## for large workspace

echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

## transparent background for Code and others
## [ref] https://www.youtube.com/watch?v=PzObHq72Vug

sudo apt install devilspie
mkdir ~/.devilspie

for window_class in Code terminal Nautilus Qalculate
do
echo '
(if (contains (window_class) "'${window_class}'")
	(begin
		(spawn_async (str "xprop -id " (window_xid) " -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 "))
		(spawn_async (str "xprop -id " (window_xid) " -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 0xF0000000"))
	)
)
' > ~/.devilspie/${window_class}_transparent.ds
done

