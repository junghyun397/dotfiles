#!/bin/bash

# FUNCTIONS

function add_ppa_if_absent() {
    if [ apt show $1 ]
    then
        sudo add-apt-repository -y $2
    fi
}

function terminal_bell() {
    echo -e "\07"
}

function with_tmp() {
    cd /tmp
    $1
    cd ~
}

function ask_execution() {
    terminal_bell
    echo "EXECUTE $2? [Y/n]"
    read awnser

    if ! [ "$awnser" == "n" ]
    then
        $1
    fi
}

# BASICS

function init_apt() {
    sudo apt update
    sudo apt upgrade -y
}

# SETUP/INSTALL

function install_basics() {
    sudo apt install -y openssh-server git curl screen net-tools pm-utils
}

function install_build_bins() {
    sudo apt install -y libdbus-1-dev libssl-dev 
}

function install_build_tools() {
    sudo apt install -y build-essential make cmake clang node-typescript 
}

function install_package_managers() {
    sudo apt install -y cargo gdebi python3-pip ppa-purge
}

function install_utils() {
    sudo apt install -y tldr screenfetch tree fzf
}

function placement_dotfiles() {
    git clone -b $1 --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
}

function install_gnome_basics() {
    sudo apt install -y xdotool x11-xserver-utils gnome-tweak-tool gnome-shell-extensions
}

function install_gnome_extensions() {
    terminal_bell
    xdg-open https://extensions.gnome.org/extension/1319/gsconnect/
    xdg-open https://extensions.gnome.org/extension/1287/unite/
    xdg-open https://extensions.gnome.org/extension/3222/block-caribou-36/
}

function setup_gnome_terminal() {
    gsettings set org.gnome.Terminal.Legacy.Settings headerbar false
}

function setup_github() {
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt -y install gh
}

function install_java() {
    sudo apt install -y openjdk-8-jre openjdk-8-jdk openjdk-17-jre openjdk-17-jdk
}

function install_scala() {
}

function install_kotlin() {
}

function install_ruby() {
    sudo apt install -y ruby-full
}

function install_python() {
}

function install_chrome() {
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main">> /etc/apt/sources.list.d/google-chrome.list'
    sudo apt update
    sudo apt install -y google-chrome-stable
}

function install_jetbrains_toolbox() {
    cd Downloads
    tar -xvf jetbrains-toolbox-*.tar.gz
    cd jetbrains-toolbox-*
    chmod 700 jetbrrains-toolbox
    ./jetbrains-toolbox
    cd ~
}

function install_tex() {
    sudo apt install -y texlive-latex-recommended texlive-latex-recommended-doc
}

function install_vlc() {
    sudo apt install -y vlc
}

function install_gimp() {
    if check_package_available gimp
    then
        sudo add-apt-repository -y ppa:ubuntuhandbook1/gimp
        sudo apt update
    fi
    sudo apt install -y gimp
}

function install_blender {
    sudo add-apt-repository -y ppa:thomas-schiex/blender
    sudo apt update
    sudo apt install -y blender
}

function setup_wireshark() {
    sudo apt install -y wireshark
    sudo adduser $USER wireshark
}

function install_bottom {
    curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.4/bottom_0.6.4_amd64.deb
    sudo gdebi bottom_0.6.4_amd64.deb
}

# FIXES

function disable_gnome_hot_keys {
    gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
    for i in $(seq 1 9); do gsettings set org.gnome.shell.keybindings switch-to-application-${i} "[]"; done
}

function disable_cups_printer {
    sudo systemctl stop cups-browsed
    sudo systemctl disable cups-browsed
}

function purge_snap() {
    sudo apt autoremove --purge snapd
}

# MAIN

device="desktop"
echo "ENVIRONMENT? [DESKTOP/laptop]"
read awnser
if [ "$awnser" == "laptop"]
then
    $device = "laptop"
fi

init_apt

install_basics
install_build_bins
install_build_tools
install_package_managers
install_utils

placement_dotfiles $device

setup_uim_byeoru
setup_keyd

setup_zsh
setup_oh_mu_zsh

install_vim
setup_vundle

install_gnome_basics
install_gnome_extensions
setup_gnome_terminal

setup_github
setup_spotify_tui
setup_kakaotalk

disable_cups_printer
purge_snap
