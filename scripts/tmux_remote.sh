#!/usr/bin/env bash
RES=($(awk '$1 == "Host" {print $2}' ~/.ssh/config | fzf --tmux))

if [ -n "$TMUX" ]; then
    if [ $1 == "window" ]; then
        tmux new-window "ssh ${RES}"
    elif [ $1 == "vert" ]; then
        tmux split-window "ssh ${RES}"
    elif [ $1 == "hori" ]; then
        tmux split-window -h "ssh ${RES}"
    fi
else
    tmux new -s "${RES}" "ssh ${RES}"
fi
