#!/bin/bash

function terminal_bell() {
    echo -e "\07"
}

DEVICE="desktop"
echo "ENVIRONMENT? [DESKTOP/laptop]"
read awnser
if [[ "$awnser" == "laptop"]]
then
    $DEVICE = "laptop"
fi

cd ~

# Packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y openssh-server git curl screen net-tools pm-utils

## Build
sudo apt install -y build-essential make cmake clang node-typescript libdbus-1-dev libssl-dev

## Package
sudo apt install -y cargo gdebi python3-pip ppa-purge

## Monitoring
sudo apt install -y tldr screenfetch tree fzf

## X11/GNOME

## Etc
sudo apt install -y ruby-full

# Dotfiles
git clone -b $DEVICE --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

# IME/editor
sudo apt install -y uim uim-byeoru

## Keyd
cd /tmp
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
cd ~
ln .keyd.conf /etc/keyd/default.conf
sudo systemctl enable keyd && sudo systemctl start keyd

## Powerline Font

# Zsh
sudo apt install zsh
chsh -s /usr/bin/zsh

## Oh-My-Zsh
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

## Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## colorls
sudo gem install -y colorls

# Vim
sudo apt install -y vim-gtk3

## Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# GNOME
sudo apt install -y xdotool x11-xserver-utils gnome-tweak-tool gnome-shell-extensions

## Extensions
terminal_bell
xdg-open https://extensions.gnome.org/extension/1319/gsconnect/
xdg-open https://extensions.gnome.org/extension/1287/unite/
xdg-open https://extensions.gnome.org/extension/3222/block-caribou-36/

## gnome-terminal
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

# Github
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt -y install gh

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli

sudo groupadd docker
sudo usermod -aG docker $USER

## Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# SDKs

## Java
sudo apt install -y openjdk-8-jre openjdk-8-jdk openjdk-17-jre openjdk-17-jdk

## Scala
## Kotlin
## Ruby
## Flutter

# Apps

## Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main">> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

## Jetbrains Toolbox
cd Downloads
tar -xvf jetbrains-toolbox-*.tar.gz
cd jetbrains-toolbox-*
chmod 700 jetbrrains-toolbox
./jetbrains-toolbox
cd ~

## TexLive
sudo apt install -y texlive-latex-recommended
sudo apt install -y texlive-latex-recommended-doc

## Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

### Spotify-tui
sudo snap install spt

## Discord
sudo ~/scripts/update-discord.sh

## WireShark
sudo apt install -y wireshark
sudo adduser $USER wireshark

## GIMP
sudo add-apt-repository -y ppa:ubuntuhandbook1/gimp
sudo apt update
sudo apt install -y gimp

## Blender
sudo add-apt-repository -y ppa:thomas-schiex/blender
sudo apt update
sudo apt install -y blender

## bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.4/bottom_0.6.4_amd64.deb
sudo dpkg -i bottom_0.6.4_amd64.deb

