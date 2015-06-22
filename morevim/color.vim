set t_Co=256
colorscheme molokai
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" let g:hybrid_use_Xresources=1
" colorscheme hybrid
"colorscheme desert

" " for solarized light
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized
" set background=light
" highlight CursorLine ctermbg=230
" highlight ColorColumn ctermbg=253
highlight CursorLineNr cterm=bold ctermfg=red ctermbg=236
highlight LineNr ctermfg=246 ctermbg=236
highlight SignColumn ctermbg=235
" highlight LineNr ctermbg=230


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

highlight hsNiceSpecial ctermfg=darkyellow
highlight Comment ctermfg=246
