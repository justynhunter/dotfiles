if status is-interactive
   # Commands to run in interactive sessions can go here
end

source ~/.secrets.fish

set -x EDITOR nvim
set -x DOTNET_ROOT /usr/local/share/default
set -x N_PREFIX ~/.n

fish_add_path -a $N_PREFIX/bin
# system specific configs
if [ "$(uname -s)" = "Darwin" ]
    set -x PNPM_HOME $HOME/Library/pnpm
    fish_add_path /usr/local/opt/libpq/bin # postgres lib
else if [ "$(uname -s)" = "Linux" ]
    set -x PNPM_HOME $HOME/.local/share/pnpm
    fish_add_path ~/.npm-global/bin
end

fish_add_path -a $HOME/.dotnet/tools
fish_add_path $PNPM_HOME
fish_add_path -a $(go env GOBIN)
fish_add_path -a $(go env GOPATH)/bin

alias vim="nvim"
alias nmap-ssl="nmap --script ssl-enum-ciphers -p 443"
alias ls="eza --color=always --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza --all --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --all --color=always --long --icons=always --no-permissions -o -B"
alias fzp='fzf --preview "bat --style=numbers --color=always {}"'

#zoxide init fish --cmd cd | source

set -x FZF_DEFAULT_OPTS '--tmux center --layout reverse'
set -x FZF_DEFAULT_COMMAND "rg --files --hidden -g'!.git' -g'!node_modules'"
fzf --fish | source
