set t_Co=256

if has('termguicolors')
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
    " let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    " let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
    " set t_8f="[38:2:%lu:%lu:%lum"
    " set t_8b="[48:2:%lu:%lu:%lum"
    set termguicolors
endif

let scm="molokai"

if scm == "molokai"
    let g:rehash256 = 1
    colorscheme molokai
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
elseif scm == "srcery"
    colorscheme srcery
else " make default to desert
    colorscheme desert
endif

" for Signature, mark line
highlight SignLineHL      ctermbg=239
" highlight SignLineHL      ctermfg=235 ctermbg=107

set colorcolumn=80
autocmd FileType c,cpp      setlocal colorcolumn=80,100


" disable Background color erase
set t_ut=

set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" highlight ExtraWhitespace guibg=black
" match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd BufWritePre * :%s/\s\+$//e

highlight hsNiceSpecial ctermfg=darkyellow

" add blink when search next
" XXX: vim is single thread, so this blink will block vim, make sure not
" setting so long time for blink. only set 0.1 seconds.
highlight WhiteOnRed ctermfg=white ctermbg=red guifg=white guibg=red
function! HLNext(blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'), col - 1), @/))
    let target_pat = '\c\%#' . @/
    let blinks = 1
    for n in range(1, blinks)
        let red = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(red)
        redraw
        if n != blinks
            exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        endif
    endfor
endfunction

nnoremap <silent> n     n:call HLNext(0.1)<cr>
nnoremap <silent> N     N:call HLNext(0.1)<cr>

highlight SyntasticErrorSign    guifg=darkred
highlight SyntasticWarningSign  guifg=darkgreen

" update vimwiki to lightblue color
" highlight VimwikiTodo term=reverse cterm=bold ctermfg=32
highlight VimwikiTodo guifg=#6195B4 cterm=bold

highlight Tag ctermfg=165 cterm=bold guifg=#AF1642
