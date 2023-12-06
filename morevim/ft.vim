filetype plugin on

autocmd FileType python setlocal makeprg=time\ python2\ %

autocmd BufNewFile,BufRead Makefrag setf make
autocmd BufNewFile,BufRead makedefs setf make
autocmd FileType make   setlocal noexpandtab
autocmd FileType make   setlocal makeprg=make\ -f\ %

autocmd FileType scheme setlocal makeprg=mit-scheme\ --load\ %
autocmd FileType scheme setlocal formatoptions+=r
autocmd FileType scheme setlocal commentstring=;%s
" autocmd  FileType scheme   setlocal             makeprg=guile\ -s\ %
" autocmd  FileType scheme   setlocal             expandtab

autocmd FileType clojure    setlocal makeprg=clojure\ %
autocmd FileType lisp       setlocal makeprg=clisp\ %

" for c
autocmd FileType c      setlocal formatprg=uncrustify\ -c\ ~/.uncrustify.cfg\ --no-backup\ 2>/dev/null
autocmd FileType c      setlocal makeprg=gcc\ %\ &&\ ./a.out
autocmd FileType c      map <buffer> <Leader>cc     ggVGgq

" open tag
" autocmd FileType c,cpp nmap <buffer> <Leader>d   <C-w>}
autocmd FileType c,cpp nmap <buffer> <Enter>     <C-w>}

" /\<WORD\> to match WORD in regexp mode, \C for case sensitive
" this is for :set smartcase mode
" use gtags instead of naive tag
" autocmd FileType c,cpp,python  nnoremap <silent> <C-]>  :vsp <cr>:exec("tag /\\<".expand("<cword>")."\\>\\C")<cr>

" add for doxygen style comments
autocmd FileType c,cpp  setlocal comments^=:///
autocmd FileType c,cpp set cino+=(0
" autowrap
autocmd FileType c,cpp set textwidth=1000
" wrapping text using text width require "t" in formatoptions
autocmd FileType c,cpp set formatoptions+=t

" for cpp
autocmd FileType cpp    setlocal formatprg=uncrustify\ -c\ ~/.uncrustify.cfg\ --no-backup\ 2>/dev/null
autocmd FileType cpp    setlocal makeprg=g++\ %\ &&\ ./a.out
autocmd FileType cpp    nnoremap <Leader>cc     ggVGgq

autocmd FileType sh     setlocal makeprg=bash\ %
" for one key compile
nnoremap <Leader>rr :make<cr>
vnoremap <Leader>rr <C-C>:make<cr>
" inoremap <Leader>rr <C-O>:make<cr>

autocmd BufNewFile,BufRead *.test setlocal filetype=tcl

autocmd FileType log,logcat   set norelativenumber
autocmd FileType log,logcat   nmap <buffer> <Enter>     <Leader>aa<C-w><C-w>
autocmd FileType log,logcat   highlight ExtraWhitespace ctermbg=233
autocmd FileType log,logcat   set colorcolumn=

autocmd FileType javascript noremap <silent> <Leader>cc :call JsBeautify()<cr>
autocmd FileType html       noremap <silent> <Leader>cc :call HtmlBeautify()<cr>
autocmd FileType css        noremap <silent> <Leader>cc :call CSSBeautify()<cr>

autocmd FileType vimwiki    set ts=2
autocmd Filetype vimwiki setlocal spell
" autocmd Filetype markdown setlocal spell

autocmd FileType xdefaults  setlocal makeprg=xrdb\ %

" autocmd BufEnter *.hs set formatprg=pointfree
autocmd FileType haskell setlocal ts=2
autocmd FileType haskell setlocal formatprg=stylish-haskell
autocmd FileType haskell map <buffer> <Leader>cc     ggVGgq

" add for cppcheck
" autocmd BufEnter *.cck setlocal errorformt=[%f:%l]\ ->\ %m,[%f:%l]:%m

autocmd FileType py set textwidth=79

" enable spell check for git commit message
" ]s, [s to to previous or next spell error,
" z= will list correct candidate
" zg    mark this word is correct
" zw    makr this word is incorrent
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType gitcommit set colorcolumn=72

" function param follow indent
autocmd FileType java set cino+=(0
let java_comment_strings=1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

""" ledger
autocmd BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
autocmd Filetype ledger setlocal formatprg=ldgfmt.py\ %
autocmd FileType ledger    nnoremap <Leader>cc     ggVGgq
autocmd Filetype ledger setlocal nofoldenable

""" Android.bp file
autocmd BufNewFile,BufRead Android.bp :setl ft=go sw=4 sts=4 et
