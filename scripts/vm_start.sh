#!/bin/bash
SEL=`VBoxManage list vms | fzf --tmux`
VMNAME=$(echo "$SEL" | sed 's/[^"]*"\([^"]*\)".*/\1/')
VBoxManage startvm "$VMNAME" --type headless
