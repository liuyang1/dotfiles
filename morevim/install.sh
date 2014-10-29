#! /usr/bin/env bash
PREFIX=$HOME
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1 $2
	rm -rf $2
	ln -s $1 $2
}

installFile $PWD/root.vim           $PREFIX/.vimrc
installFile $PWD                    $PREFIX/.vim
installFile $PWD/ctags              $PREFIX/.ctags
installFile $PWD/ycm_extra_conf.py  $PREFIX/.ycm_extra_conf.py

UNDODIR="$HOME/.vimundo"
[[ ! -d "$UNDODIR" ]] && mkdir "$UNDODIR"
./update.sh
