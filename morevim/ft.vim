filetype plugin on

autocmd FileType python setlocal makeprg=time\ python2\ %

autocmd BufNewFile,BufRead Makefrag setf make
autocmd FileType make   setlocal noexpandtab

autocmd FileType scheme setlocal makeprg=mit-scheme\ --load\ %
autocmd FileType scheme setlocal formatoptions+=r
autocmd FileType scheme setlocal commentstring=;%s
" autocmd  FileType scheme   setlocal             makeprg=guile\ -s\ %
" autocmd  FileType scheme   setlocal             expandtab

" for c
autocmd FileType c      setlocal formatprg=uncrustify\ -c\ ~/.uncrustify.cfg\ --no-backup\ 2>/dev/null
autocmd FileType c      setlocal makeprg=gcc\ %\ &&\ ./a.out

autocmd FileType c      map <buffer> <Leader>cc     ggVGgq
autocmd FileType c      nnoremap <silent> <Leader>ts  :vsp <cr>:exec("tag ".expand("<cword>"))<cr>

" for cpp
autocmd FileType cpp    setlocal formatprg=uncrustify\ -c\ ~/.uncrustify.cfg\ --no-backup\ 2>/dev/null
autocmd FileType cpp    setlocal makeprg=g++\ %\ &&\ ./a.out
autocmd FileType cpp    nnoremap <Leader>cc     ggVGgq

autocmd FileType sh     setlocal makeprg=bash\ %
autocmd FileType make   setlocal makeprg=make\ -f\ %
" for one key compile
nnoremap <Leader>rr :make<cr>
vnoremap <Leader>rr <C-C>:make<cr>
inoremap <Leader>rr <C-O>:make<cr>
