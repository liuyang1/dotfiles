#! /usr/bin/env bash
PREFIX=~/.config/awesome
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/rc.lua $PREFIX/rc.lua

echo "OK"
