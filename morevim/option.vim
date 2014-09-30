set nocompatible
set nobackup     "no   backup file
set noswapfile   "no   swap   file

set history=1000

set cmdheight=1  "cmd  height
set ruler        "show position of cursor
set number       "how  line   number
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber
function! SwitchRelative()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <Leader>ff      :call SwitchRelative()<cr>

"set noexpandtab
set expandtab
set smarttab
set shiftwidth=4  " shift width
set tabstop=4     " tab 4 space
set softtabstop=4 " soft tab 4 space

" indent
"set autoindent  " copy indent from current line when starting a new line
set smartindent " c style, after '{' or a line starting with cinwords' or before '}' smart indent
"set cindent     "more strict
filetype plugin indent on

" search
set incsearch
set hlsearch
set ignorecase  " ignore case search
set smartcase   " when input upper case char, override ignorecase

" buffer
set hidden

" mouse
"set mouse=a " enable the use of the mouse under all modes

" status
set laststatus=2    " always show status line
set showtabline=2
set noshowmode      " as powerline plugin already display this info

" modeline
set showmode    " ???
set modeline
set modelines=5

set report=0    " always show if any lines changed

" message
set shortmess=at " using all of abbr and truncate file meesage at the start

" cmd
set showcmd " show cmd in the last line of the screen

" match bracket
set showmatch
set matchtime=1 " default 5

" suffiexes file ignore
set suffixes=,~,.o,.h,.info,.swp,.obj,.gz,.ps,.tar,.aux,.dvi,.bz2,.idx,.pdf
set wildignore=*.gz,*.bz2,*.tgz,*.tbz,*.zip,*.rar,*.mp3,*.png,*.jpg,*.o,*.obj,*.exe

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

" only show current line at active window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter    * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" set cursorcolumn

" wild
set wildmenu    " CLI completion operate in anenhanced mode
set wildchar=<TAB>  " vim default <TAB>

" backspace
set backspace=eol,start,indent

set noerrorbells
set visualbell

syntax enable
syntax on
" fold
" set foldenable
" set foldlevel=0 " close all folds. default: 0
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

" path
set path=..,.,/usr/include,/usr/src/linux/include,/usr/local/include,

" wrap
set wrap

set listchars=tab:▸\ ,trail:.,extends:>
"set listchars=tab:>\ ,trail:.,extends:>
"set listchars=tab:>\ ,trail:.,extends:>
"set listchars=tab:>\ ,trail:.,extends:>
"▶
"▸
"▷
set list!

"set scrolloff=999

set viminfo='10,\"100,:20,%,n~/.viminfo

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
set diffopt+=iwhite

set tags=./tags;/
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

set noreadonly
