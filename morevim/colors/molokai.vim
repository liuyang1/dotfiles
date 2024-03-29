" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"

hi clear Normal
set bg&

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif


hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
" setting fg color for diff, it's annoy.
hi DiffAdd         guibg=#162A1E
hi DiffChange      guibg=#162A1E
hi clear DiffDelete
hi DiffDelete      guibg=#301020
hi DiffText        guibg=#4C4745 gui=italic,bold
" gigutter plugin highlight
" keep same background with SignColumn
hi GitGutterAdd    guifg=#afd700 guibg=#262626 ctermfg=green
hi GitGutterChange guifg=#ffaf00 guibg=#262626 ctermfg=yellow
hi GitGutterDelete guifg=#F92672 guibg=#262626 ctermfg=red

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guibg=#AD1457

" hi Search          guifg=#000000 guibg=bg
" marks column
" hi SignColumn      guifg=#A6E22E guibg=#232526
hi SignColumn      ctermbg=235   guibg=#262626
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
" listchars
hi SpecialKey      guifg=#585A55
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
" hi Tag             guifg=#F92672               gui=italic
" 换一种浅红色
hi Tag             guifg=#E46D6C               gui=bold
hi Title           guifg=#ef5939
hi Todo            guifg=#707070 guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000
hi ColorColumn     guibg=#303030

if s:molokai_original == 1
   hi Normal          guifg=#F8F8F2 guibg=#272822
   hi Comment         guifg=#75715E
   hi CursorLine                    guibg=#3E3D32
   hi CursorColumn                  guibg=#3E3D32
   hi LineNr          guifg=#BCBCBC guibg=#3B3A32
   hi NonText         guifg=#BCBCBC guibg=#3B3A32
   hi Conceal         guifg=#F92672 guibg=#272822
else
   hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
   hi Comment         guifg=#465457
   hi CursorLine                    guibg=#293739
   hi CursorColumn                  guibg=#293739
   hi LineNr          guifg=#BCBCBC guibg=#232526
   hi NonText         guifg=#BCBCBC guibg=#232526
   hi Conceal         guifg=#F92672 guibg=#1B1D1E
end

"
" Support for 256-color terminal
"
if &t_Co > 255
   if s:molokai_original == 1
      hi Normal                   ctermbg=234
      hi CursorLine               ctermbg=235   cterm=none
      hi CursorLineNr ctermfg=208               cterm=none
   else
      hi Normal       ctermfg=252 ctermbg=233
      hi CursorLine               ctermbg=234   cterm=none
      hi CursorLineNr ctermfg=208               cterm=none
   endif
   hi LineNr ctermfg=246 ctermbg=236 guifg=#747474 guibg=#303030
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   " hi DiffAdd                     ctermbg=24
   " hi DiffChange      ctermfg=181 ctermbg=239
   " hi DiffDelete      ctermfg=162 ctermbg=53
   " hi DiffDelete      ctermfg=125 ctermbg=233
   " hi DiffText                    ctermbg=102 cterm=bold
   " Normal is 234, cursorline is 236
   " hi DiffAdd    ctermbg=235  cterm=none
   " hi DiffChange ctermbg=233  cterm=none
   " Normal is 235, cursorline is 236
   hi DiffAdd ctermbg=234 cterm=none
   hi DiffChange ctermbg=233 cterm=none
   hi DiffText   ctermbg=30  cterm=none
   hi DiffDelete      ctermbg=233 cterm=none

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=233  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel        ctermfg=255 ctermbg=242
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253   ctermbg=166   cterm=NONE

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81
   if has("spell")
       hi SpellBad                ctermbg=52
       hi SpellCap                ctermbg=17
       hi SpellLocal              ctermbg=17
       hi SpellRare  ctermfg=none ctermbg=none  cterm=reverse
   endif
   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   " hi Comment         ctermfg=59  cterm=italic
   hi Comment         ctermfg=59
   hi CursorColumn                ctermbg=236
   hi ColorColumn                 ctermbg=236
   " hi LineNr          ctermfg=250 ctermbg=234
   hi LineNr          ctermfg=246 ctermbg=236
   hi NonText         ctermfg=250 ctermbg=234

   hi SpecialKey      ctermfg=59

   if exists("g:rehash256") && g:rehash256 == 1
       hi Normal       ctermfg=252 ctermbg=235
       hi CursorLine               ctermbg=236   cterm=none
       hi CursorLineNr ctermfg=208               cterm=bold

       hi Boolean         ctermfg=141
       hi Character       ctermfg=222
       hi Number          ctermfg=141
       hi String          ctermfg=222
       hi Conditional     ctermfg=197               cterm=bold
       hi Constant        ctermfg=141               cterm=bold

       hi Directory       ctermfg=154               cterm=bold
       hi Error           ctermfg=222 ctermbg=233
       hi Exception       ctermfg=154               cterm=bold
       hi Float           ctermfg=141
       hi Function        ctermfg=154
       hi Identifier      ctermfg=208

       hi Keyword         ctermfg=197               cterm=bold
       hi Operator        ctermfg=197
       " hi Operator        ctermfg=209
       hi PreCondit       ctermfg=154               cterm=bold
       hi PreProc         ctermfg=154
       hi Repeat          ctermfg=197               cterm=bold

       hi Statement       ctermfg=197               cterm=bold
       hi Tag             ctermfg=197
       hi Title           ctermfg=203
       hi Visual                      ctermbg=238

       hi Comment         ctermfg=244
       hi LineNr          ctermfg=239 ctermbg=235
       hi NonText         ctermfg=239
       hi SpecialKey      ctermfg=239
   endif
" self-defined
    highlight Function ctermfg=green
    " highlight SignColumn ctermbg=232
    " highlight cType     ctermfg=yellow cterm=None guifg=#ffaf00
    highlight cType     ctermfg=yellow cterm=None guifg=#FEB257
    highlight Identifier ctermfg=darkyellow
    " highlight SpellBad cterm=bold ctermfg=darkred cterm=reverse
    " highlight Conditional cterm=bold ctermfg=darkred
    " highlight Statement ctermfg=208 cterm=italic
    " highlight Statement cterm=italic ctermfg=darkred
    " highlight Statement cterm=italic ctermfg=197 term=italic
    highlight Statement ctermfg=197
    highlight Comment ctermfg=246 guifg=#566467
    " highlight cUserLabel cterm=italic,underline ctermfg=229
    highlight cUserLabel ctermfg=229
    " highlight CursorLineNr ctermfg=208               cterm=bold
    " highlight CursorLineNr cterm=bold ctermfg=red ctermbg=236

    highlight VimwikiHeader1 ctermfg=darkred cterm=bold guifg=#F92672
    highlight VimwikiHeader2 ctermfg=yellow cterm=bold guifg=#FD971F
    highlight VimwikiHeader3 ctermfg=green cterm=bold guifg=#A6E22E
    highlight VimwikiHeader4 ctermfg=red guifg=#F92672
    highlight VimwikiLink ctermfg=blue guifg=#66D9EF
    highlight VimwikiList ctermfg=darkgreen cterm=bold guifg=#C1F161
    highlight VimwikiBold ctermfg=darkred cterm=bold guifg=#FC5C94
    " highlight VimwikiItalic ctermfg=yellow cterm=italic guifg=#FD971F
    highlight VimwikiItalic ctermfg=yellow guifg=#FD971F
    highlight VimwikiCode ctermbg=235 ctermfg=darkblue guifg=#8DE6F7
    highlight VimwikiPre ctermbg=232 ctermfg=darkgreen guifg=#C1F161

    highlight Normal guifg=#D8D8D2
    highlight Conceal ctermfg=1 ctermbg=234 cterm=bold
end

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
