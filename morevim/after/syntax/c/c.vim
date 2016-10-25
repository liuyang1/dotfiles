" syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
" highlight def link cCustomFunc Function

syn keyword cType UINT UINT64 UINT32 UINT16 UINT8
syn keyword cType INT INT64 INT32 INT16 INT8
syn keyword cType CHAR HRESULT BOOL UCHAR
syn keyword cType HANDLE
syn keyword cType VOID
syn keyword cType uint
syn keyword cConstant FALSE TRUE SUCCESS SUCC S_OK

highlight cVar ctermfg=4 guifg=#66D9EF
"cterm=bold
