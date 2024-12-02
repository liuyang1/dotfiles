" Author        : lyz
" Created       : 04/01/2024
" License       : MIT
" Description   : 

syn keyword Tag TODO XXX NOTES NOTE NOTE: >>> AFK BAK YYY FAIL Pomo BAD ERROR WARN BLOCK WHY RED <<< HOWTO WHERE WHO

syn match Todo /#\w\+/
"syn match Todo /@\w\+/
syn match VimwikiTodo /@\w\+\(\.\w\+\)\?/
syn keyword VimwikiTodo     BLUE

syn keyword VimwikiListTodo Doing Pending GOOD PASS DONE CLOSED QED SUCC ACK Q: A: TODAY CONCLUSION GREEN WORK YES SLN

syn keyword MatchParen YELLOW
