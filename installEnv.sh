#! /usr/bin/env bash

# create a soft-link between $1 and $2
installFile(){
    # installFile $1-> $2
    PWD=$(pwd)
    if [[ "$1" != /* ]]; then
        SRC="$PWD/$1"
    else
        SRC="$1"
    fi
    echo installFile "$SRC" "->" "$2"
    ln -s -f "$SRC" "$2"
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
