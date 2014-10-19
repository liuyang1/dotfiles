#! /usr/bin/env bash
PREFIX=~

source ../installEnv.sh

installDotFile tmux.conf "$PREFIX"
installDotFile tmuxline.conf "$PREFIX"

echo "OK"
