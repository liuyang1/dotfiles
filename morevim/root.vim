source ~/.vim/vundle.vim

source ~/.vim/option.vim
source ~/.vim/color.vim
source ~/.vim/abbr.vim
source ~/.vim/ft.vim
source ~/.vim/key.vim

let localcfg = expand("~/.vim/local.vim")
if filereadable(localcfg)
    execute "source ".localcfg
endif
