#!/bin/bash

# Vim
sudo apt install -y vim-gtk3

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

