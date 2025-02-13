export EDITOR=nvim
export DOTNET_ROOT="/usr/local/share/dotnet"

# n
export N_PREFIX=~/.n
export PATH="$PATH:$N_PREFIX/bin"

# Mac settings
if [[ "$(uname -s)" == "Darwin" ]]; then
    # nodenv
    eval "$(nodenv init -)"
    source $ZSH/oh-my-zsh.sh

    # set oh my posh theme
    if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
        eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
    fi

    # zsh plugins
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    export PNPM_HOME="/Users/jhunter/Library/pnpm"
    export PATH="$PATH:/Users/jhunter/.dotnet/tools" #work
    export PATH="/usr/local/opt/libpq/bin:$PATH"
fi

# Linux settings
if [[ "$(uname -s)" == "Linux" ]]; then
    # go bin
    export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
    export N_PREFIX=/home/jhunter/.n
    
    source /usr/share/oh-my-zsh/oh-my-zsh.sh

    eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/pure.omp.json)"

    # pnpm
    export PNPM_HOME="/home/jhunter/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
    
    source /usr/share/nvm/init-nvm.sh
fi

alias nmap-ssl="nmap --script ssl-enum-ciphers -p 443"
alias vim="nvim"
alias gu="git reset HEAD~"
alias gitbclean="git branch --merged | egrep -v '(^\*|master|main|dev)' | xargs git branch -d"
alias ls="eza --color=always --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza --all --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --all --color=always --long --icons=always --no-permissions -o -B"
alias cd="z"

# dotnet alias
alias dn="dotnet"
alias dnt="dotnet test"
alias dnr="dotnet run"
alias dnw="dotnet watch"

# git aliases
alias ga="git add ."
alias gp="git pull"
alias gs="git push"
alias gc="git commit"
alias gs="git stash"
alias gsp="git stash pop"

# sesh
function t() {
    if [ $1 != "" ]; then
        eval "sesh connect $1"
    else
        eval "sesh connect $(sesh list | fzf)"
    fi
}

eval "$(zoxide init zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# keybinds
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

## `fuck` command
eval 
fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}

source <(fzf --zsh)
bindkey -v # vim key mode
