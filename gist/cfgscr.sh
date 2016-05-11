#! /usr/bin/env bash
# How to config ViewSonic monitor with archlinux ATI card
IN=LVDS-1
EXT="VGA-1"
mode="1680x1050_60.00"

# next line generate by cvt
cvt 1680 1050

xrandr --newmode "$mode"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
xrandr --addmode "$EXT" "$mode"
xrandr --output "$EXT" --mode "$mode"

xrandr --output $IN --auto --output $EXT --auto --left-of $IN

xrandr
