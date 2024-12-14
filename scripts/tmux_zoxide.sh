#!/bin/bash
RES=($(zoxide query -l))
DEST_PATH=$(printf "%s\n" ${RES[@]} | fzf --tmux)

if [ -z "${DEST_PATH}" ]; then
    exit 1
fi
DEST=$(echo "$DEST_PATH" | awk -F/ '{ print $NF }')
tmux new-session -d -c "${DEST_PATH}" -s "${DEST}"

if [ -n "$TMUX" ]; then
    tmux switch-client -t "${DEST}"
else
    tmux attach-session -t "${DEST}"
fi
