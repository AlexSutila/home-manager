# This file is named "bash_aliases" because I mainly used debian/ubuntu
# based distros which source ~/.bash_aliases in the default bashrc. This
# technically does a bit more than just crease aliases but idfc.

eval "$(zoxide init bash)"
source <(fzf --bash)

set -o vi
alias cc='clear'
alias ta='s=`tmux ls | fzf`; tmux attach -t "${s%%:*}"'
alias tn='tmux new -s'
alias tk='s=`tmux ls | fzf`; tmux kill-session -t "${s%%:*}"'
alias gr='~/.scripts/tmux_repo.sh'
alias gz='~/.scripts/tmux_zoxide.sh'
alias t='tmux'

alias vpnstart='~/git/dots/scripts/vpn_connect.sh'
alias vpnstop='/opt/cisco/secureclient/bin/vpn disconnect'
alias vpnstate='/opt/cisco/secureclient/bin/vpn state'
