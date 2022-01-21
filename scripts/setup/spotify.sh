#!/bin/bash

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# Spotify-tui
git clone https://github.com/Rigellute/spotify-tui.git
cd spotify-tui
cargo install spotify-tui

cp ~/.raws/spt.desktop ~/.local/share/applications/spt.desktop
sed -i "s;uname;$USERNAME;g" .local/share/applications/spt.desktop
terminal_bell
spt

