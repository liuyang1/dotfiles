#! /usr/bin/env bash

### plugin deps
# - lain-git
PREFIX=~/.config/awesome
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/rc.lua $PREFIX/rc.lua

pushd $HOME/.config/awesome
git clone https://github.com/guotsuan/eminent.git
git clone https://github.com/copycat-killer/lain.git

echo "OK"
