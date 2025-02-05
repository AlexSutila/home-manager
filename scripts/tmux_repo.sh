#!/usr/bin/env bash
GIT="${HOME}/git"
REPO_PATH=$(find "${GIT}" -iname ".git" -exec sh -c 'echo "{}" | sed "s/\.git$//"' \; | fzf --tmux)

if [ -z "${REPO_PATH}" ]; then
    exit 1
fi
REPO=$(echo "$REPO_PATH" | awk -F/ '{ print $(NF-1) }')
tmux new-session -d -c "${REPO_PATH}" -s "${REPO}"

if [ -n "$TMUX" ]; then
    tmux switch-client -t "${REPO}"
else
    tmux attach-session -t "${REPO}"
fi
