#!/usr/bin/env bash

# For keyboards which I cannot reprogram the actual
# firmware on. I cannot live with the traditional
# location of escape - terrible.

# Check if the script was passed an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 enable|disable"
    exit 1
fi

# Check the argument and act accordingly
case $1 in
    enable)
        setxkbmap -option "caps:swapescape"
        echo "Caps Lock and Escape keys swapped."
        ;;
    disable)
        setxkbmap -option "" # Disable the option
        echo "Caps Lock and Escape keys not swapped."
        ;;
    *)
        echo "Invalid argument. Use 'enable' or 'disable'."
        exit 1
        ;;
esac
