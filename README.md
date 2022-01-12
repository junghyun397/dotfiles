# dotfiles
Personal Configuration files for Debian Systems


``Ubuntu(Pop! OS)`` with ``GNOME 40``: ``zsh``, ``vim``, ``uim``, ``docker``, etc.

## Getting Started

via script

```shell
wget https://raw.githubusercontent.com/junghyun397/dotfiles/desktop/scripts/setup.sh -O - | bash
```

Dotfiles only

```shell
git clone -b $DEVICE --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

## Dotfiles Tool

### Add an file

```shell
dft add $FILE 
```

equal to

```shell
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
```

### Push to repositoty

```shell
dft push $MESSAGE
```

equal to

```shell
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -a -m "$msg"
git --git-dir=$HOME/.dotfiles push -u origin $device

```

