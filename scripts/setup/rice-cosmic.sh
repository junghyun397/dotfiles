#!/bin/bash

# sudo sed -i "s|Main.panel.statusArea.appMenu.hide();|// Main.panel.statusArea.appMenu.hide(); // MOD|g" /usr/share/gnome-shell/extensions/pop-cosmic@system76.com/extension.js
gsettings set org.gnome.shell.extensions.pop-cosmic show-application-menu true

