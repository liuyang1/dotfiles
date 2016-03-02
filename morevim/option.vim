set nocompatible
set nobackup     "no   backup file
set noswapfile   "no   swap   file

" Number
set number       "how  line   number
set relativenumber
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber
function! SwitchRelative()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap \l      :call SwitchRelative()<cr>

" Tab & Indent
set expandtab
set smarttab
set shiftwidth=4  " shift width
set tabstop=4     " tab 4 space
set softtabstop=4 " soft tab 4 space
set shiftround

set autoindent  " copy indent from current line when starting a new line
set copyindent  " copy previous indentaion on autoindenting
set smartindent " c style, after '{' or a line starting with cinwords' or before '}' smart indent
set cindent     "more strict

filetype plugin indent on

" search
set incsearch
set hlsearch
set ignorecase  " ignore case search
set smartcase   " when input upper case char, override ignorecase

" buffer
set hidden

" mouse
set mouse=a " enable the use of the mouse under all modes

" status
set laststatus=2    " always show status line
set showtabline=2
set noshowmode      " as powerline plugin already display this info
set tabpagemax=50

set history=1000

" cmd
set showcmd " show cmd in the last line of the screen
set cmdheight=1  "cmd  height

" cursor
    " only show current line at active window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter    * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
    " set cursorcolumn
set ruler        "show position of cursor

" modeline
set showmode    " ???
" modeline need these, and NOT ROOT user.
set modeline
set modelines=5

" message
set shortmess=at " using all of abbr and truncate file meesage at the start
set report=0    " always show if any lines changed

" match bracket
set showmatch
set matchtime=1 " default 5

set startofline " page down / page up &c, to non-blank of the line

" multi-window
set splitright  " split window to right
set splitbelow

" tty
set ttyfast
set ttyscroll=0 " endless of lines to scroll the screen
set nottybuiltin    " search termcaps after the external ones.

set autoread
set autowrite
autocmd FocusLost * silent! wa
set autowriteall

" wild
" wildcard completion content in menu
set wildmenu
set wildchar=<TAB>  " vim default <TAB>
" suffiexes file ignore
set suffixes=,~,.o,.h,.info,.swp,.obj,.gz,.ps,.tar,.aux,.dvi,.bz2,.idx,.pdf
set wildignore=*.gz,*.bz2,*.tgz,*.tbz,*.zip,*.rar,*.mp3,*.png,*.jpg,*.o,*.obj,*.exe

" backspace
set backspace=eol,start,indent

set noerrorbells
" forbidden visual blink
set novisualbell
set t_vb=

" syntax
syntax enable
syntax on

" fold
" set foldenable
" set foldlevelstart=4 " close all folds. default: 0
" set foldnestmax=10
" set foldmethod=indent
" set foldmethod=syntax

" encoding
set encoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,chinese,cp936,gb18030,big5

set langmenu="en_US.utf-8"
language message en_US.utf-8
let $LANG='en_US.utf8'

set display=lastline,uhex " uhex: show unprintable char hex as <xx>
set lazyredraw

" path
set path=..,.,/usr/include,/usr/src/linux/include,/usr/local/include,

" wrap
set wrap

" set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set listchars=tab:▸\ ,trail:‽,extends:>,precedes:<,nbsp:+
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:+
" eol:¶
"▶
"▸
"☠
"❤
"‽
"▷
set list!

set scrolloff=1
set sidescrolloff=5

set viminfo='100,\"200,:200,%,n~/.viminfo
" for mark for word
set viminfo+=!

function! ResCur()
if line("'\"") <= line("$")
    normal! g`"
    return 1
endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" diff mode options
" set diffopt+=iwhite

set tags=./tags;/
" setglobal tags-=./tags tags^=./tags;
" map <C-i>     :tjump <c-r><C-w><cr>

set nospell

" help for large file
if !exists("my_auto_commands_autoloaded")
    let my_auto_commands_autoloaded = 1
    let g:LargeFile = 1024 * 1024 * 1
    augroup LargeFile
        autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | setlocal bufhidden=unload | else | set eventignore-=FileType | endif
    augroup END
endif

set completeopt+=preview
set complete-=i

set noreadonly

set undofile
set undodir=~/.vimundo
set undolevels=100

" automation adjust height of quickfix window
function! AdjustWindowHeight(minh, maxh)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l+=1
    endw
    exe max([min([n_lines, a:maxh]), a:minh]) . "wincmd _"
endfunction
au FileType qf call AdjustWindowHeight(10, 25)

" fast <Esc> key
set showcmd
set ttimeout
set timeoutlen=1000 ttimeoutlen=0

set keywordprg=man\ -a

set sessionoptions-=options

" set autochdir

if has('cscope')
    set cscopetag cscopeverbose
    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif
    cnoreabbrev csa cs add
    cnoreabbrev css cs find
endif

" allows change in tmux mode
" not work
if exists('$TMUX')
    let $t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let $t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let $t_SI = "\<Esc>50;CursorShape=1\x7"
    let $t_EI = "\<Esc>50;CursorShape=0\x7"
endif

if v:version >= 735
    set regexpengine=1
endif
"| ¦ ┆ │
set fillchars=vert:┆,stlnc:-,fold:-,diff:-

" overwrite default
" default will treate octave number with 0 prefix
set nrformats=

" When encrypting any file, use the much stronger blowfish algorithm
set cryptmethod=blowfish

set title       " change terminal's title
