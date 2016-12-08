"----------------Options-------------------------"
syntax on										"Easier to read with syntax highlight ;)
set nu											"Activates line number
set visualbell									"Disables sound
set autoread									"Keeps track of changes done outside vim
set mouse=a										"Enables mouse cursor
set smartindent									"Activates auto indentation
set ruler										"Ruler enabled bottom right of the screen
set timeoutlen=0								"Getting out of visual mode faster
set hidden										"Allows buffer to be set in BG without writing on the disk


"------------------Key mapping----------------------------
let mapleader = "m"
"       Selects a full word in visual mode"
nnoremap <space> viw							
nnoremap <leader> :call ToggleRNU()<cr>
"		Open and source the vimrc file
nnoremap \ :vsplit $MYVIMRC<cr>
nnoremap " :source $VIMRC<cr>

"----------------Fonctions----------------------------
function! ToggleRNU()
	if (&relativenumber == 1)
		set nu
	else
		set rnu
	endif
endfunc
