#!/bin/bash

# FUNCTIONS

function terminal_bell() {
    echo -e "\07"
}

function add_ppa_if_absent_then_install() {
    if ! apt show $1
    then
        sudo add-apt-repository -y $2
        sudo apt update
    fi
    sudo apt install -y $1
}

function ask_execution() {
    terminal_bell
    echo "EXECUTE $2? [Y/n]"
    read awnser

    if [ ! "$awnser" == "n" ]
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
    sudo apt install -y libdbus-1-dev libssl-dev libudev-dev
}

function install_build_tools() {
    sudo apt install -y build-essential make cmake clang node-typescript 
}

function install_package_managers() {
    sudo apt install -y gdebi python3-pip ppa-purge
}

function install_utils() {
    sudo apt install -y tldr screenfetch tree fzf
}

function placement_zsh_sh() {
    mkdir -p ~/scripts/setup/
    wget -O ~/scripts/setup/zsh.sh https://raw.githubusercontent.com/junghyun397/dotfiles/desktop/scripts/setup/zsh.sh
    chmod a+x ~/scripts/setup/zsh.sh
}

function clean_zsh_sh() {
    rm ~/.zshrc
    rm ~/scripts/setup/zsh.sh
}

function placement_dotfiles() {
    git clone -b $1 --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
}

function install_gnome_basics() {
    sudo apt install -y xdotool x11-xserver-utils gnome-tweaks gnome-shell-extensions
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
    echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
    echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
    sudo apt update
    sudo apt install -y sbt
}

function install_ruby() {
    sudo apt install -y ruby-full
}

function install_python() {
    sudo apt install -y pypy3
}

function setup_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
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
    add_ppa_if_absent_then_install gimp ppa:ubuntuhandbook1/gimp
}

function install_blender {
    add_ppa_if_absent_then_install blender ppa:thomas-schiex/blender
}

function setup_wireshark() {
    sudo apt install -y wireshark
    sudo adduser $USER wireshark
}

function install_obs() {
    sudo apt install -y ffmpeg
    add_ppa_if_absent_then_install obs-studio ppa:obsproject/obs-studio
}

function install_zoom {
    wget -P ~/Downloads https://zoom.us/client/latest/zoom_amd64.deb
    sudo gdebi -n ~/Downloads/zoom_amd64.deb
}

function install_bottom {
    wget -P ~/Downloads https://github.com/ClementTsang/bottom/releases/download/0.6.4/bottom_0.6.4_amd64.deb
    sudo gdebi -n ./Downloads/bottom_0.6.4_amd64.deb
}

# FIXES

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
if [ "$awnser" == "laptop" ]
then
    device="laptop"
fi

cd ~

init_apt

install_basics
install_build_bins
install_build_tools
install_package_managers
install_utils

install_gnome_basics

placement_zsh_sh
~/scripts/setup/zsh.sh
clean_zsh_sh

placement_dotfiles $device

~/scripts/setup/vim.sh
~/scripts/setup/ime.sh

~/scripts/setup/docker.sh

~/scripts/setup/fonts.sh
~/scripts/setup/discord.sh

install_wireshark
install_bottom

install_chrome
install_jetbrains_toolbox
install_vlc
install_gimp
install_blender
install_obs
install_zoom

# SDKS
install_java
install_scala
install_ruby
install_python
install_tex

setup_rust

# LOGINS
~/scripts/setup/spotify.sh
setup_github

ask_execution ~/scripts/setup/rice-gnome.sh "RICE GNOME"
ask_execution disable_cups_printer "DISABLE AUTO DISCOVER PRINTERS"
ask_execution purge_snap "PURGE SNAPD"

echo "DONE! DONT FORGET RESTART."
