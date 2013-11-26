au BufNewFile,BufRead Makefrag	setf make
au BufNewFile,BufRead *.ocl		setf	opencl
au BufNewFile,BufRead *.ldg		setf	ledger | comp ledger

autocmd FileType scheme setlocal formatoptions+=r
autocmd FileType scheme setlocal commentstring=;%s
