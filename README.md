# dotfiles
![desktop](.images/cover.png)

Personal Configuration files for Debian Systems


``Ubuntu(Pop!_OS)`` ``X11`` with ``GNOME 40``: ``zsh``, ``vim``, ``uim-byeoru``, ``docker``, ``hw-controls``, ``kakaotalk``, etc.


Test matrix:

| Distro | Hardware | Branch | Issue |
| ------ | -------- | ------ | ----- |
| Ubuntu 22.04 | VirtualBox amd64 | ``desktop`` | :heavy_check_mark: |
| Pop!_OS 22.04 | Ryzen + Nvidia Desktop[^desktop-specification] | ``desktop`` | :heavy_check_mark: |
| Pop!_OS 22.04 | DELL XPS 13 9350 UHD[^laptop-specification] | ``laptop`` | :heavy_check_mark: |

[^desktop-specification]: AMD Ryzen 1700, Nvidia Geforce GTX1080, DDR4 32GB, ASUS Crosshair VI HERO, HP EX920 NVMe 1TB, Corsair H100i pro XT
[^laptop-specification]: Intel i7-6560u, DDR4 8GB, UHD touchscreen 3200x1800

## Getting Started

Via Semi-Automatic script (A simple action is required to gdebi and install GNOME-extension.)

```shell
bash <(wget -qO- https://raw.githubusercontent.com/junghyun397/dotfiles/desktop/scripts/setup/setup.sh)
```

Dotfiles only

```shell
git clone -b $DEVICE --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

## Keyboard Layout

Powered by [``keyd``](https://github.com/rvaiya/keyd)

![leopold fc980c](.images/keyboard-layout-980c.png)

## Dotfiles Tool

Alias ``dft`` for [``scripts/dotfiles-tool.sh``](https://github.com/junghyun397/dotfiles/blob/desktop/scripts/dotfiles-tool.sh)

### Git Prompt

```shell
dft git ...
```

equal to

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME ...
```

### Push to Repositoty

```shell
dft push $MESSAGE
```

equal to

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME commit -a -m "$MESSAGE"
git --git-dir=$HOME/.dotfiles push -u origin $DEVICE

```

