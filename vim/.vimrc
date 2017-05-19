"	Vundle plugins{{{
set background=dark
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color
Plugin 'fabi1cazenave/kalahari.vim'
Plugin 'cocopon/iceberg.vim'

" VIM-POWERLINE
Plugin 'Lokaltog/vim-powerline'

" VIM-BUFTABLINE
Plugin 'ap/vim-buftabline' 

" VIM-FUGITIVE
Plugin 'tpope/vim-fugitive'

" VIM-GITGUTTER
"Plugin 'airblade/vim-gitgutter'

" VIM-SYNTASTIC
Plugin 'vim-syntastic/syntastic' " VIM-COMMENTARY
Plugin 'tpope/vim-commentary'

" VIM-LLDB


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"		}}}

"	Buffer navigation mappings and panes{{{
nmap <C-w>1 <Plug>BufTabLine.Go(1)<C-c>
nmap <C-w>2 <Plug>BufTabLine.Go(2)<C-c>
nmap <C-w>3 <Plug>BufTabLine.Go(3)<C-c>
nmap <C-w>4 <Plug>BufTabLine.Go(4)<C-c>
nmap <C-w>5 <Plug>BufTabLine.Go(5)<C-c>
nmap <C-w>6 <Plug>BufTabLine.Go(6)<C-c>
nmap <C-w>7 <Plug>BufTabLine.Go(7)<C-c>
nmap <C-w>8 <Plug>BufTabLine.Go(8)<C-c>
nmap <C-w>9 <Plug>BufTabLine.Go(9)<C-c>
nmap <C-w>0 <Plug>BufTabLine.Go(10)<C-c>

"	YOLO -> Unmapping arrows. Time to grow up
nnoremap <C-w><Up> <nop>
inoremap <C-w><Up> <nop>
nnoremap <C-w><Down> <nop>
inoremap <C-w><Down> <nop>
nnoremap <C-w><Right> <nop>
inoremap <C-w><Right> <nop>
nnoremap <C-w><Left> <nop>
inoremap <C-w><Left> <nop>
"	}}}

"		HUD and CLarity	{{{
"	Here are set the variable that define what my vim looks like, and how it behaves

"	Color, font and syntax {{{
set encoding=utf-8				"Enbaling utf8

let g:Powerline_symbols = 'compatible' "Just loading fancy font

color ade-sede					"Loading my color scheme at ~/.vim/colors/.

" End of color and fonts}}}

"	Size of the manual tabulation and auto indent tabulation (in spaces)
set tabstop=6
set shiftwidth=6

"	The line where the cursor is is highlighted
set cursorline
" Making a dummy sign column
sign define dummy
autocmd	BufAdd,BufRead,BufNewFile * :execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


set hlsearch	"Turns highlight on search

set incsearch	"Highlight is real-time

set numberwidth=5				"Size of the number column

syntax enable					"Easier to read with syntax highlight ;)

set ruler						"Ruler enabled bottom right of the screen

set nu							"Activates line number

set listchars=tab:>-,trail:·,eol:$			"Creates a list of characters -> Tab is now represented by >- and so on

set smartindent						"Activates auto indentation

set scrolloff=3						"Starts scrolling X times before the cursor reaches the bottom/top of the screen

set sidescrolloff=7					"Starts scrolling X times before the cursor reaches the right/left of the screen

set visualbell						"Disables sound

set autoread						"Keeps track of changes done outside vim

set history=1000					"Vim now remembers the 1000 last cmd you used

set timeoutlen=500					"The time you have to complete the command / mapping before it expires

set hidden						"Allows buffer to be set in BG without writing on the disk

"	Statusline settings {{{
set laststatus=2					"The status bar is always displayed at the bottom
set statusline+=%F

"					}}}

"				}}}

"		Augroups and autocmd related {{{
"	Augroups are a group of autocmd, and autocmd are a group of behaviors vim should have when a certain event is triggered
"	For exemple : 	- A Filetype being spotted
"			- The buffer being updated


"		TODO FILES {{{
augroup TODO_files
	autocmd!
	" autocmd BufAdd,BufRead,BufNewFile TODO set tw=79
	" autocmd BufAdd,BufRead,BufNewFile TODO set fo+=t
	" autocmd BufAdd,BufRead,BufNewFile TODO set fo-=l
	autocmd BufAdd,BufRead,BufNewFile TODO set smartindent
	" autocmd BufAdd,BufRead,BufNewFile TODO inoremap ( ()<left>
	" autocmd BufAdd,BufRead,BufNewFile TODO inoremap [ []<left>
	" autocmd BufAdd,BufRead,BufNewFile TODO inoremap ' ''<left>
	" autocmd BufAdd,BufRead,BufNewFile TODO inoremap " ""<left>
	autocmd BufAdd,BufRead,BufNewFile TODO setlocal tw=80
	autocmd BufAdd,BufRead,BufNewFile TODO setlocal foldmethod=marker
	autocmd BufAdd,BufRead,BufNewfile :hi Folded ctermfg=NONE ctermbg=NONE
augroup END
"		}}}

"		Vim files {{{
augroup vim_files
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker
	autocmd Filetype vim let maplocalleader = ","
	"autocmd Filetype vim nnoremap <buffer> <localleader>c I"<esc>
augroup	END
"}}}

"	C files {{{
augroup c_files
	autocmd!
	autocmd FileType c setlocal comments=sO:/*,m1:**,ex:*/,f://
	autocmd FileType c let maplocalleader = ","
	autocmd FileType c vnoremap <silent><localleader>c :<BS><BS><BS><BS><BS>silent! call CComment_42()<cr>
	autocmd FileType c source $HOME/.vim/syntax/c.vim
	autocmd FileType c nnoremap <localleader>C A//			REMOVE		<esc>
	autocmd FileType c set makeprg=clear\ &&\ make
augroup END
"	}}}

"	C_header {{{
augroup c_header
	autocmd FileType h setlocal comments=sO:/*,m1:**,ex:*/,f://
	autocmd FileType h let maplocalleader = ","
	autocmd FileType h vnoremap <silent><localleader>c :<BS><BS><BS><BS><BS>silent! call CComment_42()<cr>
augroup END
"}}}

"	Zsh files {{{
augroup sh_files
	autocmd!
	autocmd FileType zsh let maplocalleader = ","
	"autocmd	FileType zsh nnoremap <buffer> <localleader>c I#<esc>
	" autocmd FileType zsh inoremap ( ()<left>
	" autocmd FileType zsh inoremap [ []<left>
	" autocmd FileType zsh inoremap ' ''<left>
	" autocmd FileType zsh inoremap " ""<left>
	" autocmd FileType zsh inoremap { {<cr>}<up><esc>$i<right><cr>
	"autocmd FileType zsh inoremap { {<cr>}<up><esc>$i<cr>
augroup END
"	}}}


"		END AUGROUPS !!	}}}

"		Swapfiles {{{
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "Sets backupdirectory for all swp files"
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "}}}

"		Command completion {{{
set wildmenu										"Using <TAB> in the command line displays your options for completion
set wildmode=list:longest							"Wildmenu behaves like shell (completion to point of ambiguity)"
set wildignore=*.o,*.swp							"Files to ingore when browsing and completing options }}}

"		Key Mappings {{{
"	This section is about mappings ( binds if you prefer


"		Insert NEWLINE and stay in normal mode
nmap <Cr> o<esc>

"		Setting up mapleader key
let mapleader = ","

"		toggle paste on/off
nnoremap <leader>p : set paste!<cr>

"		Toggles hlsearch on/off
nnoremap <leader>n :nohl<cr>

"       Selects a full word in visual mode" nnoremap <silent> <space> viw					
"		Toggles display of tabs and newline
nmap <silent> <leader><tab> :set nolist!<CR>

"		Opens and sources the vimrc file  ## NOTE : set env variable to the right path
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"		Toggles relative number notation on/off
nnoremap <silent> <C-l> :set rnu! <cr>

"		<C-o> after the window prefix now inverts panes positions
nnoremap <C-w><C-o> <C-w><C-r>

"		Echoms the syntax group the word under the cursore belongs to
nnoremap <leader>sp :call <SID>SynStack()<CR>

"	YOLO -> Unmapping arrows. Time to grow up
nnoremap <Up> <nop>
inoremap <Up> <nop>
nnoremap <Down> <nop>
inoremap <Down> <nop>
nnoremap <Right> <nop>
inoremap <Right> <nop>
nnoremap <Left> <nop>
inoremap <Left> <nop>

"	As my delimiters are automatically closing, sometimes i need to get out
"	of insert mode, la, just to keep typing on the other side of the
"	delilimiter. so i mapped it
inoremap <S-Tab> <esc>la

"	Emergency backspace mapping
inoremap <BS> <c-r>=Backspace()<CR>
"		Surrounds {{{
"	Here we define mappins to surround words / selections with a symbol

" Brackets
nnoremap <silent><leader>{ O{<esc><down>o}<up><up><cr>
vnoremap <silent><leader>{ c{<cr>}<up><cr><esc>P=<up>

"Single / double
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>' c''<esc>P
vnoremap <leader>" c""<esc>P

"Parentheses
vnoremap <leader>( c()<esc>P
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
vnoremap <leader>[ c[]<esc>P
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel


"	}}}
"	}}}

"		Functions {{{
"	In this part we setup a few functions
"	Fonction to start a block comment that fits 42's norm
func CComment_42()
	let l:comments = &comments
	set comments=
	let l:start_line = line("'<")
	let l:end_line = line("'>")
	let l:nb_line = l:end_line - l:start_line
	let index = 0
	call cursor(l:start_line, 1)
	normal! O/*
	let l:start_line += 1
	let l:end_line += 1
	echom l:nb_line
	while index <= l:nb_line
		call cursor(l:start_line + index, 1)
		normal! i**	
		let index += 1
	endwhile
	call cursor(l:end_line, 1)
	normal! o
	normal! I*/
	let &comments=l:comments
endfunc

"	Emergency mapping to recreate a basic backspace fcts.
func Backspace()
	if col('.') == 1
		if line('.') != 1
			return "\<ESC>kgJi"
		else
			return ""
		endif
	else
		return "\<Left>\<Del>"
	endif
endfunc			

" This functions shows us to what HL/syntax group an express belongs
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"			}}}

syntax keyword TODO contained NOTE
source $DOTFILES/zaz_header.vim
