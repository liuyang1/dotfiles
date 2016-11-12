#! /usr/bin/env bash
PREFIX=~/.config/zathura
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm -f $2
	dst=`dirname "$2"`
	[[ -d "$dst" ]] || mkdir -p "$dst"
	ln -s $1 $2
}

installFile $PWD/zathurarc $PREFIX/zathurarc

echo "OK"
