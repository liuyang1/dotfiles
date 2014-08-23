filetype plugin on

autocmd FileType python setlocal makeprg=time\ python\ %
autocmd FileType python map <buffer> <Leader>cc: call Flake8()<cr>

autocmd BufNewFile,BufRead Makefrag setf make
autocmd FileType make setlocal noexpandtab

autocmd FileType scheme   setlocal makeprg=mit-scheme\ --load\ %
autocmd FileType scheme   setlocal formatoptions+=r
autocmd FileType scheme   setlocal commentstring=;%s
" autocmd  FileType scheme   setlocal             makeprg=guile\ -s\ %
" autocmd  FileType scheme   setlocal             expandtab

" for c
set formatprg=uncrustify\ -c\ ~/.uncrustify.cfg\ --no-backup\ 2>/dev/null
" autocmd FileType c      setlocal makeprg=gcc\ -o\ %<\ %
autocmd FileType c      setlocal makeprg=gcc\ %

autocmd FileType c  map <buffer> <Leader>cc     ggVGgq
autocmd FileType c nnoremap <silent> <Leader>ts  :vsp <cr>:exec("tag ".expand("<cword>"))<cr>

" for cpp
" autocmd FileType cpp    setlocal makeprg=g++\ -o\ %<\ %
autocmd FileType cpp    setlocal makeprg=g++\ %


" for one key compile
nnoremap <Leader>rr :make<cr><cr>
vnoremap <Leader>rr <C-C>:make<cr>
inoremap <Leader>rr <C-O>:make<cr><cr>

autocmd FileType c      nnoremap ,rr :!./a.out<cr>
