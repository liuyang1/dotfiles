#! /usr/bin/env bash
PREFIX=~
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/Xresources		$PREFIX/.Xresources

echo "OK"

extdir="$HOME/.urxvt/ext"
[[ -d  "$extdir" ]] || mkdir -p "$extdir"

cd "$extdir"

git clone https://github.com/majutsushi/urxvt-font-size
ln -s urxvt-font-size/font-size font-size

git clone https://github.com/muennich/urxvt-perls
ln -s urxvt-perls/url-select url-select
