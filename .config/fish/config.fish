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
    set -x PNPM_HOME /Users/jhunter/Library/pnpn
    fish_add_path -a /Users/jhunter/.dotnet/tools
    fish_add_path /usr/local/opt/libpq/bin
else if [ "$(uname -s)" = "Linux" ]
    set -x N_PREFIX ~/.n
    set -x PNPM_HOME ~/.local/share/pnpm
end

fish_add_path $PNPM_HOME

alias vim="nvim"
alias nmap-ssl="nmap --script ssl-enum-ciphers -p 443"
alias ls="eza --color=always --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza --all --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --all --color=always --long --icons=always --no-permissions -o -B"

zoxide init fish --cmd cd | source
