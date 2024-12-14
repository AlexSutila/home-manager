#!/bin/bash

# For fixing my stupid monitor setup. This script is currently
# very lame and lazy, as I have to manually comment the line
# based on which desk I'm at. Needs revisions :c

# xrandr --output HDMI-1 --mode 2560x1080 --right-of eDP-1
xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1
xrandr --output eDP-1 --reflect normal
