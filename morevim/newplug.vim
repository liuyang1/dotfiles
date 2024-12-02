set nocompatible

filetype off
call plug#begin('~/.vim/bundle')

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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

""" tmux extension
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

Plug 'slarwise/vim-tmux-send'
nnoremap <LEADER>ss :SendLine<CR>
nnoremap <LEADER>sp :SendLineP<CR>

Plug 'vim-scripts/gtags.vim'
map <C-]> :GtagsCursor<CR>

Plug 'preservim/tagbar'
map <leader>tt :TagbarToggle<CR>
let g:tagbar_left             = 1
let g:tagbar_autofocus        = 1
let g:tagbar_compact          = 1
let g:tagbar_width            = 40
"relative line number
let g:tagbar_show_linenumbers = 2
let g:tagbar_previewwin_pos   = "downright"
" let g:tagbar_autopreview      = 1
let g:tagbar_sort             = 0
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

" Plug 'liuchengxu/vista.vim'

Plug 'vim-airline/vim-airline-themes'

Plug 'bling/vim-airline'

if $YTHEME == "dark"
    " let g:airline_theme             = 'powerlineish'
    let g:airline_theme             = 'dracula'
elseif $YTHEME == "light"
    let g:airline_theme             = 'zenburn'
else
endif
" let g:airline_theme             = 'hybrid'
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#branch#empty_message = 'No Br'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_section_warning = ''
let g:airline_powerline_fonts   = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#enabled=0

Plug 'mkitt/tabline.vim'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 2

Plug 'tpope/vim-fugitive'
nnoremap <Leader>gb         :Git blame<cr>
nnoremap <Leader>gd         :Git diff<cr>

" Plug 'amdt/vim-niji'
" Plug 'luochen1990/rainbow', { 'for': ['c','cpp', 'h', 'scheme', 'python', 'java']}
Plug 'frazrepo/vim-rainbow', { 'for': ['c','cpp', 'h', 'scheme', 'python', 'java']}
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

Plug 'nacitar/a.vim', { 'for': [ 'c', 'h', 'cpp' ] }

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

" Plug 'easymotion/vim-easymotion'

" Plug 'vim-scripts/vimwiki' " { 'for': ['wiki'] }
" let g:vimwiki_folding='list:quick'
" let g:vimwiki_folding='indent:quick'
Plug 'vimwiki/vimwiki' " { 'for': ['wiki'] }
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_conceallevel=0 " disable concel
nnoremap \dd     :VimwikiToggleListItem<cr>

Plug 'tpope/vim-abolish'

Plug 'benmills/vimux'
map <silent> <Leader><Leader> :update<cr>:call VimuxRunCommand("yspec " . expand("%:p"))<CR>
map <Leader>vc :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" delete extra (), {}
Plug 'tpope/vim-surround'

" Plug 'justinmk/vim-sneak'

" TEMP: disable due to error: detected while processing BufEnter signature
" sign refreshing...
" Plug 'kshenoy/vim-signature'
" Plugin to toggle, display and navigate marks
let g:SignatureMarkOrder = "\m⚑"
" let g:SignatureMarkOrder = "\m»"
" let g:SignatureMarkOrder = "\m)"
" let g:SignatureMarkLineHL = "'WarningMsg'"
let g:SignatureMarkLineHL = "'SignLineHL'"
let g:SignatureMarkerLineHL = "'SignLineHL'"
let g:SignatureMarkTextHLDynamic = 1

""" C/C++ document Doxygen support
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': [ 'c', 'h', 'cpp' ] }
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_authorName="liuyang1<liuyang1@ustc.edu.cn>"
" let g:DoxygenToolkit_licenseTag="My own license" <-- !!! Does not end with "\<enter>"
let g:load_doxygen_syntax=1

Plug 'fedorenchik/VimCalc3'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

Plug 'tibabit/vim-templates'
let g:tmpl_search_paths = ['~/.vim/templates']
let g:tmpl_author_email = 'liuyang1@ustc.edu.cn'
let g:tmpl_author_name = 'liuyang1'

Plug 'nathangrigg/vim-beancount', { 'for': ['bean'] }

" https://github.com/Exafunction/codeium.vim
Plug 'Exafunction/codeium.vim'
let g:codeium_enabled = v:false " disable codeium by default due to policy
let g:codeium_disable_bindings = 1
let g:codeium_idle_delay = 200 " default 500, min 75
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
" imap <C-x>   <Cmd>call codeium#Clear()<CR>
nnoremap <Leader>ce  :Codeium EnableBuffer<CR>:Codeium Enable<CR>

Plug 'skywind3000/vim-terminal-help'
let g:terminal_edit='drop'
let g:terminal_kill='term' " auto kill term session when exiting vim
let g:terminal_close=1 " close window if process finished
" Option+=, toggle terminal
" Option+shift+h/j: move to the window below/above
" drop abc.txt, tell vim to open abc.txt

" Plug 'NLKNguyen/papercolor-theme'

" Plug 'letorbi/vim-colors-modern-borland'

Plug 'dracula/vim', { 'as': 'dracula' }

" syntax highlight accelator for Typescript (otherwise, it's too slow when
" open ts file
Plug 'HerringtonDarkholme/yats.vim'
" yats.vim 相关配置
let g:typescript_ignore_browserwords = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

""
call plug#end()
