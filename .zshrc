source "$HOME/.profile"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

## autocomplete
HYPHEN_INSENSITIVE="true"

## plugins
plugins=(
    git
)

## p10k
ZSH_THEME="powerlevel10k/powerlevel10k"

### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## syntax
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## enable
source $ZSH/oh-my-zsh.sh

# nvim
alias vi="nvim"

# lsd
alias ls="lsd"
alias tree="lsd --tree"

# ccat
alias cat="ccat"

# dotfils-tool
alias dotfiles="~/Scripts/dotfiles-tool.sh" 

# alacritty font size
alias sfs="~/Scripts/alacritty-small-font-size.sh"
alias lfs="~/Scripts/alacritty-large-font-size.sh"

# deepseek-claude
alias clauded="~/Scripts/deepseek-claude.sh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# 1password
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

