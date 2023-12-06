" syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
" highlight def link cCustomFunc Function

syn keyword cType UINT UINT64 UINT32 UINT16 UINT8
syn keyword cType INT INT64 INT32 INT16 INT8
syn keyword cType CHAR HRESULT BOOL UCHAR
syn keyword cType HANDLE
syn keyword cType HANDLE_T
syn keyword cType ADDR_T
syn keyword cType SIZE_T
syn keyword cType VOID
syn keyword cType uint
syn keyword cType u8 s8 u16 s16 u32 s32 u64 s64
syn keyword cConstant FALSE TRUE SUCCESS SUCC S_OK

" support C function's highlight
syn match cCustomParen "(" contains=cParen,cCppParen
syn match cCustomFunc "\w\+\s*(" contains=cCustomParen
syn match cCustomScope "::"
syn match cCUstomClass "\w\+\s*::" contains=cCustomScope

highlight cVar ctermfg=4 guifg=#66D9EF
hi def link cCustomFunc Function
hi def link cCustomClass Function

" support C's macro
syn match cCustomMacro "\<\([A-Z_][A-Z0-9_]\+\)\>"
hi def link cCustomMacro Macro

"cterm=bold
