#! /usr/bin/env bash
PREFIX=~
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/dircolors $PREFIX/.dircolors
installFile $PWD/bashrc $PREFIX/.bashrc
installFile $PWD/bash_profile $PREFIX/.bash_profile
installFile $PWD/inputrc $PREFIX/.inputrc
installFile $PWD/aliases $PREFIX/.aliases

echo "OK"
