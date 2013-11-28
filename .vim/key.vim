" edit and reload vimrc
nnoremap ,s :source ~/.vimrc<CR>
nnoremap ,e :edit ~/.vimrc<CR>

" auto open quickfix window
autocmd QuickFixCmdPost * :copen
"  make &c
noremap <Leader>mm	:silent make\|redraw!\|cope<CR>
noremap <Leader>md	:make clean<CR><CR>
noremap <Leader>mr	:silent make run\|redraw!\|cope<CR>


func! MyRunitcmd()
	let fn=expand('%')
	if &filetype=='scheme'
		"return 'racket -f '.fn
		return 'guile -s '.fn
	elseif &filetype=='sh'
		return './'.fn
	elseif &filetype=='python'
		return 'python '.fn
	elseif &filetype=='cpp'
		if filereadable('Makefile')
			" can not execute two cmd
			return 'make'
		else
			return 'g++ a.cpp && ./a.out'
		endif
	elseif &filetype=='sh'
		return 'bash ' . fn
	endif
	echomsg 'unspport type to MyRunit'
	return
endfunc
function! Autoquit()
	if winbufnr(2) == -1
		bdelete
		quit
	endif
endfunc
func! MyRunit()
	if &filetype=='cpp'
		if filereadable('Makefile')
			:make
			:cope
			return
		endif
	endif
	silent! up
	let cmd=MyRunitcmd()
	let MyRunit_title='MyRunit'
	let winnum = bufwinnr(MyRunit_title)
	if winnum != -1
		" jump to existing window
		if winnr() != winnum
			exe winnum . 'wincmd w'
		endif
		execute "normal ggdG"
	else
		exe 'silent! botright vertical split MyRunit'
	endif
	echomsg cmd
	" stdout && stderr to  tmpfile and stdout
	execute '!'.cmd.' 2>&1 | tee /tmp/TmpForRunIt'
	silent execute '0read /tmp/TmpForRunIt'
	silent! setlocal nobuflisted
	silent! setlocal nonumber
	silent! setlocal buftype=nofile
	execute "normal \<c-w>p"
	autocmd BufEnter MyRunit nested call Autoquit()
endfunc
noremap <Leader>rr	:call MyRunit()<cr>
" open helper tmux windows, and send-keys
noremap <Leader>rt	:!tmux send-keys "make && make run" Enter<cr><cr>

" buffer
nnoremap <Leader>s :buffers<cr>:buffer<Space>

" taglist
noremap <Leader>tg	:TlistToggle<CR>
noremap <Leader>ti  :!ctags-exuberant -R --fields=+iaS --extra=+q . --recurse=no<CR><CR>

noremap <Leader>x	:sh<CR>
nnoremap <Leader>wu :!ftpsync<cr>
