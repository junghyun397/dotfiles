if [ "$1" == "push" ]; then
    branch=$(git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" rev-parse --abbrev-ref HEAD)

    msg="update dotfiles $(date)"
    if [ $# -eq 2 ]; then 
        msg="$2"
    fi

    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" commit -a -m "$msg"
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" push -u origin "$branch"
elif [ "$1" == "git" ]; then
    shift
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
else
    exit 128
fi

