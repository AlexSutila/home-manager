# This file is named "bash_aliases" because I mainly used debian/ubuntu
# based distros which source ~/.bash_aliases in the default bashrc. This
# technically does a bit more than just crease aliases but idfc.

export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
source <(fzf --bash)

alias on='nvim -c "ObsidianNew"'
alias os='nvim -c "ObsidianSearch"'
alias ot='nvim -c "ObsidianTags"'
set -o vi # vim keys in terminal go hard

alias clipbd='xclip -sel clip'
alias cc='clear'
alias ta='s=`tmux ls | fzf`; tmux attach -t "${s%%:*}"'
alias tn='tmux new -s'
alias tk='s=`tmux ls | fzf`; tmux kill-session -t "${s%%:*}"'
alias tt='~/.local/bin/tmux_zoxide.sh'
alias t='tmux'
alias gs='bash -c '\''if [ $# -eq 0 ]; then watch --color git -c color.status=always status --short; else git stage "$@"; fi'\'' _ "$@"'
alias gl='git log --all --graph --pretty=format:"%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n"'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gr='git restore'
alias gc='git commit'
alias gp='git push'
alias gu='git pull'
alias gb='git branch'
alias gi='git init'
alias gcl='git clone'
