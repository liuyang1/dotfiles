#! /usr/bin/env bash
PREFIX=~/.config/awesome
PWD=`pwd`

installFile(){
	# installFile $1-> $2
    dest=`dirname $2`
    if [[ ! -d $dest ]];
    then
        mkdir -p $dest
    fi
	echo installFile $1
	rm -rf $2
	ln -s $1 $2
}

echo "overwrite orgin awesome WM screen.lua"
echo "    patch switch screen, move cursor to center"
installFile $PWD/screen.lua /usr/share/awesome/lib/awful/screen.lua
installFile $PWD/rc.lua $PREFIX/rc.lua
installFile $PWD/myfoo $PREFIX/themes/myfoo

echo "OK"
