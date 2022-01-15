#!/bin/bash

# FUNCTIONS

function package_available() {
    return apt show $1
}

function terminal_bell() {
    echo -e "\07"
}

function with_tmp() {
    cd /tmp
    $1
    cd ~
}

function ask_excution() {
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
    git clone -b $DEVICE --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
}

function setup_uim_byeoru() {
    sudo apt install -y uim uim-byeoru
}

function setup_keyd() { # need /tmp
    git clone https://github.com/rvaiya/keyd
    cd keyd
    make && sudo make install
    ln ~/.keyd.conf /etc/keyd/default.conf
    sudo systemctl enable keyd
    sudo systemctl start keyd
}

function setup_zsh() {
    sudo apt install zsh
    chsh -s /usr/bin/zsh
}

function setup_oh_my_zsh() {
    # Oh-My-Zsh
    wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

    # Zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # colorls
    sudo gem install -y colorls
}

function install_vim() {
    sudo apt install -y vim-gtk3
}

function setup_vundle() {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
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

function setup_docker() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli

    sudo groupadd docker
    sudo usermod -aG docker $USER

    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
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

function install_spotify() {
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update
    sudo apt install -y spotify-client
}

function setup_spotify_tui() { # need /tmp
    git clone https://github.com/Rigellute/spotify-tui.git
    cd spotify-tui
    cargo install spotify-tui

    wget https://raw.githubusercontent.com/Rigellute/spotify-tui/f68e0e9621640629f29883b9321624f84f40eff2/snap/gui/spt.desktop -P ~/.local/share/applications
    terminal_bell
    spt
}

function install_discord() {
    ~/scripts/update-discord.sh
}

function install_vlc() {
    sudo apt install -y vlc
}

function install_gimp() {
    sudo add-apt-repository -y ppa:ubuntuhandbook1/gimp
    sudo apt update
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
    sudo dpkg -i bottom_0.6.4_amd64.deb
}

function setup_kakaotalk {
   ~/scripts/setup/kakaotalk.sh 
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

DEVICE="desktop"
echo "ENVIRONMENT? [DESKTOP/laptop]"
read awnser
if [ "$awnser" == "laptop"]
then
    $DEVICE = "laptop"
fi

init_apt

install_basics
install_build_bins
install_build_tools
install_package_managers
install_utils

placement_dotfiles

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
