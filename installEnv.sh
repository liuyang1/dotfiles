#! /usr/bin/env bash
installFile(){
	# installFile $1-> $2
    PWD=$(pwd)
	echo installFile "$PWD"/"$1" "$2"
	rm -rf "$2"
	ln -s "$PWD"/"$1" "$2"
}

installFile2Dir(){
    name=$(basename "$1")
    file="$2"/"$name"
    installFile "$1" "$file"
}

installDotFile(){
    name=$1
    dir=$2
    src=$name
    dst=$dir/.$name
    installFile "$src" "$dst"
}
