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

nnoremap <C-l> gt
nnoremap <C-h> gT

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
