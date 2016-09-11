" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Last Change: 2016/09/11 11:28:48.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolor"
" cterm
"hi Normal     ctermfg=white ctermbg=black
hi NonText    ctermfg=red
hi Comment    ctermfg=red        
hi Constant   ctermfg=yellow        
hi Special    ctermfg=darkmagenta    
hi SpecialKey ctermfg=darkmagenta
hi Identifier cterm=bold ctermfg=cyan 
hi Statement  ctermfg=magenta 
hi PreProc    ctermfg=magenta
hi Type       ctermfg=Cyan    
hi Function   ctermfg=Cyan 
hi Repeat     ctermfg=magenta
hi Operator   ctermfg=Red            
hi Ignore     ctermfg=grey
hi Error      ctermbg=Red ctermfg=White 
hi Todo       ctermbg=Yellow ctermfg=Black 
hi User1      ctermbg=blue cterm=inverse,bold
hi User2      ctermbg=magenta cterm=inverse,bold
hi LineNr     ctermfg=yellow cterm=bold
hi PMenuSel   ctermfg=white ctermbg=darkgreen cterm=bold
hi DiffAdd    ctermbg=blue
hi DiffChange ctermbg=darkgreen
hi DiffDelete ctermbg=red
hi DiffText   ctermbg=darkyellow
" gui
hi Normal     guifg=#cccccc guibg=#002c2d
hi Comment    guifg=salmon
hi Constant   guifg=yellow
hi Special    guifg=orchid
hi Identifier guifg=orchid
hi Statement  guifg=orchid
hi PerProc    guifg=orchid
hi Type       guifg=Orange
hi Function   guifg=GoldenRod1
hi Repeat     guifg=orchid
hi Operator   guifg=red
hi Ignore     guifg=white
hi Error      guifg=black guibg=yellow gui=bold
hi Todo       guifg=black guibg=yellow gui=bold
hi Search     guifg=#002c2d guibg=#cccccc
hi Cursor     guifg=white guibg=red
hi CursorLine guibg=#002c2d
hi Visual     guifg=white guibg=black
hi Note       guifg=black guibg=yellow gui=bold
hi NonText    guifg=grey50 gui=none
hi User1      guibg=blue gui=inverse,bold
hi User2      guibg=brown gui=inverse,bold
hi LineNr     guifg=black guibg=khaki gui=bold
hi CursorLineNr guifg=black guibg=Yellow
hi SpecialKey guifg=grey50 gui=none
hi PMenuSel  guibg=SeaGreen

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Conditional    Repeat
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special
hi link helpNote       Todo

" Calndar
hi CalSunday guifg=Red
hi CalSaturday guifg=Cyan
hi CalToday guifg=Yellow
