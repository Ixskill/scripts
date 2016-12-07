syntax on
set nu
set smartindent
set ruler
set timeoutlen=0
nmap <space> viw
map m :call ToggleRNU()<cr>
autocmd BufNewFile * :write
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
function! ToggleRNU()
	if (&relativenumber == 1)
		set nu
	else
		set rnu
	endif
endfunc
