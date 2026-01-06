nnoremap \s     :source ~/.vimrc<cr>
nnoremap \e     :edit ~/.vimrc<cr>

nnoremap <Leader>q :wqa!<cr>
nnoremap \\        :update<cr>

nnoremap \i      :PlugInstall<cr>
" for test highlight statement
map \ht     :echo "hi<" . synIDattr(synID(line("."),col("."),1), "name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0), "name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)), "name") . ">"<CR>

" quick to sudo write
command! W w !sudo tee % > /dev/null
" quickly switch to current directory
command! Cdc cd %:p:h

" nnoremap <C-l> gt
" nnoremap <C-h> gT
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

function! HLtoggle()
    if (@/ == "\\<" . expand("<cword>") . "\\>")
        let @/ = ''
    else
        let @/ = "\\<" . expand("<cword>") . "\\>"
    endif
endfunc
nnoremap <silent> * :call HLtoggle()<cr>

" fix leak output to terminal
set shellpipe=&>
" search only in current file
nnoremap <Leader>aa :Ack <cword> "%:p"<cr>
" search in current path
nnoremap <Leader>ar :Ack <cword> <cr>

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>


" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

inoremap <C-U>      <C-G>u<C-U>
autocmd BufEnter *.c inoremap ;;      <end>;

command! Vrs        :vertical resize 90<cr>

" replace C-A as tmux using it
nmap \a      <C-A>

nnoremap Y y$

" visual select the block of added last time
nnoremap gV `[v`]

" vertial split, and scroll next page, then scrollbind
noremap <silent> <leader>sb :set norelativenumber<CR>:<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

nnoremap \y         "+y

nnoremap \ds        :!dos2unix %<cr><cr><cr>

"Copy file path
"nnoremap <silent> \cp :let @*=expand("%:p")<cr>:echo '-= File path copied=-'<cr>
"Copy file name
"nnoremap <silent> \cf :let @*=expand("%:t")<cr>:echo '-= File name copied=-'<cr>
" 1. Copy bookmark position reference
nnoremap <silent> \c  :let @0=expand("%:p").':'.line(".").':'.col(".")<cr>:echo '-= Cursor bookmark copied=-'<cr>
" 2. Paste bookmark position reference
nnoremap <silent> \p "0p
" 3. Jump to bookmark position
" gf

" vertically split window, and goto file path under cursor
nnoremap <silent> gf  :vsplit<CR>gF

"noremap <silent> <Leader>p :set paste<CR>
nnoremap <Leader>p :if &paste \| set nopaste \| echo "Paste mode OFF" \| else \| set paste \| echo "Paste mode ON" \| endif<CR>
autocmd InsertLeave * set nopaste
