#!/bin/bash

# screen recording

sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install -y obs-studio

# show input keys on screen, useful for screen recording

sudo apt install -y screenkey

# add screenkey to plank and Gnome keyboard shortcuts

SCREENKEY_DESKTOP_USER="${HOME}/.local/share/applications/screenkey.desktop"
SCREENKEY_DESKTOP_SYSTEM="$(dpkg -L screenkey | grep desktop)"
cp "${SCREENKEY_DESKTOP_SYSTEM}" "${SCREENKEY_DESKTOP_USER}"

SCREENKEY_EXEC_PATH="$(which screenkey)"
sed -i -e "s|^Exec=screenkey$|Exec=${SCREENKEY_EXEC_PATH}|g" "${SCREENKEY_DESKTOP_USER}"

PLANK_DOCKITEM_PATH="${HOME}/.config/plank/dock1/launchers"
touch "${PLANK_DOCKITEM_PATH}/screenkey.dockitem"
sed -i -e "s|^Launcher=$|Launcher=file://${SCREENKEY_DESKTOP_USER}|g" "${PLANK_DOCKITEM_PATH}/screenkey.dockitem"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
    name 'Screenkey Toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
    command '/bin/sh -c "pgrep screenkey && killall screenkey || screenkey"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
    binding '<Primary><Alt>k'
