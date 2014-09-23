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
let g:showmarks_enable=1
let g:showmarks_textlower=')'
let g:showmarks_textupper='>'
highlight ShowMarksHlu  ctermbg=red ctermfg=green

Plugin 'Align'
"Plugin 'AutoAlign'

Plugin 'Tagbar'
map <leader>tt :TagbarToggle<CR>
let g:tagbar_left             = 1
let g:tagbar_autofocus        = 1
let g:tagbar_compact          = 1
"relative line number
let g:tagbar_show_linenumbers = 2
let g:tagbar_previewwin_pos   = "downright"
let g:tagbar_autopreview      = 1

let g:tagbar_type_vimwiki = {
            \ 'ctagstype':'vimwiki'
            \ , 'kinds':['h:header']
            \ , 'sro':'&&&'
            \ , 'kind2scope':{'h':'header'}
            \ , 'sort':0
            \ , 'ctagsbin':'~/.vim/vwtags.py'
            \ , 'ctagsargs': 'default'
            \ }

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
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = 'w'
let g:syntastic_style_error_symbol   = 'S'
let g:syntastic_style_warning_symbol = 's'
let g:syntastic_enable_highlighting = 0
let g:syntastic_c_checkers = ['gcc']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_loc_list_height = 5

let g:syntastic_c_check_header          = 1
let g:syntastic_c_remove_include_errors = 1

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

" Plugin 'minibufexpl.vim'
" nnoremap <Leader>bb     :TMiniBufExplorer<cr>
" let g:miniBufExplSplitBelow  = 0
Plugin 'ctrlp.vim'
nnoremap <Leader>b      :CtrlPMRUFiles<cr>
let g:ctrlp_cmd               = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'a'
noremap     ,f          :CtrlPMRUFiles<cr>

" airline need this to display branch
Plugin 'tpope/vim-fugitive'

" show git diff mode
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1

" Plugin 'bling/vim-bufferline'

Plugin 'edkolev/tmuxline.vim'
let g:tmuxline_preset = {
      \'a'       : ['#(whoami)', '#h'],
      \'b'       : 'Ss:#S',
      \'c'       : '',
      \'win'     : ['#I#F', '#W'],
      \'cwin'    : ['#I#F', '#W'],
      \'x'       : '',
      \'y'       : '',
      \'z'       : ['%R', '%m-%d %a'],
      \'options' : {'status-justify' : 'left'}}
let g:tmuxline_powerline_separators = 1
" let g:tmuxline_separators = {
"       \ 'left' : '',
"       \ 'left_alt': '>',
"       \ 'right' : '',
"       \ 'right_alt' : '<',
"       \ 'space' : ' '}

Plugin 'bling/vim-airline'
let g:airline_theme             = 'powerlineish'
let g:airline_enable_syntastic  = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '[]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0

let g:airline_powerline_fonts   = 1
" vim-powerline symbols
" let g:airline_left_sep          = '>'
" let g:airline_left_alt_sep      = '>'
" let g:airline_right_sep         = '<'
" let g:airline_right_alt_sep     = '<'
" let g:airline_branch_prefix     = 'Br'
" let g:airline_readonly_symbol   = 'Lk'
" let g:airline_linecolumn_prefix = 'L/n'

Plugin 'Python-mode-klen'
call vundle#end()
filetype plugin indent on
