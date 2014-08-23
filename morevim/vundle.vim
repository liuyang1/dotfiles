set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Vundle.vim'

Plugin 'vimwiki'
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,img'
let g:vimwiki_camel_case=0
let g:vimwiki_list=[{
    \ 'path': '/home/liuyang/wiki',
    \ 'path_html': '/home/liuyang/wiki/html',
    \ 'auto_export': 1,
    \ }]
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_menu=''
let g:vimwiki_CJK_length=1

Plugin 'Tagbar'
let g:tagbar_usearrows = 1
let g:tagbar_left = 1
nnoremap <leader>t :TagbarToggle<CR>

Plugin 'a.vim'

Plugin 'ShowMarks7'
let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

Plugin 'Align'

Plugin 'Auto-Pairs'

filetype off
Plugin 'UltiSnips'

Plugin 'vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plugin 'Syntastic'
highlight SyntasticErrorLine    ctermbg=black
highlight SyntasticErrorSign    ctermbg=darkgray
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_enable_highlighting = 0

call vundle#end()
