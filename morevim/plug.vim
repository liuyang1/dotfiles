set nocompatible

filetype off
call plug#begin('~/.vim/bundle')
" Plug 'gmarik/Vundle.vim'

Plug 'vimwiki'
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,img'
let g:vimwiki_camel_case=0
let g:vimwiki_list=[{
    \ 'path': '$HOME/wiki',
    \ 'path_html': '$HOME/www',
    \ 'auto_export': 0,
    \ }]
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_menu=''
let g:vimwiki_CJK_length=1

Plug 'a.vim', { 'for': [ 'c', 'h', 'cpp' ] }

" Plug 'ShowMarks7'
" let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
" let g:showmarks_enable=1
" let g:showmarks_textlower=')'
" let g:showmarks_textupper='>'
" let g:showmarks_hlline_upper=1
" let g:showmarks_hlline_lower=1
" highlight ShowMarksHlu  ctermbg=red ctermfg=green

Plug 'kshenoy/vim-signature'
let g:SignatureMarkOrder = "\m»"
" let g:SignatureMarkOrder = "\m)"
let g:SignatureMarkLineHL = "'WarningMsg'"

Plug 'Align'
"Plug 'AutoAlign'

Plug 'Tagbar'
map <leader>tt :TagbarToggle<CR>
let g:tagbar_left             = 1
let g:tagbar_autofocus        = 1
let g:tagbar_compact          = 1
"relative line number
let g:tagbar_show_linenumbers = 2
let g:tagbar_previewwin_pos   = "downright"
" let g:tagbar_autopreview      = 1
let g:tagbar_sort             = 0
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

let g:tagbar_type_vimwiki = {
            \ 'ctagstype':'vimwiki'
            \ , 'kinds':['h:header']
            \ , 'sro':'&&&'
            \ , 'kind2scope':{'h':'header'}
            \ , 'scope2kind':{'header':'h'}
            \ , 'sort':0
            \ , 'ctagsbin':'python2'
            \ , 'ctagsargs': '~/.vim/vwtags.py default'
            \ }
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' :'python2',
    \ 'ctagsargs' : '~/.vim/markdown2ctags.py -f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

Plug 'Auto-Pairs'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Syntastic'
highlight SyntasticErrorLine    ctermbg=black
highlight SyntasticErrorSign    ctermbg=darkgray
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✘"
let g:syntastic_warning_symbol = "!"
" let g:syntastic_warning_symbol = "⚒"
" let g:syntastic_error_symbol = 'E'
" let g:syntastic_warning_symbol = 'w'
let g:syntastic_style_error_symbol   = 'S'
let g:syntastic_style_warning_symbol = 's'
let g:syntastic_enable_highlighting = 0
let g:syntastic_c_checkers = []
let g:syntastic_python_python_exec = "/usr/bin/python2"
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_c_check_header          = 1
let g:syntastic_c_remove_include_errors = 1

Plug 'kovisoft/slimv', { 'for': ['scheme', 'lisp'] }
" lisp_rainbow not works now under vim74
let g:lisp_rainbow=1
let g:scheme_builtin_swank=1
let g:slimv_ballon=1
" only add one enter to save sapce and decrease line
let g:paredit_electric_return=0
let g:paredit_short_maps=0

" if only use autopep8 as formatprg, also works.
" then below 3 lines could delete
Plug 'liuyang1/vim-autopep8'
autocmd FileType python map <buffer> <Leader>cc     :call Autopep8()<cr>
let g:autopep8_disable_show_diff=1
au FileType python setlocal formatprg=autopep8\ -aa\ -

" TODO: make more test
" Plug 'Chiel92/vim-autoformat'

" Plug 'minibufexpl.vim'
" nnoremap <Leader>bb     :TMiniBufExplorer<cr>
" let g:miniBufExplSplitBelow  = 0
Plug 'Shougo/unite.vim'

" ctrlp system
Plug 'kien/ctrlp.vim'
let g:ctrlp_cmd               = 'CtrlPMRUFiles'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.git|\.hg|\.svn|out)$',
            \ 'file': '\v\.(exe|so|ddl)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
" noremap     <Leader>f           :CtrlPMRUFiles<cr>
" noremap     <Leader>ff          :CtrlPMRUFiles<cr>
nnoremap     <Leader>f          :CtrlPFunky<cr>
" nnoremap     <Leader>b :buffers<cr>:buffer<Space>
nnoremap     <Leader>b          :CtrlPBuffer<cr>
Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_extesions = ['funky', 'tag']
let g:ctrlp_funky_matchtype = 'path'
" let g:ctrlp_funky_syntax_highlight = 1
Plug 'JazzCore/ctrlp-cmatcher'
if filereadable(expand('~/.vim/bundle/ctrlp-cmatcher/autoload/fuzzycomt.so'))
  let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
else
  echohl WarningMsg | echom 'You need to compile the CtrlP C matching extension.' | echohl None
endif
" Plug 'FelikZ/ctrlp-py-matcher'
" let g:ctrlp_match_func = { 'match' : 'pymatcher#PyMatch' }
" Plug 'ompugao/ctrlp-z'


" airline need this to display branch
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gb         :Gblame<cr>
nnoremap <Leader>gd         :Gdiff<cr>
" for vim74 compat
set diffopt+=vertical
" let g:gitgutter_sign_added = '✚'
" let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_modified = '±'
" let g:gitgutter_sign_modified_removed = '±✖'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '±-'

" show git diff mode
Plug 'airblade/vim-gitgutter'
" when stop typing
let g:gitgutter_realtime = 0
" when switch buffer, tab, focus GUI
let g:gitgutter_eager = 1
let g:gitgutter_sign_column_always = 1
nmap ]a     <Plug>GitGutterStageHunk
nmap [a     <Plug>GitGutterStageHunk
nmap ]r     <Plug>GitGutterRevertHunk
nmap [r     <Plug>GitGutterRevertHunk
nmap ]s     <Plug>GitGutterPreviewHunk
nmap [s     <Plug>GitGutterPreviewHunk
let g:gitgutter_highlight_lines = 0

" Plug 'bling/vim-bufferline'

" Plug 'edkolev/tmuxline.vim'
" let g:tmuxline_preset = {
"       \'a'       : ['#(whoami)', '#h'],
"       \'b'       : 'Ss:#S',
"       \'c'       : '',
"       \'win'     : ['#I#F#P', '#W'],
"       \'cwin'    : ['#I#F#P', '#W'],
"       \'x'       : '',
"       \'y'       : '%R:%S',
"       \'z'       : ['%m-%d', '%a'],
"       \'options' : {'status-justify' : 'centre'}}
" let g:tmuxline_powerline_separators = 1
" status-justify: left, centre, right
      " \'y'       : '#(tmux-mem-cpu-load 1)',
" let g:tmuxline_separators = {
"       \ 'left' : '',
"       \ 'left_alt': '>',
"       \ 'right' : '',
"       \ 'right_alt' : '<',
"       \ 'space' : ' '}

Plug 'bling/vim-airline'
let g:airline_theme             = 'powerlineish'
" let g:airline_theme             = 'hybrid'
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Br'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_warning = ''
let g:airline_powerline_fonts   = 1

Plug 'mkitt/tabline.vim'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" vim-powerline symbols
" let g:airline_left_sep          = '>'
" let g:airline_left_alt_sep      = '>'
" let g:airline_right_sep         = '<'
" let g:airline_right_alt_sep     = '<'
" let g:airline_branch_prefix     = 'Br'
" let g:airline_readonly_symbol   = 'Lk'
" let g:airline_linecolumn_prefix = 'L/n'

" Plug 'Python-mode-klen', { 'for': ['python'] }
let g:pymode_folding = 0
" Plug 'davidhalter/jedi-vim'

" Plug 'The-NERD-Commenter'
" let NERDShutUp=1
Plug 'tomtom/tcomment_vim'
let g:tcomment_types={'c': '// %s'}
" no reason to switch, not faster
" Plug 'tpope/vim-commentary'

" Plug 'autoload_cscope.vim'
" Plug 'cscope.vim'

Plug 'Valloric/YouCompleteMe'
", { 'for': ['c', 'cpp', 'python']},
nnoremap <C-i>      :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu
autocmd InsertLeave *   if pumvisible()==0|pclose|endif
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>":"\<cr>"
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completeion=3
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=0
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1

Plug 'ervandew/supertab'

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

let g:ycm_filetype_whitelist= {
      \ 'c' : 1
      \ , 'h' : 1
      \ , 'cpp' : 1
      \}
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

" Plug 'EasyMotion'
Plug 'Logcat-syntax-highlighter'

" will make vim slow
" Plug 'colorizer'
Plug 'guns/xterm-color-table.vim'

" Plug 'rainbow_parentheses.vim'
" let g:rbpt_loadcmd_toggle=1
" let g:rbpt_max=8
" " au VimEnter *     RainbowParenthesesToggle
" nnoremap <Leader>sr :RainbowParenthesesToggle<cr>
" nnoremap <Leader>ss :RainbowParenthesesToggleAll<cr>
" " au VimEnter *     RainbowParenthesesLoadRound
" au Syntax *     RainbowParenthesesLoadSquare
" au Syntax *     RainbowParenthesesLoadBraces
" au Syntax *     RainbowParenthesesLoadChevrons
Plug 'luochen1990/rainbow', { 'for': ['c','cpp', 'h', 'scheme', 'python']}
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plug 'mileszs/ack.vim'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
          \ --ignore .git
          \ --ignore .svn
          \ --ignore .hg
          \ --ignore .DS_Store
          \ --ignore "**/*.pyc"
          \ -g ""'
    " let g:ackprg = 'ag --nogroup --nocolor --column'
endif

Plug 'dyng/ctrlsf.vim'
nmap \ff    <Plug>CtrlSFCwordExec
nmap \fw    :CtrlSFOpen<cr>
" Plug 'jceb/vim-orgmode'

Plug 'benmills/vimux'
map <silent> <Leader><Leader> :update<cr>:call VimuxRunCommand("rspec " . expand("%:p"))<CR>
map <Leader>vc :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" Plug 'regedarek/ZoomWin'
" Plug '907th/vim-auto-save'
" let g:auto_save=1
" let g:auto_save_no_updatetime=1
" let g:auto_save_in_insert_mode=0
" Plug 'w0ng/vim-hybrid'
" Plug 'mhinz/vim-startify'
" Plug 'trapd00r/neverland-vim-theme'
" Plug 'nanotech/jellybeans.vim'
Plug 'cypok/vim-sml', { 'for': ['sml'] }

" Plug 'Yggdroot/indentLine'
" let g:indentLine_color_term=236
" | ¦ ┆ │
" let g:indentLine_char='│'

" Plug 'vim-voom/VOoM'
" autocmd Filetype vimwiki nnoremap <Leader>tt :Voom vimwiki<cr>
" slow but good enough
Plug 'Mark--Karkat'
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 0

" Plug 'SyntaxRange'
Plug 'ehamberg/vim-cute-python', { 'for': ['python'] }
" Plug 'dkinzer/vim-schemer'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 1

Plug 'maksimr/vim-jsbeautify', { 'for': ['javascript', 'html'] }
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 4
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_auto_colors = 0
Plug 'Shougo/vimproc.vim', { 'do': 'make'  }
nnoremap <Leader>x      :VimProcBang
Plug 'Shougo/vimshell.vim'
Plug 'junegunn/goyo.vim'
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
" let g:goyo_linenr = 1
nnoremap \g         :Goyo<cr>
Plug 'junegunn/limelight.vim'
" autocmd User GoyoEnter Limelight
" autocmd User GoyoLeave Limelight!
" Plug 'ivalkeen/vim-ctrlp-tjump'
" Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_authorName="liuyang1<liuyang1@ustc.edu.cn>"
" let g:DoxygenToolkit_licenseTag="My own license" <-- !!! Does not end with "\<enter>"
let g:load_doxygen_syntax=1
" Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled=1
Plug 'Rykka/easydigraph.vim'
Plug 'gregsexton/gitv'
Plug 'utl.vim'
" Plug 'waylan/vim-markdown-extra-preview'
" Plug 'enomsg/vim-haskellConcealPlus', {'for': ['haskell']}
let hscoptions="T"
Plug 'lukerandall/haskellmode-vim', {'for': ['haskell']}
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/chromium"
let g:haddock_browser_nosilent = 1
Plug 'raichoo/haskell-vim'
call plug#end()
