set t_Co=256
colorscheme molokai
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" let g:hybrid_use_Xresources=1
" colorscheme hybrid
"colorscheme desert
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" set background=dark
" colorscheme solarized


set colorcolumn=80
autocmd FileType c,cpp      setlocal colorcolumn=81,100


" disable Background color erase
set t_ut=

set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

highlight ExtraWhitespace ctermbg=darkyellow
match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd BufWritePre * :%s/\s\+$//e
