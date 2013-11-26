" edit and reload vimrc
nnoremap ,s :source ~/.vimrc<CR>
nnoremap ,e :edit ~/.vimrc<CR>

"  make &c
noremap <Leader>mm	:make<CR>
noremap <Leader>md	:make clean<CR>
noremap <Leader>mr	:make run<CR>

func! MyRunitcmd()
	let fn=expand('%')
	if &filetype=='scheme'
		return 'racket -f '.fn
	elseif &filetype=='sh'
		return './'.fn
	elseif &filetype=='pyhton'
		return 'python '.fn
	elseif &filetype=='cpp'
		if filereadable('Makefile')
			return 'make && make run'
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
	silent execute '0read !'.cmd
	silent! setlocal nobuflisted
	silent! setlocal nonumber
	silent! setlocal buftype=nofile
	execute "normal \<c-w>p"
	autocmd BufEnter MyRunit nested call Autoquit()
endfunc
noremap <Leader>rr	:call MyRunit()<cr>

" buffer
nnoremap <Leader>s :buffers<cr>:buffer<Space>

" taglist
noremap <Leader>tg	:TlistToggle<CR>
noremap <Leader>ti  :!ctags-exuberant -R --fields=+iaS --extra=+q . --recurse=no<CR><CR>

noremap <Leader>x	:sh<CR>

