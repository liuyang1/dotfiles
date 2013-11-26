if has("gui_running")
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
endif

map <silent><F2> :if &guioptions=~# 'T' <Bar>
		\set guioptions-=T <Bar>
		\set guioptions-=m <Bar>
	\else <Bar>
		\set guioptions+=T <Bar>
		\set guioptions+=m <Bar>
	\endif<cr>
