"Used documentation :	http://items.sjbach.com/319/configuring-vim-right 
"						https://gist.github.com/joegoggins/8482408

"----------------Options-------------------------"
syntax on											"Easier to read with syntax highlight ;)
set nu												"Activates line number
set visualbell										"Disables sound
set autoread										"Keeps track of changes done outside vim
set mouse=a											"Enables mouse cursor
set smartindent										"Activates auto indentation
set history=1000									"Vim now remembers the 1000 last cmd you used
set ruler											"Ruler enabled bottom right of the screen
set timeoutlen=0									"Getting out of visual mode faster
set hidden											"Allows buffer to be set in BG without writing on the disk
set wildmenu										"Using <TAB> in the command line displays your options for completion
set wildmode=list:longest							"Wildmenu behaves like shell (completion to point of ambiguity"
set scrolloff=3										"Starts scrolling X times before the cursor reaches the bottom/top of the screen
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "Sets backupdirectory for all swp files"
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"------------------Key mapping----------------------------
let mapleader = ","
"       Selects a full word in visual mode"
nnoremap <space> viw							
nnoremap m :call ToggleRNU()<cr>
"		Open and source the vimrc file
nnoremap \ :vsplit $MYVIMRC<cr>
nnoremap " :source $MYVIMRC<cr>

"----------------Fonctions----------------------------
function! ToggleRNU()
	if (&relativenumber == 1)
		set nu
	else
		set rnu
	endif
endfunc
