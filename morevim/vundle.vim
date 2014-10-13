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
let g:showmarks_hlline_upper=1
let g:showmarks_hlline_lower=1
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
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

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
let g:syntastic_python_python_exec = "/usr/bin/python2"
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

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
" when stop typing
let g:gitgutter_realtime = 1
" when switch buffer, tab, focus GUI
let g:gitgutter_eager = 1
let g:gitgutter_sign_column_always = 1
nmap ]a     <Plug>GitGutterStageHunk
nmap [a     <Plug>GitGutterStageHunk
nmap ]r     <Plug>GitGutterRevertHunk
nmap [r     <Plug>GitGutterRevertHunk
let g:gitgutter_highlight_lines = 0

" Plugin 'bling/vim-bufferline'

Plugin 'edkolev/tmuxline.vim'
let g:tmuxline_preset = {
      \'a'       : ['#(whoami)', '#h'],
      \'b'       : 'Ss:#S',
      \'c'       : '',
      \'win'     : ['#I#F#P', '#W'],
      \'cwin'    : ['#I#F#P', '#W'],
      \'x'       : '',
      \'y'       : '#(tmux-mem-cpu-load 1)',
      \'z'       : ['%R:%S', '%m-%d %a'],
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

" Plugin 'Python-mode-klen'
" let g:pymode_folding = 0

" Plugin 'The-NERD-Commenter'
" let NERDShutUp=1
Plugin 'tomtom/tcomment_vim'

" Plugin 'autoload_cscope.vim'
" Plugin 'cscope.vim'

Plugin 'Valloric/YouCompleteMe'
nnoremap <C-i>      :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu
autocmd InsertLeave *   if pumvisible()==0|pclose|endif
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>":"\<cr>"
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completeion=3
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1

Plugin 'ervandew/supertab'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:ycm_filetype_blacklist = {
      \ 'log' : 1,
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0

" Plugin 'EasyMotion'
Plugin 'Logcat-syntax-highlighter'

Plugin 'colorizer'

Plugin 'rainbow_parentheses.vim'
let g:rbpt_loadcmd_toggle=1
let g:rbpt_max=8
au VimEnter *   RainbowParenthesesToggle
au Syntax *     RainbowParenthesesLoadRound
au Syntax *     RainbowParenthesesLoadSquare
au Syntax *     RainbowParenthesesLoadBraces
call vundle#end()
filetype plugin indent on
