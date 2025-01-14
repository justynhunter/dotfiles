if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR nvim
set -x DOTNET_ROOT /usr/local/share/default

# Mac
if [ "(uname -s)" = "Darwin" ]
    eval nodenv init -

    set -x NVM_DIR $HOME/.nvim
    set -x PNPM_HOME /Users/jhunter/Library/pnpn
    fish_add_path -a /Users/jhunter/.dotnet/tools
    fish_add_path /usr/local/opt/libpq/bin
else if [ "(uname -s)" = "Linux" ]
    set -x N_PREFIX ~/.n
    set -x PNPM_HOME ~/.local/share/pnpm
end

alias vim="nvim"
alias nmap-ssl="nmap --script ssl-enum-ciphers -p 443"
