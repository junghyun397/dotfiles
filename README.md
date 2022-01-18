# dotfiles
Personal Configuration files for Debian Systems


``Ubuntu(Pop!_OS)`` ``X11`` with ``GNOME 40``: ``zsh``, ``vim``, ``uim``, ``docker``, ``hw-controls``, ``kakaotalk``, etc.


Test matrix:

| Distro | Hardware | Branch | Issue |
| ------ | -------- | ------ | ----- |
| Ubuntu 20.04 | VirtualBox amd64 | ``desktop`` | :heavy_check_mark: |
| Pop!_OS 21.10 | Ryzen + Nvidia Desktop[^desktop-specification] | ``desktop`` | :heavy_check_mark: |
| Pop!_OS 21.10 | DELL XPS 13 9350 UHD | ``laptop``[^laptop-specification] | ``laptop`` | :heavy_check_mark: |

[^desktop-specification]: AMD Ryzen 1700, Nvidia Geforce GTX1080, Samsung DDR4 32GB, ASUS Crosshair VI, HP EX920 NVMe 1TB, Corsair H100i pro XT
[^laptop-specification]: Intel i7-6560u, DDR4 8GB, UHD touch 3200x1800

## Getting Started

Via script

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
