#!/bin/bash

# Dejavu Sans Mono for Powerline
sudo wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20Bold%20Oblique%20for%20Powerline.ttf -P /usr/share/fonts
sudo wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20Bold%20for%20Powerline.ttf -P /usr/share/fonts
sudo wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20Oblique%20for%20Powerline.ttf -P /usr/share/fonts
sudo wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf -P /usr/share/fonts

# fc-cache
sudo fc-cache -f -v

