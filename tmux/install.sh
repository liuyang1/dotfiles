#! /usr/bin/env bash
PREFIX=~

source ../installEnv.sh

while true; do
    read -p "which version tmux using now? 
[0]:before 1.9a,
[1]:after  1.9a,
 > " val
    case $val in
        [0]* ) TMUXConf=tmux.18.conf; break;;
        [1]* ) TMUXConf=tmux.19.conf; break;;
        * ) echo "Please answer 0 or 1.";;
    esac
done
installFile $TMUXConf "$PREFIX/.tmux.version.conf"
installDotFile tmuxline.conf "$PREFIX"
installDotFile tmux.conf "$PREFIX"

echo "OK"
