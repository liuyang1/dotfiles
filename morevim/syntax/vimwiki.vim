" Author        : lyz
" Created       : 04/01/2024
" License       : MIT
" Description   : 

syn keyword Tag TODO XXX NOTES NOTE >>> AFK BAK YYY FAIL Pomo BAD ERROR WARN BLOCK WHY

syn match Todo /#\w\+/
"syn match Todo /@\w\+/
syn match VimwikiTodo /@\w\+\(\.\w\+\)\?/

syn keyword VimwikiListTodo Pending GOOD PASS DONE CLOSED QED SUCC ACK Q A TODAY CONCLUSION
