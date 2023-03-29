#!/bin/bash

## transparent background for Code and others
## [ref] devilspie(1): https://www.youtube.com/watch?v=PzObHq72Vug

sudo apt install devilspie
mkdir -p ~/.devilspie

for window_class in terminal Nautilus screenkey
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

