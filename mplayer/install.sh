#! /usr/bin/env bash
PREFIX=~/.mplayer/
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/config $PREFIX/config

echo "OK"
