set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

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

Plugin 'a.vim'

Plugin 'ShowMarks7'
let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

Plugin 'Align'
Plugin 'AutoAlign'

Plugin 'Tagbar'
map <leader>tt :TagbarToggle<CR>
let g:tagbar_left             = 1
let g:tagbar_autofocus        = 1
let g:tagbar_compact          = 1
"relative line number
let g:tagbar_show_linenumbers = 2
let g:tagbar_previewwin_pos   = "downright"
let g:tagbar_autopreview      = 1

Plugin 'Auto-Pairs'

Plugin 'UltiSnips'

Plugin 'honza/vim-snippets'
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

Plugin 'slimv.vim'
let g:lisp_rainbow=1
let g:scheme_builtin_swank=1
let g:slimv_ballon=1
" only add one enter to save sapce and decrease line
let g:paredit_electric_return=0

" if only use autopep8 as formatprg, also works.
" then below 3 lines could delete
Plugin 'liuyang1/vim-autopep8'
autocmd FileType python map <buffer> <Leader>cc     :call Autopep8()<cr>
let g:autopep8_disable_show_diff=1
au FileType python setlocal formatprg=autopep8\ -aa\ -

" TODO: make more test
" Plugin 'Chiel92/vim-autoformat'

call vundle#end()
filetype plugin indent on
