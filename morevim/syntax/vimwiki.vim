" Author        : lyz
" Created       : 04/01/2024
" License       : MIT
" Description   : 

syn keyword Tag TODO XXX NOTES NOTE NOTE: >>> AFK BAK YYY FAIL Pomo BAD ERROR WARN BLOCK WHY RED <<< HOWTO WHERE WHO WRONG ACTION

syn match Todo /#\w\+/
"syn match Todo /@\w\+/
syn match VimwikiTodo /@\w\+\(\.\w\+\)\?/
syn keyword VimwikiTodo     BLUE

syn keyword VimwikiListTodo Doing Pending GOOD PASS SUCC ACK Q: A: TODAY WORK YES SLN

syn keyword MyFinish DONE CLOSED QED CONCLUSION GREEN

hi MyFinish ctermbg=2 ctermfg=black cterm=italic,bold
syn keyword MatchParen YELLOW
