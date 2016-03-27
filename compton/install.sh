#! /usr/bin/env bash

PREFIX="$HOME"
source ../installEnv.sh

installDotFile compton.conf "$PREFIX"

echo "run compton with this command"
echo "compton --config ~/.compton.conf -b"
