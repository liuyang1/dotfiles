#! /usr/bin/env bash
PREFIX=~/.config/ipython/profile_default/
[ -z $PREFIX ] || ipython2 profile create
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/ipython_config.py			$PREFIX/ipython_config.py

echo "OK"
