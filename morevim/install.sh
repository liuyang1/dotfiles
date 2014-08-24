#! /usr/bin/env bash
PREFIX=~/
PWD=`pwd`

installFile(){
	# installFile $1-> $2
	echo installFile $1 $2
	rm -rf $2
	ln -s $1 $2
}

installFile $PWD/root.vim $PREFIX/.vimrc
installFile $PWD $PREFIX/.vim

echo "update bundle of plugins"
cd ~/.vim/bundle
if [ ! -d "Vundle.vim" ]; then
    echo "check Vundle first"
    git clone https://github.com/gmarik/Vundle.vim.git
fi

vim +PluginInstall +qall
echo "OK"
