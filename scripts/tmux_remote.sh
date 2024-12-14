#!/bin/bash
RES=($(awk '$1 == "Host" {print $2}' ~/.ssh/config | fzf --tmux))

if [ -n "$TMUX" ]; then
    tmux new-window "ssh ${RES}"
else
    tmux new -s "${RES}" "ssh ${RES}"
fi
