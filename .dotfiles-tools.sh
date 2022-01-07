#!/bin/bash

# ./.dotfiles-tools.sh add $DOTFILE
if [[ "$1" == "add" ]]
then
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add $2
# ./.dotfiles-tools.sh publish $MESSAGE
elif [[ "$1" == "publish" ]]
then
    device=git --git-dir=$HOME/.dotfiles/ rev-parse --abbrev-ref HEAD

    msg="update dotfiles `date`"
    if [[ $# -eq 2 ]]
    then 
        msg="$2"
    fi

    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "$msg"
    git --git-dir=$HOME/.dotfiles push -u origin $device
else
    exit 128
fi

