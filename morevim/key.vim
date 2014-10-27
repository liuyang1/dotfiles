nnoremap ,s     :source ~/.vimrc<cr>
nnoremap ,e     :edit ~/.vimrc<cr>

inoremap <A-b>  <C-o>b
inoremap <A-w>  <C-o>w
inoremap <A-h>  <C-o>h
inoremap <A-j>  <C-o>j
inoremap <A-k>  <C-o>k
inoremap <A-l>  <C-o>l

" for test highlight statement
map <Leader>ht :echo "hi<" . synIDattr(synID(line("."),col("."),1), "name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0), "name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)), "name") . ">"<CR>

" quick to sudo write
cmap w!! w! sudo tee % > /dev/null

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

nnoremap <Leader>aa :Ack <cword> %<cr>

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>

nnoremap <Leader>b :buffers<cr>:buffer<Space>

nnoremap <Leader>q :wqa!<cr>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
