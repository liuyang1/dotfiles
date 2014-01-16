#! /usr/bin/env bash
PREFIX=~/.byobu
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/keybindings.tmux $PREFIX/keybindings.tmux
installFile $PWD/profile.tmux $PREFIX/profile.tmux

echo "OK"
