#! /usr/bin/env bash
PREFIX=~/testpath/
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1 $2
	rm $2
	ln -s $1 $2
}

installFile $PWD/root.vim $PREFIX/.vimrc
installFile $PWD $PREFIX/.vim

echo "OK"
