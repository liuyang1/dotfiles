set t_Co=256
colorscheme molokai
"colorscheme desert
" let g:solarized_contrast=high
" let g:solarized_visibility=high

highlight Function ctermfg=lightblue
highlight ColorColumn ctermbg=black
autocmd FileType c,cpp  setlocal colorcolumn=81,100


highlight VimwikiHeader1 ctermfg=red
highlight VimwikiHeader2 ctermfg=yellow
highlight VimwikiHeader3 ctermfg=green
highlight VimwikiHeader4 ctermfg=red
highlight VimwikiLink ctermfg=blue

highlight cType     ctermfg=yellow cterm=None
highlight Function   ctermfg=lightblue
highlight Identifier ctermfg=darkyellow
highlight SpellBad   cterm=italic       ctermfg=darkred

highlight Conditional cterm=italic ctermfg=darkred
highlight Statement cterm=italic ctermfg=red
" for listchars
highlight SpecialKey cterm=none ctermfg=gray

" disable Background color erase
set t_ut=
