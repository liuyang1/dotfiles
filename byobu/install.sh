#! /usr/bin/env bash
PREFIX=~/.byobu
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1
	rm $2
	ln -s $1 $2
}

installFile $PWD/profile.tmux $PREFIX/profile.tmux
installFile $PWD/color.tmux $PREFIX/color.tmux
installFile $PWD/datetime.tmux $PREFIX/datetime.tmux
installFile $PWD/keybindings.tmux $PREFIX/keybindings.tmux
installFile $PWD/powerline.tmux.conf $PREFIX/powerline.tmux.conf
installFile $PWD/windows.tmux $PREFIX/windows.tmux

echo "OK"
