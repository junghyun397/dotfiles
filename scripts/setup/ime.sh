#!/bin/bash

# uim-byeoru
sudo apt install -y uim uim-byeoru

# keyd
cd /tmp
git clone https://github.com/rvaiya/keyd.git
cd keyd
make && sudo make install
cd ~

sudo ln ~/.keyd.conf /etc/keyd/default.conf
sudo systemctl enable keyd
sudo systemctl start keyd
