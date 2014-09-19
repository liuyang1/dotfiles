#! /usr/bin/env bash
PREFIX=~
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/tmux.conf  $PREFIX/.tmux.conf
installFile $PWD/tmuxline.conf  $PREFIX/.tmuxline.conf

echo "OK"
