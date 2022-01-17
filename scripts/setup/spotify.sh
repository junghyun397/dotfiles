#!/bin/bash

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# Spotify-tui
git clone https://github.com/Rigellute/spotify-tui.git
cd spotify-tui
cargo install spotify-tui

wget https://raw.githubusercontent.com/Rigellute/spotify-tui/f68e0e9621640629f29883b9321624f84f40eff2/snap/gui/spt.desktop -P ~/.local/share/applications
terminal_bell
spt

