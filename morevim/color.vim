set t_Co=256
colorscheme molokai
" let g:hybrid_use_Xresources=1
" colorscheme hybrid
"colorscheme desert
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" set background=light
" colorscheme solarized


autocmd FileType c,cpp      setlocal colorcolumn=81,100
autocmd FileType vimwiki    setlocal colorcolumn=80


highlight VimwikiHeader1 ctermfg=red
highlight VimwikiHeader2 ctermfg=yellow
highlight VimwikiHeader3 ctermfg=green
highlight VimwikiHeader4 ctermfg=red
highlight VimwikiLink ctermfg=blue

highlight Function ctermfg=lightblue
highlight ColorColumn ctermbg=232
" highlight SignColumn ctermbg=232
highlight cType     ctermfg=yellow cterm=None
highlight Identifier ctermfg=darkyellow
" highlight SpellBad cterm=bold ctermfg=darkred cterm=reverse
" highlight Conditional cterm=bold ctermfg=darkred
" highlight Statement ctermfg=208 cterm=italic
highlight Statement cterm=italic term=italic
" highlight CursorLine ctermbg=235
" highlight Comment ctermfg=246
" for listchars
" highlight SpecialKey cterm=none ctermfg=gray
highlight cUserLabel cterm=italic ctermfg=229
highlight CursorLineNr cterm=bold ctermfg=red

" disable Background color erase
set t_ut=

set guifont=Monaco\ 12
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" highlight ExtraWhitespace ctermbg=yellow
" match ExtraWhitespace /\s\+\%#\@<!$/
