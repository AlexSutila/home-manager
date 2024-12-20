# This file is named "bash_aliases" because I mainly used debian/ubuntu
# based distros which source ~/.bash_aliases in the default bashrc. This
# technically does a bit more than just crease aliases but idfc.

eval "$(zoxide init bash)"
source <(fzf --bash)

alias on='nvim -c "ObsidianNew"'
alias os='nvim -c "ObsidianSearch"'
alias ot='nvim -c "ObsidianTags"'
set -o vi # vim keys in terminal go hard

alias clpbd='xclip -sel clip'
alias cc='clear'
alias ta='s=`tmux ls | fzf`; tmux attach -t "${s%%:*}"'
alias tn='tmux new -s'
alias tk='s=`tmux ls | fzf`; tmux kill-session -t "${s%%:*}"'
alias gr='~/.scripts/tmux_zoxide.sh'
alias gR='~/.scripts/tmux_repo.sh'
alias gS='~/.scripts/tmux_remote.sh'
alias t='tmux'

alias vpnstart='~/.scripts/vpn_connect.sh'
alias vpnstop='/opt/cisco/secureclient/bin/vpn disconnect'
alias vpnstate='/opt/cisco/secureclient/bin/vpn state'
alias vmstart='~/.scripts/vm_start.sh'
