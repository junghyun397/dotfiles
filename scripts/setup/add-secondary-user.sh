#!/bin/bash

ln -s /home/junghyun397/.zshrc ~/.zshrc
ln -s /home/junghyun397/.oh-my-zsh ~/.oh-my-zsh
ln -s /home/junghyun397/.p10k.zsh ~/.p10k.zsh

ln -s /home/junghyun397/.vimrc ~/.vimrc
ln -s /home/junghyun397/.vim ~/.vim

cp -r /home/junghyun397/.config/lsd ~/.config/lsd

chsh -s /usr/bin/zsh
