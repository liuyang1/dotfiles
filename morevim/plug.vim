set nocompatible

filetype off
call plug#begin('~/.vim/bundle')

""" App in vim
" Plug 'vim-scripts/vimwiki'
" { 'for': ['wiki'] }
nnoremap \d     :VimwikiToggleListItem<cr>
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

" Plug 'jceb/vim-orgmode', { 'for': [ 'org' ] }

""" writing room
" Plug 'junegunn/goyo.vim'
" let g:goyo_margin_top = 0
" let g:goyo_margin_bottom = 0
" let g:goyo_linenr = 1
" nnoremap \g         :Goyo<cr>

" Plug 'junegunn/limelight.vim'
" autocmd User GoyoEnter Limelight
" autocmd User GoyoLeave Limelight!

" Plug 'itchyny/calendar.vim'
let g:calendar_frame = 'default'
let g:calendar_task = 1
""" App in vim END

""" VCS git extension
" airline need this to display branch
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gb         :Git blame<cr>
nnoremap <Leader>gd         :Git diff<cr>
""" use d[N]o, d[N]p to obtain/put change
""" N means the buffer id, in general, the HEAD is 2th buffer
" for vim74 compat
set diffopt+=vertical
let gitgutter_style="colorful"
if gitgutter_style == "colorful"
    let g:gitgutter_sign_added = '∙'
    let g:gitgutter_sign_removed = '∙'
    let g:gitgutter_sign_modified = '∙'
    let g:gitgutter_sign_modified_removed = '∙∙'
elseif gitgutter_style == "fancy"
    let g:gitgutter_sign_added = '✚'
    let g:gitgutter_sign_removed = '✖'
    let g:gitgutter_sign_modified = '±'
    let g:gitgutter_sign_modified_removed = '±✖'
elseif gitgutter_style == "simple"
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_removed = '-'
    let g:gitgutter_sign_modified_removed = '±-'
endif
let g:gitgutter_sign_removed_first_line = '\'
" ignore whitespace
" let g:gitgutter_diff_args = '-w'
let g:gitgutter_override_sign_column_highlight = 0
" It auto run background, not need shortcut key defenition.
" nnoremap <Leader>gg         :GitGutter<cr>

" show git diff mode
Plug 'airblade/vim-gitgutter'
set signcolumn=yes
nmap ga     <Plug>(GitGutterStageHunk)
nmap gr     <Plug>(GitGutterUndoHunk)
nmap gs     <Plug>(GitGutterPreviewHunk)
nmap gn     <Plug>(GitGutterNextHunk)
nmap gp     <Plug>(GitGutterPrevHunk)
set updatetime=100

" signify missing one key feature:
" stage/undo hunk, so we cannot use it.
" Plug 'mhinz/vim-signify'
" let g:signify_vcs_list = [ 'git' ]
" let g:signify_realtime = 1
" let g:signify_sign_delete            = '-'
" let g:signify_sign_change            = '±'
" nmap gn <plug>(signify-next-hunk)
" nmap gp <plug>(signify-prev-hunk)

" Plug 'gregsexton/gitv'
""" VCS extension END

""" tmux extension
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

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

Plug 'benmills/vimux'
map <silent> <Leader><Leader> :update<cr>:call VimuxRunCommand("rspec " . expand("%:p"))<CR>
map <Leader>vc :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
""" tmux extension END

""" mark extension plugin
" Plug 'ShowMarks7'
" let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
" let g:showmarks_enable=1
" let g:showmarks_textlower=')'
" let g:showmarks_textupper='>'
" let g:showmarks_hlline_upper=1
" let g:showmarks_hlline_lower=1
" highlight ShowMarksHlu  ctermbg=red ctermfg=green

" BUGGY: had block vim startup, but now this problem is gone
Plug 'kshenoy/vim-signature'
" Plugin to toggle, display and navigate marks
let g:SignatureMarkOrder = "\m⚑"
" let g:SignatureMarkOrder = "\m»"
" let g:SignatureMarkOrder = "\m)"
" let g:SignatureMarkLineHL = "'WarningMsg'"
let g:SignatureMarkLineHL = "'SignLineHL'"
let g:SignatureMarkerLineHL = "'SignLineHL'"
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

" mark 1238 plugin, stop maintain
" mark 2666, this same with Mark-Karkat
" Plug 'Yggdroot/vim-mark' " clone Mark-Karkat, and continue, buggy
" Plug 'vim-scripts/Mark--Karkat'
" mark word, like highlight search, but mark word with highlight
" SLOW but good enough
" KEYMAP
" <Leader>m  mark current word
" COMMAND
" :Mark
" :MarkClear
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
" this is not work, load and save mark
let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 1

" Plug 'MattesGroeger/vim-bookmarks'
""" END

""" Tag related
""" generate tag for text file
" Plug 'vim-voom/VOoM'
" autocmd Filetype vimwiki nnoremap <Leader>tt :Voom vimwiki<cr>

Plug 'vim-scripts/gtags.vim'
map <C-]> :GtagsCursor<CR>
" Plug 'autoload_cscope.vim'
" Plug 'cscope.vim'

" tagbar is outdated, switch to 
" Plug 'vim-scripts/Tagbar'
" map <leader>tt :TagbarToggle<CR>
" let g:tagbar_left             = 1
" let g:tagbar_autofocus        = 1
" let g:tagbar_compact          = 1
" let g:tagbar_width            = 40
" "relative line number
" let g:tagbar_show_linenumbers = 2
" let g:tagbar_previewwin_pos   = "downright"
" " let g:tagbar_autopreview      = 1
" let g:tagbar_sort             = 0
" autocmd FileType tagbar setlocal nocursorline nocursorcolumn
" 
" let g:tagbar_type_vimwiki = {
"             \ 'ctagstype':'vimwiki'
"             \ , 'kinds':['h:header']
"             \ , 'sro':'&&&'
"             \ , 'kind2scope':{'h':'header'}
"             \ , 'scope2kind':{'header':'h'}
"             \ , 'sort':0
"             \ , 'ctagsbin':'python2'
"             \ , 'ctagsargs': '~/.vim/vwtags.py default'
"             \ }
" let g:tagbar_type_markdown = {
"     \ 'ctagstype': 'markdown',
"     \ 'ctagsbin' :'python2',
"     \ 'ctagsargs' : '~/.vim/markdown2ctags.py -f - --sort=yes',
"     \ 'kinds' : [
"         \ 's:sections',
"         \ 'i:images'
"     \ ],
"     \ 'sro' : '|',
"     \ 'kind2scope' : {
"         \ 's' : 'section',
"     \ },
"     \ 'sort': 0,
" \ }
" let g:tagbar_type_make = {
"             \ 'kinds':[
"                 \ 'm:macros',
"                 \ 't:targets'
"             \ ]
"         \ }
" 
" let g:tagbar_type_haskell = {
"     \ 'ctagsbin'  : 'hasktags',
"     \ 'ctagsargs' : '-x -c -o-',
"     \ 'kinds'     : [
"         \  'm:modules:0:1',
"         \  'd:data: 0:1',
"         \  'd_gadt: data gadt:0:1',
"         \  't:type names:0:1',
"         \  'nt:new types:0:1',
"         \  'c:classes:0:1',
"         \  'cons:constructors:1:1',
"         \  'c_gadt:constructor gadt:1:1',
"         \  'c_a:constructor accessors:1:1',
"         \  'ft:function types:1:1',
"         \  'fi:function implementations:0:1',
"         \  'o:others:0:1'
"     \ ],
"     \ 'sro'        : '.',
"     \ 'kind2scope' : {
"         \ 'm' : 'module',
"         \ 'c' : 'class',
"         \ 'd' : 'data',
"         \ 't' : 'type'
"     \ },
"     \ 'scope2kind' : {
"         \ 'module' : 'm',
"         \ 'class'  : 'c',
"         \ 'data'   : 'd',
"         \ 'type'   : 't'
"     \ }
" \ }
" 
" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"         \ 'h:Heading_L1',
"         \ 'i:Heading_L2',
"         \ 'k:Heading_L3'
"     \ ]
" \ }
""" tag related END

""" snippet
" Load on nothing
" Plug 'SirVer/ultisnips', { 'on': [] }
" Plug 'honza/vim-snippets' ", { 'on': [] }

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsListSnippets="<C-i>"

function! USload()
    let l:curpos = getcurpos()
    execute plug#load('ultisnips')
    " load ultisnips make cursor return to header
    " this return previous cusor
    call cursor(l:curpos[1], l:curpos[2])
endfunction

command! USload call USload()
nnoremap cus    :USload<cr>
""" snippet END

""" colorscheme
" Plug 'chriskempson/base16-vim'
" colorscheme base16-monokai
" Plug 'trapd00r/neverland-vim-theme'
" Plug 'w0ng/vim-hybrid'
" Plug 'nanotech/jellybeans.vim'
" Plug 'endel/vim-github-colorscheme'
" Plug 'jacoborus/tender'
" Plug 'lifepillar/vim-solarized8'

" will make vim slow
" Plug 'colorizer'
" Plug 'guns/xterm-color-table.vim'

" This one is better than colorizer?
" It works well with GUI, but fail under terminal, even set guicolors
" Plug 'gorodinskiy/vim-coloresque'

""" colorscheme END

""" UI related
Plug 'bling/vim-airline'
let g:airline_theme             = 'powerlineish'
" let g:airline_theme             = 'hybrid'
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Br'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_warning = ''
let g:airline_powerline_fonts   = 1

Plug 'vim-airline/vim-airline-themes'

Plug 'mkitt/tabline.vim'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 2
" vim-powerline symbols
" let g:airline_left_sep          = '>'
" let g:airline_left_alt_sep      = '>'
" let g:airline_right_sep         = '<'
" let g:airline_right_alt_sep     = '<'
" let g:airline_branch_prefix     = 'Br'
" let g:airline_readonly_symbol   = 'Lk'
" let g:airline_linecolumn_prefix = 'L/n'

Plug 'jeetsukumaran/vim-buffergator'

" Change cursorlinenr highlight as airline theme and status
" BUGGY: visual mode, cannot move to head
" wait patch
Plug 'ntpeters/vim-airline-colornum'

" Plug 'minibufexpl.vim'
" nnoremap <Leader>bb     :TMiniBufExplorer<cr>
" let g:miniBufExplSplitBelow  = 0

" Plug 'bling/vim-bufferline'

""" show indent line with unicode char
" Plug 'Yggdroot/indentLine'
" let g:indentLine_color_term=236
" | ¦ ┆ │
" let g:indentLine_char='│'

" not good
" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_start_level = 4
" let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_default_mapping = 0
" let g:indent_guides_auto_colors = 0
""" UI related END

""" search related
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
" Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_extesions = ['funky', 'tag']
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
" Plug 'JazzCore/ctrlp-cmatcher'
" if filereadable(expand('~/.vim/bundle/ctrlp-cmatcher/autoload/fuzzycomt.so'))
"   let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
" else
"   echohl WarningMsg | echom 'You need to compile the CtrlP C matching extension.' | echohl None
" endif
" Plug 'FelikZ/ctrlp-py-matcher'
" let g:ctrlp_match_func = { 'match' : 'pymatcher#PyMatch' }
" Plug 'ompugao/ctrlp-z'
" Plug 'ivalkeen/vim-ctrlp-tjump'

" Plug 'Shougo/unite.vim'

" Plug 'mileszs/ack.vim'
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

" Plug 'dyng/ctrlsf.vim'
nmap \ff    <Plug>CtrlSFCwordExec
nmap \fw    :CtrlSFToggle<cr>
" In ctrlsf window,
" p         open and preview
" O         open and jump to it
" Enter     open and jump to it, close ctrlsf window
" Ctrl-J/Ctrl-K next/prvious matched point

""" search related END

""" error checking
" Plug 'vim-scripts/Syntastic'
" highlight SyntasticErrorLine    ctermbg=black
" highlight SyntasticErrorSign    ctermbg=darkgray
" let g:syntastic_check_on_open = 1
" let g:syntastic_aggregate_errors = 1
" let syntastic_style="fancy"
" if syntastic_style == "fancy"
"     let g:syntastic_error_symbol = "✖"
"     let g:syntastic_warning_symbol = "!"
"     " let g:syntastic_warning_symbol = "⚒"
" elseif syntastic_style == "simple"
"     let g:syntastic_error_symbol = 'E'
"     let g:syntastic_warning_symbol = 'w'
" endif
" let g:syntastic_style_error_symbol   = 'X'
" let g:syntastic_style_warning_symbol = '✕'
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_c_checkers = []
" " This enable init python3 when init, make vim slow at "open buffer"
" " let g:syntastic_python_python_exec = "/usr/bin/python3"
" "let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_loc_list_height = 5
" let g:syntastic_c_check_header          = 1
" let g:syntastic_c_remove_include_errors = 1
" let g:syntastic_haskell_checkers = ['ghc_mod', 'hlint']
" let g:syntastic_haskell_hlint_args = "-i 'Redundant bracket'"
" " remove hdevtools, as it may block vim
" let g:syntastic_java_checkers = ['javac']
""" error checking END

""" comment related
" Plug 'The-NERD-Commenter'
" let NERDShutUp=1
Plug 'tomtom/tcomment_vim'
let g:tcomment_types={'c': '/* %s */', 'asm': '# %s', 'gdb': '# %s', 'cpp': '/* %s */'}
" no reason to switch, not faster
" Plug 'tpope/vim-commentary'
Plug 'jbgutierrez/vim-better-comments'
""" comment related END

""" for programming or filetype
""" Plugin for C lang
""" replace stdrand a.vim.
""" old a.vim have imap shortcut. It affect input speed.
Plug 'nacitar/a.vim', { 'for': [ 'c', 'h', 'cpp' ] }

highlight Operator ctermfg=117
" Plug 'NLKNguyen/c-syntax.vim'

" Plug 'bbchung/clighter'

""" C/C++ document Doxygen support
Plug 'vim-scripts/DoxygenToolkit.vim'
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_authorName="liuyang1<liuyang1@ustc.edu.cn>"
" let g:DoxygenToolkit_licenseTag="My own license" <-- !!! Does not end with "\<enter>"
let g:load_doxygen_syntax=1
" Plug 'mrtazz/DoxygenToolkit.vim'

" if v:version >= 735
"    Plug 'Valloric/YouCompleteMe' , { 'for': ['c', 'cpp']},
" endif
" ./install --clang-compeleter
" conflict
" nnoremap <C-i>      :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>y  :YcmDiags<cr>
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

" Plug 'ervandew/supertab'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

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

""" lisp
" Plug 'kovisoft/slimv', { 'for': ['scheme', 'lisp'] }
" lisp_rainbow not works now under vim74
let g:lisp_rainbow=1
let g:scheme_builtin_swank=1
let g:slimv_ballon=1
" only add one enter to save sapce and decrease line
let g:paredit_electric_return=0
let g:paredit_short_maps=0

" Plug 'liuyang1/vim-niji'
let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket']

" for quick move ()
" fail to detect file type
Plug 'vim-scripts/paredit.vim'  " , { 'for': ['lisp', 'scheme', 'racket'] }

" Plug 'dkinzer/vim-schemer'

""" Python
" if only use autopep8 as formatprg, also works.
" then below 3 lines could delete
" Plug 'liuyang1/vim-autopep8'
autocmd FileType python map <buffer> <Leader>cc     :call Autopep8()<cr>
let g:autopep8_disable_show_diff=1
au FileType python setlocal formatprg=autopep8\ -aa\ -

" It's too slow
" Low performance, high CPU loading
" Plug 'Python-mode-klen', { 'for': ['python'] }
" pep8 style indent
" python lint checking
let g:pymode_folding = 0
autocmd FileType python setlocal completeopt-=preview

" need pip install jedi
" Plug 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "0"
" TODO: how to disable the preview window

" Plug 'ehamberg/vim-cute-python', { 'for': ['python'] }

" Plug 'hdima/python-syntax'
let python_highlight_all = 1
""" Python END

""" markdown filetype
" Plug 'plasticboy/vim-markdown', { 'for': ['markdown']}
let g:vim_markdown_folding_disabled=1
" we don't need conceal in vim, it's ugly as break indent rules.
" set conceallevel=2
" depend on tabular
" Plug 'waylan/vim-markdown-extra-preview'

" Must to default enable to preview markdown with browser
" Plug 'suan/vim-instant-markdown'
" Plug 'gabrielelana/vim-markdown' , { 'for': ['markdown']}
", { 'for': ['md']}
""" markdown END

""" sml filetype
" Plug 'cypok/vim-sml', { 'for': ['sml'] }

""" Haskell
" Plug 'enomsg/vim-haskellConcealPlus', {'for': ['haskell']}
let hscoptions="𝐌⇒⇔tT*Efh"
" Plug 'lukerandall/haskellmode-vim', {'for': ['haskell']}
let g:hs_highlight_delimiters = 1
" au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/chromium"
let g:haddock_browser_nosilent = 1

" - type check
" - link
" Plug 'eagletmt/ghcmod-vim', {'for': ['haskell']}

" completion
" neco-ghc

" Plug 'raichoo/haskell-vim', {'for': ['haskell']}
" Plug 'dag/vim2hs', {'for': ['haskell']}

" insert comment block
let s:width = 80
function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "-- " . name . "\n"
    \       . "\n"

endfunction
autocmd Filetype haskell nnoremap <silent> --s "=HaskellModuleSection()<CR>gp

""" Haskell END

""" Log filetype
" Plug 'vim-scripts/Logcat-syntax-highlighter'
""" javascript
" Plug 'maksimr/vim-jsbeautify', { 'for': ['javascript', 'html'] }

""" rust-lang
" Plug 'rust-lang/rust.vim'
""" filetype END

""" file / directory browser
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos="right"
nnoremap cot :NERDTreeToggle<cr>
nnoremap cor :NERDTreeFind<cr>
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "c",
    \ "Staged"    : "s",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "X",
    \ "Dirty"     : "d",
    \ "Clean"     : "c",
    \ "Unknown"   : "?"
    \ }
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('wiki', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('h', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('java', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('c', 'Red', 'none', '#ffa500', '#151515')
" Nerd tree is better"
" Plug 'tpope/vim-vinegar'
""" file / directory browser END

""" vim diff mode
" add better diff algo
" Plug 'chrisbra/vim-diff-enhanced'

" support diff on directory
" Plug 'will133/vim-dirdiff'
""" vim diff mode END

" Plug 'EasyMotion'

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

" Plug 'vim-scripts/speeddating.vim'

" Plug 'regedarek/ZoomWin'
" Plug '907th/vim-auto-save'
" let g:auto_save=1
" let g:auto_save_no_updatetime=1
" let g:auto_save_in_insert_mode=0
" Plug 'mhinz/vim-startify'

" Plug 'SyntaxRange'
" Plug 'tpope/vim-surround'

" Plug 'Shougo/vimproc.vim', { 'do': 'make'  }
nnoremap <Leader>x      :VimProcBang

" Plug 'Shougo/vimshell.vim'


""" help input digraph char.
" 2S ²
" <Leader>bbaw
" Plug 'Rykka/easydigraph.vim'
" default mapkey is <Leader>bb
" this conflict with our <Leader>b, which show buffer with CtrlP plugin
" let g:EasyDigraph_nmap="\b"

" Plug 'vim-scripts/utl.vim'

" Plug 'ryanoasis/vim-webdevicons'
" Plug 'terryma/vim-expand-region'

" Plug 'vim-scripts/DrawIt'

" gb gB to swap-parameter
" Plug 'swap-parameters'

""" This plugin affect indent behaviour in C language
" Plug 'Raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'

" Plug 'tpope/vim-dispatch'

" temp forbin as >p kind of key-mapping
" Plug 'tpope/vim-unimpaired'

" Plug 'Align'

" :Tab /= aligh with =
" :Tab /:\zs aligh with colon
" Plug 'godlygeek/tabular'
"Plug 'AutoAlign'

" TODO: make more test
" Plug 'Chiel92/vim-autoformat'

""" dynamic switch cursor when insert or normal mode
" Plug 'wincent/terminus'
" change cursor color when insert or normal mode
Plug 'dmedvinsky/uritality.vim'

" Plug 'aklt/plantuml-syntax', { 'for': [ 'plantuml' ] }

" add path completion of zsh style
" we don't need it, as already have ctrlp
" Plug 'fweep/vim-zsh-path-completion'

" Plug 'itchyny/thumbnail.vim'

" Plug 'AD7six/vim-activity-log'
let g:activity_log_location="$HOME/.activity/%Y/%m/%d.log"

""" for ledger format
" Plug 'ledger/vim-ledger', { 'for': ['ledger'] }
let g:ledger_maxwidth=50
let g:ledger_align_at=50
let g:ledger_winpos='r'

" Plug 'PeterRincker/vim-argumentative'

call plug#end()
