#! /usr/bin/env zsh
PREFIX=~
PWD=`pwd`

installFile(){
    # installFile $1-> $2
    echo installFile $1
    rm -f $2
    ln -s $1 $2
}

installFile $PWD/zshrc          $PREFIX/.zshrc
installFile $PWD/aliases        $PREFIX/.aliases
installFile $PWD/zshenv         $PREFIX/.zshenv
installFile $PWD/zsh_local      $PREFIX/.zsh_local
installFile $PWD/myagnoster.zsh-theme       $PREFIX/.oh-my-zsh/themes/myagnoster.zsh-theme

echo "OK"
