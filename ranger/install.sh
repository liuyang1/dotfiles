#! /usr/bin/env bash
PREFIX=~/.config/ranger
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/apps.py $PREFIX/apps.py
installFile $PWD/scope.sh $PREFIX/scope.sh

echo "OK"
