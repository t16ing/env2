#!/bin/bash

# show input keys on screen, useful for screen recording

git clone https://github.com/t16ing/screenkey ~/local/opt/screenkey
mkdir -p ~/local/bin && ln -s ~/local/opt/screenkey/screenkey ~/local/bin/screenkey

# add screenkey to plank and Gnome keyboard shortcuts

SCREENKEY_DESKTOP_USER="${HOME}/.local/share/applications/screenkey.desktop"
cat << EOF | tee ${SCREENKEY_DESKTOP_USER}
[Desktop Entry]
Version=1.0
Type=Application
Name=Screenkey
Comment=Screencast your keys
Exec=${HOME}/local/bin/screenkey
Icon=preferences-desktop-keyboard-shortcuts
Categories=Utility;
EOF

SCREENKEY_OFF_SCRIPT=${HOME}/local/bin/screenkey-off
cat << EOF | tee ${SCREENKEY_OFF_SCRIPT}
#!/bin/bash
kill \$(ps x | grep 'python.*screenkey' | grep -v grep | sed 's/^ \\+//g' | cut -d' ' -f1)
EOF
chmod +x ${SCREENKEY_OFF_SCRIPT}

PLANK_DOCKITEM_PATH="${HOME}/.config/plank/dock1/launchers"
touch "${PLANK_DOCKITEM_PATH}/screenkey.dockitem"
sed -i -e "s|^Launcher=$|Launcher=file://${SCREENKEY_DESKTOP_USER}|g" "${PLANK_DOCKITEM_PATH}/screenkey.dockitem"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
    name 'Screenkey Toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
    command 'sh -c "'${HOME}'/local/bin/screenkey-off || '${HOME}'/local/bin/screenkey"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
    binding '<Primary><Alt>k'
