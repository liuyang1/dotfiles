#! /usr/bin/env bash
PREFIX=~
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm -f $2
	ln -s $1 $2
}

installFile $PWD/zshrc			$PREFIX/.zshrc

echo "OK"
