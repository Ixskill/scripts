"Used documentation :	http://items.sjbach.com/319/configuring-vim-right 
"						https://gist.github.com/joegoggins/8482408

"----------------Options-------------------------"
"		HUD and CLarity
syntax on											"Easier to read with syntax highlight ;)
set ruler											"Ruler enabled bottom right of the screen
set nu												"Activates line number
set listchars=tab:>-,trail:·,eol:$					"Creates a list of characters -> Tab is now represented by >- and so on
set smartindent										"Activates auto indentation
set scrolloff=3										"Starts scrolling X times before the cursor reaches the bottom/top of the screen
set sidescrolloff=7									"Starts scrolling X times before the cursor reaches the right/left of the screen

"		Comfort
set visualbell										"Disables sound
set mouse=a											"Enables mouse cursor

"		Buffer and file related
set autoread										"Keeps track of changes done outside vim
set history=1000									"Vim now remembers the 1000 last cmd you used
set timeoutlen=500									"The time you have to complete the command before it expires
set hidden											"Allows buffer to be set in BG without writing on the disk
autocmd BufNewFile * :write							"

"		Swapfiles
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "Sets backupdirectory for all swp files"
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"		Command completion
set wildmenu										"Using <TAB> in the command line displays your options for completion
set wildmode=list:longest							"Wildmenu behaves like shell (completion to point of ambiguity"
set wildignore=*.o,*.swp							"Files to ingore when browsing and completing options

"------------------Key mapping----------------------------
"		Setting up mapleader key
let mapleader = ","
"		Single / double quotes a word ( why not ? )
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"		Toggles hlsearch on/off
nnoremap <leader>n :set hlsearch!<cr>
"       Selects a full word in visual mode"
nnoremap <silent> <space> viw					

"		Toggles display of tabs and newline
nmap <silent> <leader><tab> :set nolist!<CR>

"		Opens and sources the vimrc file  ## NOTE : set env variable to the right path
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"		Toggles relative number notation on/off
nnoremap <silent> <C-l> :call ToggleRNU()<cr>
"----------------Fonctions----------------------------
function! ToggleRNU()
	if (&relativenumber == 1)
		set nu
	else
		set rnu
	endif
endfunc
