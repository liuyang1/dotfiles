updateVundle(){
    echo "update bundle of plugins"
    cd ~/.vim/bundle
    if [ ! -d "Vundle.vim" ]; then
        echo "check Vundle first"
        git clone https://github.com/gmarik/Vundle.vim.git
    fi

    vim +PluginInstall +qall
    echo "update all plugin OK"
}

updateVundle

addPatch() {
    tput setaf 1
    echo add patch $1 $2
    tput setaf 7
    cd bundle/$1
    patch -N -p1 --reject-file=- < ../../patch/$2
    cd -
    echo ok
}

addPatch Align Align.patch
addPatch slimv.vim slimv.patch

addGitPatch() {
    tput setaf 1
    echo add git patch $1 $2
    tput setaf 7
    cd bundle $1
    git am ../../patch/$2
    cd -
    echo ok
}

addPatch ShowMarks7 0001-showmarks7-my-color.patch
addPatch vim-snippets 0001-add-args-for-va_list-and-more-tight-code.patch
addPatch Tagbar 0001-tagbar-to-zt.patch
echo "all patch"
