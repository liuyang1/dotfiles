#! /usr/bin/env bash
PREFIX=~
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/gitconfig			$HOME/.gitconfig
installFile $PWD/gitignore_global	$HOME/.gitignore_global
installFile $PWD/rmGitFile.sh       $PREFIX/rmGitFile.sh
installFile $PWD/userGit.sh         $PREFIX/userGit.sh

echo "OK"
