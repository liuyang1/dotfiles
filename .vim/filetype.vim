au BufNewFile,BufRead Makefrag	setf make
au BufNewFile,BufRead *.ocl		setf	opencl
au BufNewFile,BufRead *.ldg		setf	ledger | comp ledger

autocmd FileType scheme setlocal formatoptions+=r
autocmd FileType scheme setlocal commentstring=;%s
autocmd FileType scheme setlocal expandtab

" for python set
autocmd FileType python setlocal expandtab

" for C/CPP
set formatprg=uncrustify\ -c\ ~/.uncrustify.cfg\ --no-backup\ 2>/dev/null
autocmd FileType c map <buffer> <Leader>cc ggVGgq
autocmd FileType cpp map <buffer> <Leader>cc ggVGgq
