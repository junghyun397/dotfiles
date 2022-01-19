#!/bin/bash

# Extensions
xdg-open https://extensions.gnome.org/extension/1319/gsconnect/ &
xdg-open https://extensions.gnome.org/extension/1287/unite/ &
xdg-open https://extensions.gnome.org/extension/3222/block-caribou-36/ &
xdg-open https://extensions.gnome.org/extension/1065/docker-status/ &

# Hotkeys
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for i in $(seq 1 9); do gsettings set org.gnome.shell.keybindings switch-to-application-${i} "[]"; done

# dconf restore
dconf load / < .raws/dconf-backup
