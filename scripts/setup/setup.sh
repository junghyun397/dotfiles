git clone -b laptop --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

mkdir -p ~/Tools

~/scripts/setup/sdk.sh
~/scripts/setup/zsh.sh
~/scripts/setup/utils.sh
~/scripts/setup/window-manager.sh
~/scripts/setup/applications.sh

