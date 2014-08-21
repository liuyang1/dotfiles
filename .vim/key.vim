" edit and reload vimrc
nnoremap ,s :source ~/.vimrc<CR>
nnoremap ,e :edit ~/.vimrc<CR>

" auto open quickfix window
"autocmd QuickFixCmdPost * :copen
"  make &c
noremap <Leader>mm	:silent make\|redraw!\|cope<CR>
noremap <Leader>md	:make clean<CR><CR>
noremap <Leader>mr	:silent make run\|redraw!\|cope<CR>


func! MyRunitcmd()
	let fn=expand('%')
	if &filetype=='scheme'
		"return 'mit-scheme\ --load\ '.fn
		"return 'racket\ -f\ '.fn
		return 'guile\ -s\ '.fn
	elseif &filetype=='sh'
		return './'.fn
	elseif &filetype=='python'
		" not compataible with MyRunit
		return 'python\ ' . fn
	elseif &filetype=='cpp'
		if filereadable('Makefile')
			" can not execute two cmd
			return 'make'
		else
			return 'g++ ' . fn . '&& ./a.out'
		endif
	elseif &filetype=='sh'
		return 'bash ' . fn
    elseif &filetype=='clojure'
        return 'clojure ' . fn
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
		"exe 'silent! botright vertical split MyRunit'
		exe 'silent! botright split MyRunit'
	endif
	echomsg cmd
	" stdout && stderr to  tmpfile and stdout
	execute '!' . cmd . ' 2>&1 | tee /tmp/TmpForRunIt'
	silent execute '0read /tmp/TmpForRunIt'
	silent! setlocal nobuflisted
	silent! setlocal nonumber
	silent! setlocal buftype=nofile
	execute "normal \<c-w>p"
	autocmd BufEnter MyRunit nested call Autoquit()
endfunc
function! OriginRunit()
	if &filetype=='python'
		execute '!python %'
	elseif &filetype=='scheme'
		" execute '!guile -s %'
		" execute '!racket -f %'
        execute '!mit-scheme < %'
	elseif &filetype=='sh'
        let fn=expand('%')
		execute '!./'.fn
		"execute '!bash -c %'
    elseif &filetype=='clojure'
        execute '!clojure %'
	else
		echomsg 'not setting'
	endif
endfunc

nnoremap <Leader>rr	:call OriginRunit()<cr>
" nnoremap <Leader>rr	:call MyRunit()<cr>
" open helper tmux windows, and send-keys
func! MyRunTmux()
	let cmd=MyRunitcmd()
	execute ":silent !tmux send-keys " . cmd . " Enter"
	execute ":redraw!"
endfunc
" noremap <Leader>rt	:call MyRunTmux()<cr>

" buffer
nnoremap <Leader>ss :buffers<cr>:buffer<Space>

" taglist
set tags+=../tags
noremap <Leader>tg	:TlistToggle<CR>
noremap <Leader>ti  :!ctags-exuberant -R --fields=+iaS --extra=+q . --recurse=no<CR><CR>

noremap <Leader>x	:sh<CR>
nnoremap <Leader>wu :!ftpsync<cr>

function! SwitchRelative()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <Leader>ff :call SwitchRelative()<cr>
nnoremap <Leader>q  :wqa!<cr>
