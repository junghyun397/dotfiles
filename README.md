# dotfiles
Configuration files for Debian Systems

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

## Dotfiles Tools - ``dft```

### Add an file

```shell
dft add $FILE 
```

### Push to repositoty

```shell
dft push $MESSAGE
```

