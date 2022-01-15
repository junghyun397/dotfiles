# dotfiles
Personal Configuration files for Debian Systems


``Ubuntu(Pop! OS)`` with ``GNOME 40``: ``zsh``, ``vim``, ``uim``, ``docker``, ``kakaotalk``, etc.


Test matrix:

| Distro | Hardware | Issue |
| ------ | -------- | ----- |
| Ubuntu 20.04 | VirtualBox amd64 | NONE |
| Ubuntu 20.04 | Ryzen + Nvidia Desktop | NONE |
| Ubuntu 20.04 | DELL XPS 13 9310 OLED | NONE |

## Getting Started

via script

```shell
wget https://raw.githubusercontent.com/junghyun397/dotfiles/desktop/scripts/setup/setup.sh -O - | bash
```

Dotfiles only

```shell
git clone -b $DEVICE --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

## Dotfiles Tool

Alias ``dft`` for [``scripts/dotfiles-tool.sh``](https://github.com/junghyun397/dotfiles/blob/desktop/scripts/dotfiles-tool.sh)

### Add an file

```shell
dft add $FILE 
```

equal to

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME add $FILE
```

### Push to repositoty

```shell
dft push $MESSAGE
```

equal to

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME commit -a -m "$MESSAGE"
git --git-dir=$HOME/.dotfiles push -u origin $DEVICE

```

### Check diffrence

```shell
dft diff
```

equal to

```shell
git --git-dir=$HOME/.dotfiles diff
```
