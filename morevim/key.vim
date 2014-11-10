nnoremap ,s     :source ~/.vimrc<cr>
nnoremap ,e     :edit ~/.vimrc<cr>

" for test highlight statement
map <Leader>ht :echo "hi<" . synIDattr(synID(line("."),col("."),1), "name") . '> trans<'
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
    if (@/ == '')
        let @/ = "\\<" . expand("<cword>") . "\\>"
    else
        if (@/ == "\\<" . expand("<cword>") . "\\>")
            let @/ = ''
        else
            let @/ = "\\<" . expand("<cword>") . "\\>"
        endif
    endif
endfunc
nnoremap <silent> * :call HLtoggle()<cr>

" fix leak output to terminal
set shellpipe=&>
nnoremap <Leader>aa :Ack <cword> %<cr>

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>

nnoremap <Leader>b :buffers<cr>:buffer<Space>

nnoremap <Leader>q :wqa!<cr>
nnoremap ,,        :update<cr>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

autocmd FileType c,cpp nmap <Leader>d   <C-w>}
autocmd FileType c,cpp nmap <Enter>     <C-w>}
autocmd FileType log,logcat   nmap <Enter>     <Leader>aa<C-w><C-w>

inoremap <C-U>      <C-G>u<C-U>
