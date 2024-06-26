# dotfiles
![desktop](.images/cover.png)

Personal Configuration files for Debian/macOS Systems.

**Desktop branch**: ``Ubuntu(Pop!_OS)`` ``X11`` with ``GNOME 40``. ``keyd``, ``hw-controls``, ``kakaotalk``.
**Laptop branch**: ``macOS`` ``Sonoma`` with ``Aerospace``. ``karabiner-elements``.

Test matrix:

| Distro | Hardware | Branch | Issue |
| ------ | -------- | ------ | ----- |
| Ubuntu 22.04 | VirtualBox amd64 | ``desktop`` | :heavy_check_mark: |
| Pop!_OS 22.04 | Ryzen + Nvidia Desktop[^desktop-specification] | ``desktop`` | :heavy_check_mark: |
| macOS Sonoma | MacBook Pro M1 Pro[^laptop-specification] | ``laptop`` | :heavy_check_mark: |

[^desktop-specification]: AMD Ryzen 1700, Nvidia Geforce GTX1080, DDR4 32GB, ASUS Crosshair VI HERO, HP EX920 NVMe 1TB, Corsair H100i pro XT
[^laptop-specification]: M1 Pro 10C, 16GB RAM, 1TB SSD

## Getting Started

Via semi-automatic script

Desktop:
```shell
bash < (wget -qO- https://raw.githubusercontent.com/junghyun397/dotfiles/desktop/scripts/setup/setup.sh)
```

Laptop:
```shell
zsh < (wget -qO- https://raw.githubusercontent.com/junghyun397/dotfiles/laptop/scripts/setup/setup.sh)
```

Dotfiles only

```shell
git clone -b BRANCH --bare https://github.com/junghyun397/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

## Keyboard Layout

Powered by [``keyd``](https://github.com/rvaiya/keyd), [``Karabiner-Elements``](https://github.com/pqrs-org/Karabiner-Elements) and [``HammerSpoon``](https://www.hammerspoon.org/)

![ANSI](.images/keyboard-layout-ansi.png)
![HHKB Studio](.images/keyboard-layout-hhkb-studio.png)

## Dotfiles Tool

Alias ``config`` for [``scripts/dotfiles-tool.sh``](https://github.com/junghyun397/dotfiles/blob/desktop/scripts/dotfiles-tool.sh)

### Git Promptk

```shell
config git ...
```

equal to

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME ...
```

### Push to Repositoty

```shell
config push $MESSAGE(optional)
```

equal to

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME commit -a -m "$MESSAGE"
git --git-dir=$HOME/.dotfiles push -u origin $CURRENT_BRANCH
```
