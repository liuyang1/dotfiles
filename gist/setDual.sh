#! /usr/bin/env bash
# xrandr --output VGA-0 --left-of LVDS --auto
xrandr --output VGA-1 --auto --left-of DP-2 --auto
xrandr --output DP-2 --mode 3840x2160
xrandr --output VGA-1 --mode 1920x1080
