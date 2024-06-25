#!/bin/bash

# Vim
sudo apt install -y vim-gtk3

# zshenv
ln -s ~/.zshrc ~/.zshenv

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YCM
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer

