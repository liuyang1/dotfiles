"colorscheme morning
set t_Co=256
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_visibility="high"
let g:solarized_contrast="high"

set background=dark
colorscheme solarized

Bundle 'molokai'
"colorscheme molokai
" highlight ColorColumn ctermbg=0

Bundle 'Lucius'
"colorscheme lucius

highlight Comment           cterm=italic
highlight Statement         cterm=italic
" for listchars
highlight SpecialKey        cterm=none ctermfg=gray

highlight VimwikiHeader1    ctermfg=darkred
highlight VimwikiHeader2    ctermfg=yellow
highlight VimwikiHeader3    ctermfg=green
highlight VimwikiHeader4    ctermfg=red
highlight VimwikiLInk       ctermfg=darkblue

highlight cType             ctermfg=darkblue    cterm=italic

highlight Function          ctermfg=darkblue
highlight Identifier        ctermfg=green

highlight SpellBad          cterm=italic ctermfg=darkred
