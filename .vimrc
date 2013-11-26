set nocompatible
set term=rxvt-unicode-256color

" bundle
set runtimepath+=~/.vim/bundle/vundle.git
call vundle#rc()

" Bundle 'CSApprox'
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

Bundle "vimwiki"
source ~/.vim/config/vimwiki.vim

Bundle "slimv.vim"
let g:lisp_rainbow=1
let g:scheme_builtin_swank=1
let g:slimv_balloon=1
" only add one enter to save space and decrease line
let g:paredit_electric_return=0

Bundle "a.vim"

Bundle "taglist.vim"
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Auto_Highlight_Tag=1
"let Tlist_Auto_Open=1
let Tlist_Display_Prototype=1
let Tlist_Compact_Format=1
let Tlist_File_Fold_Auto_Close=1
let tlist_vimwiki_settings='wiki;h:标题'

source ~/.vim/option.vim
source ~/.vim/syntax.vim
source ~/.vim/key.vim
source ~/.vim/colorscheme.vim
source ~/.vim/abbr.vim
source ~/.vim/filetype.vim
source ~/.vim/powerline.vim
source ~/.vim/gui.vim
au BufReadPost * if line("'\"")>0 | if line("'\"")<=line("$")|exe("norm '\" ")|else|exe "norm $" |endif |endif
Bundle 'clarity.vim'

Bundle 'vim-autopep8'
autocmd FileType python map <buffer> <Leader>cc :call Autopep8()<CR>
Bundle 'css_color.vim'
