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

ZSH=$PREFIX/.oh-my-zsh
ZSH_THEME_PATH=$ZSH/themes
ZSH_PLUGIN_PATH=$ZSH/custom/plugins
if [[ ! -d $ZSH ]];
then
    echo "oh my zsh theme not in defualt path! setting it yourself"
else
    installFile $PWD/myagnoster.zsh-theme       $ZSH_THEME_PATH/myagnoster.zsh-theme
    installFile $PWD/fast-agnoster.zsh-theme    $ZSH_THEME_PATH/fast-agnoster.zsh-theme
    installFile $PWD/gitstatus.py               $ZSH_THEME_PATH/gitstatus.py
    installFile $PWD/disambiguate-keeplast      $ZSH_THEME_PATH/disambiguate-keeplast
    installFile $PWD/hubclone.sh                $ZSH_PLUGIN_PATH/hub
    cd $ZSH_PLUGIN_PATH
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone git://github.com/zsh-users/zaw.git
fi

echo "OK"
