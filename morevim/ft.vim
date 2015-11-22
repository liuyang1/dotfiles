filetype plugin on

autocmd FileType python setlocal makeprg=time\ python2\ %

autocmd BufNewFile,BufRead Makefrag setf make
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
autocmd FileType c,cpp,python  nnoremap <silent> <C-\>  :vsp <cr>:exec("tag /\\<".expand("<cword>")."\\>\\C")<cr>

" add for doxygen style comments
autocmd FileType c,cpp  setlocal comments^=:///
autocmd FileType c,cpp set cino+=(0


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

autocmd FileType vimwiki    set tw=78 ts=2
autocmd Filetype vimwiki setlocal spell
autocmd Filetype markdown setlocal spell

autocmd FileType xdefaults  setlocal makeprg=xrdb\ %

" autocmd BufEnter *.hs set formatprg=pointfree
autocmd FileType haskell setlocal ts=2

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
