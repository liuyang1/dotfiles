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
" autocmd FileType c,cpp  nnoremap <silent> <Leader>ts  :sp <cr>:exec("tag ".expand("<cword>"))<cr>
autocmd FileType c,cpp  nnoremap <silent> <C-\>  :vsp <cr>:exec("tag ".expand("<cword>"))<cr>
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

autocmd FileType javascript noremap <silent> <Leader>cc :call JsBeautify()<cr>
autocmd FileType html       noremap <silent> <Leader>cc :call HtmlBeautify()<cr>
autocmd FileType css        noremap <silent> <Leader>cc :call CSSBeautify()<cr>

autocmd FileType vimwiki    set tw=78 ts=2

autocmd FileType xdefaults  setlocal makeprg=xrdb\ %

autocmd BufEnter *.hs set formatprg=pointfree
