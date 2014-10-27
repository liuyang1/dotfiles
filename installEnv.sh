#! /usr/bin/env bash

# create a soft-link between $1 and $2
installFile(){
	# installFile $1-> $2
    PWD=$(pwd)
	echo installFile "$PWD"/"$1" "$2"
	rm -rf "$2"
	ln -s "$PWD"/"$1" "$2"
}

# create a soft-link with same name, but to other dir
installFile2Dir(){
    name=$(basename "$1")
    file="$2"/"$name"
    installFile "$1" "$file"
}

# create a soft-link with dot-name
installDotFile(){
    name=$1
    dir=$2
    src=$name
    dst=$dir/.$name
    installFile "$src" "$dst"
}
