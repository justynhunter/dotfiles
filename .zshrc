export EDITOR=nvim
export DOTNET_ROOT="/usr/local/share/dotnet"

# n
export N_PREFIX=~/.n
export PATH="$N_PREFIX/bin:$PATH"

eval "$(zoxide init zsh)"

# Mac settings
if [[ "$(uname -s)" == "Darwin" ]]; then
    source $ZSH/oh-my-zsh.sh

    # # set oh my posh theme
    if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
        eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
    fi

    # # zsh plugins
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

    export PNPM_HOME="$HOME/Library/pnpm"
    export PATH="$PATH:$HOME/Users/jhunter/.dotnet/tools" #work
    export PATH="/usr/local/opt/libpq/bin:$PATH"
fi

# Linux settings
if [[ "$(uname -s)" == "Linux" ]]; then
    # brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # go bin
    if command -v go &> /dev/null; then
        export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
    fi
    export N_PREFIX=/home/jhunter/.n
    
    source $HOME/.oh-my-zsh/oh-my-zsh.sh

    eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"

    export PATH="$PATH:/home/jhunter/.npm/global/bin"

    # pnpm
    export PNPM_HOME="/home/jhunter/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
fi

alias nmap-ssl="nmap --script ssl-enum-ciphers -p 443"
alias vim="nvim"
alias gu="git reset HEAD~"
alias gitbclean="git branch --merged | egrep -v '(^\*|master|main|dev)' | xargs git branch -d"
alias ls="eza --color=always --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza --all --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --all --color=always --long --icons=always --no-permissions -o -B"
alias cd="z"
alias v="fzf | xargs nvim"

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

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# pnpm
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# keybinds
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# bindkey -v # vim key mode

# ocaml
if command -v opam &> /dev/null; then
    eval $(opam env)
fi

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--tmux center --layout reverse'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --exclude .git'
