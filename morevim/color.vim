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


highlight VimwikiHeader1 ctermfg=darkred cterm=bold
highlight VimwikiHeader2 ctermfg=yellow cterm=bold
highlight VimwikiHeader3 ctermfg=green cterm=bold
highlight VimwikiHeader4 ctermfg=red
highlight VimwikiLink ctermfg=blue
highlight VimwikiList ctermfg=darkgreen cterm=bold
highlight VimwikiBold ctermfg=darkred cterm=bold
highlight VimwikiItalic ctermfg=yellow cterm=italic
highlight VimwikiCode ctermbg=235 ctermfg=darkblue
highlight VimwikiPre ctermbg=232 ctermfg=darkgreen

highlight Function ctermfg=lightblue
highlight ColorColumn ctermbg=232 guibg=#101010
highlight Normal guifg=#D8D8D2
" highlight SignColumn ctermbg=232
highlight cType     ctermfg=yellow cterm=None
highlight Identifier ctermfg=darkyellow
" highlight SpellBad cterm=bold ctermfg=darkred cterm=reverse
" highlight Conditional cterm=bold ctermfg=darkred
" highlight Statement ctermfg=208 cterm=italic
highlight Statement cterm=italic ctermfg=darkred
" highlight Comment ctermfg=246
" for listchars
" highlight SpecialKey cterm=none ctermfg=gray
highlight CursorLine ctermbg=235
highlight cUserLabel cterm=italic,underline ctermfg=229
highlight CursorLineNr cterm=bold ctermfg=red
highlight LineNr ctermfg=246

" disable Background color erase
" set t_ut=

set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" highlight ExtraWhitespace ctermbg=yellow
" match ExtraWhitespace /\s\+\%#\@<!$/
