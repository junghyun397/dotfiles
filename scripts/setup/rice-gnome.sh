#!/bin/bash

# Extensions
xdg-open https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep

xdg-open https://extensions.gnome.org/extension/1319/gsconnect/
xdg-open https://extensions.gnome.org/extension/1287/unite/
xdg-open https://extensions.gnome.org/extension/3222/block-caribou-36/

# Hotkeys
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for i in $(seq 1 9); do gsettings set org.gnome.shell.keybindings switch-to-application-${i} "[]"; done

# dconf restore
dconf load / < .raws/dconf
