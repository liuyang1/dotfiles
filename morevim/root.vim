" define Space key as mapleader, make shortcut so fast.
" but, NOT define it under imap
" it cause under insert mode, every time of stroke on Space key, have to wait
" timelen=1s.

" Known issues:
"   a.vim have some shortcut starts with Leader, cancel it all.
let g:mapleader = " "
" source ~/.vim/vundle.vim
source ~/.vim/plug.vim
" source ~/.vim/t.vim

source ~/.vim/option.vim
source ~/.vim/color.vim
source ~/.vim/abbr.vim
source ~/.vim/ft.vim
source ~/.vim/key.vim

" source ~/.vim/term.vim

let localcfg = expand("~/.vim/local.vim")
if filereadable(localcfg)
    execute "source ".localcfg
endif
