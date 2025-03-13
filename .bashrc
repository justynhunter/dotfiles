#
# ~/.bashrc
#

export EDITOR=nvim
export N_PREFIX=/home/jhunter/.n

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# xoxide
eval "$(zoxide init bash)"
alias cd=z

# ls aliases
alias ls=exa
alias ls="eza --color=always --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza --all --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --all --color=always --long --icons=always --no-permissions -o -B"

alias grep='grep --color=auto'
alias vim='nvim'
PS1='[\u@\h \W]\$ '

# pnpm
export PNPM_HOME="/home/jhunter/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source /usr/share/nvm/init-nvm.sh
. "$HOME/.cargo/env"
