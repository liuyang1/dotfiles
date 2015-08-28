set t_Co=256

let scm="molokai"

if scm == "molokai"
    let g:rehash256 = 1
    colorscheme molokai
    highlight CursorLineNr cterm=bold ctermfg=red ctermbg=236
    highlight LineNr ctermfg=246 ctermbg=236
    highlight SignColumn ctermbg=235
    highlight Comment ctermfg=246
elseif scm == "solarized_light"
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    set background=light
    colorscheme solarized
    highlight CursorLine ctermbg=255
    highlight ColorColumn ctermbg=254
    highlight LineNr ctermfg=250 ctermbg=255
    highlight SignColumn ctermbg=250
    highlight Normal ctermfg=14
    highlight Comment ctermfg=181
endif

set colorcolumn=80
autocmd FileType c,cpp      setlocal colorcolumn=80,100


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
