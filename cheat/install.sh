#! /usr/bin/env bash
PREFIX=~

source ../installEnv.sh

sudo pip install cheat

installDotFile cheat "$HOME"

echo "OK"
