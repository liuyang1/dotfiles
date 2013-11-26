let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,img'
let g:vimwiki_camel_case=0
let g:vimwiki_use_mouse=1
let g:vimwiki_list=[{
			\ 'path': '/home/liuy/git/notes.g',
			\ 'path_html': '/home/liuy/git/notes.g/html',
			\ 'auto_export': 1,
			\ }]
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_menu=''
" let g:vimwiki_folding=1
let g:vimwiki_CJK_length=1
let g:vimwiki_timestamp_format = '%Y-%m-%d %H:%M:%S'


nnoremap <Leader>wz <Plug>VimwikiToggleListItem
