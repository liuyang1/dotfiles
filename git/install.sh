#! /usr/bin/env bash
PREFIX=~
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/gitconfig			$PREFIX/.gitconfig
installFile $PWD/gitignore_global	$PREFIX/.gitignore_global
installFile $PWD/rmGitFile.sh       ~/.local/bin/rmGitFile.sh
installFile $PWD/userGit.sh         ~/.locla/bin/userGit.sh

echo "OK"
