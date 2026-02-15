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

let ytheme = $YTHEME
if ytheme == "dark"
    " let scm="molokai"
    " let scm="borland"
    let scm="dracula"
    "let scm="sonokai"
    "let scm="catppuccin"
elseif ytheme == "light"
    let scm="paper"
else
    " by default
    let scm="molokai"
endif

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
elseif scm == "paper"
    set background=light
    colorscheme PaperColor
elseif scm == "borland"
    let g:BorlandStyle="morden"
    let g:BorlandParen=1
    colorscheme borland

    " 改进拼写错误的背景颜色，默认为9，淡粉色，对比度太低了
    highlight SpellBad  term=reverse ctermbg=88 gui=undercurl guisp=Red

    " 设置行号区域背景色
    highlight LineNr ctermbg=63 guibg=#303030
    highlight SignColumn ctermbg=63 guibg=#404040

    " 设置正文区域背景色
    " highlight Normal ctermbg=234 guibg=#1c1c1c
elseif scm == "dracula"
    colorscheme dracula
    " TODO
elseif scm == "sonokai"
    colorscheme sonokai
    " for vim-illuminated word
    " highlight CurrentWord guibg=#363944 (default)
    highlight CurrentWord guibg=#505060
elseif scm == "catppuccin"
    colorscheme catppuccin_mocha
    " 改进SpellBad和Cursorline同时enable的，难以分辨问题
    hi CursorLine cterm=bold gui=bold ctermbg=233 guibg=#121212
else " make default to desert
    colorscheme desert
endif

" for Signature, mark line
highlight SignLineHL      ctermbg=239
" highlight SignLineHL      ctermfg=235 ctermbg=107

set colorcolumn=80
autocmd FileType c,cpp      setlocal colorcolumn=80,100
autocmd FileType java       setlocal colorcolumn=100


" disable Background color erase
set t_ut=

" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
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

" highlight Tag ctermfg=165 cterm=bold guifg=#AF1642
" highlight Tag guibg=#AF1642 guifg=#000000
highlight VimwikiFixme ctermfg=green
" match VimwikiFixme /\(>>>\|<<<\)/
" match VimwikiFixme /^\(>>>\|<<<\).*/
match VimwikiFixme /.*\(>>>\|<<<\).*/

" 日志文件语法高亮配置
au BufNewFile,BufRead *.log setlocal syntax=logs

" 定义日志文件的语法高亮
augroup logs_syntax
  autocmd!
  " 定义高亮组
  highlight LogError ctermbg=red ctermfg=white gui=bold
  highlight LogWarning ctermbg=yellow ctermfg=black gui=bold
  highlight LogDebug ctermbg=cyan ctermfg=black gui=bold
  highlight LogFail ctermbg=magenta ctermfg=white gui=bold

  " 全局匹配并高亮显示以下单词，不区分大小写
  syntax match LogError /\c\%(error\|except\|exception\|fatal\)/
  syntax match LogWarning /\c\%(warning\|warn\|err\)/
  syntax match LogDebug /\cDEBUG/
  syntax match LogDebug /\cinvalid/
  syntax match LogDebug /\cnull/
  syntax match LogDebug /\cunknown/
  syntax match LogFail /\cfail/
augroup END
