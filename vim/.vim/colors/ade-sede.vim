hi clear
if exists("syntax_on")
	syntax reset
endif

hi Normal       ctermfg=254 ctermbg=235  guibg=black cterm=NONE
" A bit of syntax

syntax keyword TODO contained NOTE
hi def link cOperator Operator

" Search
hi IncSearch    ctermfg=NONE   ctermbg=13   cterm=NONE
hi Search       ctermfg=NONE   ctermbg=13   cterm=NONE

" Messages
" TODO

" Cursor and linenr
hi Cursor       ctermfg=252 ctermbg=235 cterm=NONE
hi CursorLine               ctermbg=234 cterm=NONE
hi CursorLineNr ctermfg=81   ctermbg=234 cterm=NONE
hi LineNr	ctermfg=0		cterm=BOLD


" Syntax group
hi Search	ctermfg=255	ctermbg=163	cterm=BOLD
hi cFunctionTag	ctermfg=green
hi SignColumn	ctermbg=234
hi Comment      ctermfg=grey	ctermbg=237	term=ITALIC
hi Constant     ctermfg=9	ctermbg=NONE	cterm=NONE
hi Error        ctermfg=252	ctermbg=NONE	cterm=NONE
hi Identifier   ctermfg=11	ctermbg=NONE	cterm=NONE
hi Ignore       ctermfg=1	ctermbg=1	cterm=NONE
hi PreProc      ctermfg=5	ctermbg=NONE	cterm=NONE
hi Special      ctermfg=107	ctermbg=NONE	cterm=NONE
hi Statement    ctermfg=74	ctermbg=NONE	cterm=NONE
hi Todo         ctermfg=1	ctermbg=237		cterm=BOLD
hi Type         ctermfg=3	ctermbg=NONE	cterm=BOLD
hi Underlined                          		cterm=UNDERLINE
hi Include      ctermfg=5 ctermbg=NONE   	cterm=NONE
hi Conditional  ctermfg=74  ctermbg=NONE   	cterm=BOLD
hi Operator  ctermfg=74  ctermbg=NONE   	cterm=BOLD
hi Repeat  ctermfg=74  ctermbg=NONE   	cterm=BOLD
hi String       ctermfg=107 ctermbg=NONE	cterm=NONE
hi Struct		ctermfg=blue	ctermbg=NONE
hi NOTE         ctermfg=1   ctermbg=242   	cterm=BOLD

"		Tabline color settings
"	Tablinesel -> Current buffer the cursor is on
"
hi TabLineSel	ctermfg=81	ctermbg=238 cterm=BOLD

"	PemenuSel -> Buffers that are displayed in a pane
hi PmenuSel	ctermfg=255 ctermbg=234

"	Fill -> the empty part
hi TablineFill	ctermbg=234			cterm=NONE

"	Inactive buffers
hi Tabline	ctermfg=grey	ctermbg=234	cterm=NONE

" Other
hi Directory    ctermfg=252 ctermbg=NONE   cterm=NONE
hi NonText      ctermfg=252 ctermbg=NONE   cterm=NONE
hi SpecialKey   ctermfg=252 ctermbg=NONE   cterm=NONE
hi Title        ctermfg=107 ctermbg=NONE   cterm=NONE
hi Visual       ctermfg=0   ctermbg=3   cterm=NONE

" Diff
hi DiffAdd      ctermfg=0   ctermbg=113 cterm=NONE
hi DiffDelete   ctermfg=0   ctermbg=52  cterm=NONE
hi DiffChange   ctermfg=0   ctermbg=4   cterm=NONE
hi DiffText     ctermfg=0   ctermbg=37  cterm=NONE
hi diffAdded    ctermfg=113 ctermbg=NONE   cterm=NONE
hi diffRemoved  ctermfg=1   ctermbg=NONE   cterm=NONE
