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
ZSH_THEME_PATH=$ZSH/theme
ZSH_PLUGIN_PATH=$ZSH/custom/plugins
if [[ ! -d $ZSH ]];
then
    echo "oh my zsh theme not in defualt path! setting it yourself"
else
    installFile $PWD/myagnoster.zsh-theme       $PREFIX/.oh-my-zsh/themes/myagnoster.zsh-theme
    cd $ZSH_PLUGIN_PATH
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi

echo "OK"
