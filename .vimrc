syntax on
set nu
set smartindent
set ruler
set timeoutlen=0
nmap <space> viw
map m :call ToggleRNU()<cr>

function! ToggleRNU()
	if (&relativenumber == 1)
		set nu
	else
		set rnu
	endif
endfunc
