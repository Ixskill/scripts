set background=dark
set nocompatible              " be iMproved, required
filetype off                  " required

" {{{ Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Conque shell {{{
Plugin 'lrvick/Conque-Shell'
"}}}

" Color{{{
Plugin 'fabi1cazenave/kalahari.vim'
Plugin 'cocopon/iceberg.vim'
"}}}

" VIM-EASY-ALIGN{{{
Plugin 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
xmap na <Plug>(EasyAlign)

"}}}

" VIM-NERDTREE{{{
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Starts nerdtree if no arg was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"}}}

" VIM-EASYTAGS {{{
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
let g:easytags_async=1
"}}}

"VIM-TAGBAR{{{
Plugin 'majutsushi/tagbar'
let g:tagbar_left = 1
nnoremap <C-w><Tab>o :TagbarToggle<cr>
nnoremap <C-w><Tab>p :TagbarTogglePause<cr>
"}}}

" BASE-16{{{
Plugin 'chriskempson/base16-vim'
if filereadable(expand("~/.vimrc_background")) && $auto_style == "base16"
	let base16colorspace=256
	source ~/.vimrc_background
endif
" }}}

" VIM-POWERLINE
Plugin 'Lokaltog/vim-powerline'

" VIM-BUFTABLINE
Plugin 'ap/vim-buftabline' 

" VIM-FUGITIVE
Plugin 'tpope/vim-fugitive'

" VIM-GITGUTTER
"Plugin 'airblade/vim-gitgutter'

" VIM-SYNTASTIC {{{
Plugin 'vim-syntastic/syntastic'

let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror'

"	Syntastic options	
let g:syntastic_c_include_dirs = ['includes', 'libft/includes']
hi! SyntasticError ctermbg=none ctermfg=red cterm=UNDERLINE
"}}}

" COMMENTARY
Plugin 'tpope/vim-commentary'


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

"	}}}

"		HUD and Clarity	{{{
"	Here are set the variable that define what my vim looks like, and how it behaves

"	Color, font and syntax {{{
set encoding=utf-8				"Enbaling utf8


"Loading fancy font on archlinux
if $HOSTNAME == "ade-sede-arch"
	let g:Powerline_symbols = 'fancy'
else
	let g:Powerline_symbols = 'compatible'
endif

"Loading my color scheme at ~/.vim/colors/.
" if $base16 != "true"
	" color atom-dark-256
	" color ade-sede
	" color iceberg
" endif

" End of color and fonts}}}

" This syntax group allows me to match empty lines.
syntax match EmptyLines "^$"

"	Size of the manual tabulation and auto indent tabulation (in spaces)
set tabstop=4
set shiftwidth=4

"	The line where the cursor is is highlighted
set cursorline
" Making a dummy sign column
" sign define dummy
" autocmd	BufAdd,BufRead,BufNewFile * :execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


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
	" autocmd FileType c vnoremap <silent><localleader>c :<BS><BS><BS><BS><BS>silent! call CComment_42()<cr>
	" autocmd FileType c source $HOME/.vim/syntax/c.vim
	autocmd FileType c nnoremap <localleader>C A//			REMOVE		<esc>
	" autocmd FileType c setlocal foldmethod=expr
	autocmd FileType c setlocal foldmethod=marker
	autocmd FileType c setlocal foldmarker=#if,#endif
	autocmd FileType c setlocal foldexpr=GetCPreProcFoldLevel(v:lnum)
	autocmd FileType c set makeprg=clear\ &&\ make
augroup END
"	}}}

"	C_header {{{
augroup c_header
	autocmd BufAdd,BufNewFile,BufRead *.h setlocal comments=sO:/*,m1:**,ex:*/,f://
	" autocmd BufAdd,BufNewFile,BufRead *.h vnoremap <silent><localleader>c :<BS><BS><BS><BS><BS>silent! call CComment_42()<cr>
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
set backupdir=~/.vim/backup "Sets backupdirectory for all swp files"
set directory=~/.vim/backup "}}}

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


"		Toggles hlsearch on/off
nnoremap <leader>n :nohl<cr>

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

inoremap jk <esc>

"	Unmapping arrows.
nnoremap <Up> <nop>
inoremap <Up> <nop>
nnoremap <Down> <nop>
inoremap <Down> <nop>
nnoremap <Right> <nop>
inoremap <Right> <nop>
nnoremap <Left> <nop>
inoremap <Left> <nop>

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
"
"	}}}

"	Functions {{{

" TREEE
func! Ptree()
	while line('.') != line('$')
		if getline('.') =~ "^\s\+->.*"
			echom "Found empty line"
			echom line('.')
			put ="
		else
			echom "Found full line"
			echom line('.')
			normal viwy
		endif
		normal j
	endwhile
endfunc

"	Emergency mapping to recreate a basic backspace routine.
func! Backspace()
	if col('.') == 1
		if line('.') != 1
			return "\<ESC>kgJa"
		else
			return ""
		endif
	else
		return "\<Left>\<Del>"
	endif
endfunc			

"	Puts a printf with colors and #.
function! PrintDebug(...)
	let l:str_debug = "\"MAG\"#\"CYN\"%s\"MAG\"#\"RESET\""
	let l:int_debug = "\"MAG\"#\"CYN\"%d\"MAG\"#\"RESET\""
	let l:size_t_debug = "\"MAG\"#\"CYN\"%zu\"MAG\"#\"RESET\""
	let l:res = "dprintf(2, "
	let	l:count = 0
	let l:arg_list = deepcopy(a:000)
	for arg in arg_list
		if l:count % 2 == 0
			if (arg == "str" || arg == "string")
				let arg = l:str_debug
			elseif (arg == "int")
				let arg = l:int_debug
			elseif (arg == "size_t")
				let arg = l:size_t_debug
			else
				let arg = "\"" . arg . "\""
			endif
		else
			if l:count != a:0 - 1
				let arg = ", " . arg . ", "
			else
				let arg = ", " . arg
			endif
		endif
		let l:count += 1
		let l:res = l:res . arg
	endfor
	let l:res = l:res . ");"
	put =l:res
endfunction

"Folds every conditional preprocessing from the first #if to #endif
"Doesnt work in nested IFs.

function! GetCPreProcFoldLevel(lnum)
endfunc

function! FoldPreProc(arg)
	let l:number = a:arg
	while l:number > 0
		call search ('#if')
		let l:fold_start = line('.')
		call search ('#endif')
		let l:fold_end = line('.')
		execute l:fold_start.','.l:fold_end 'fold'
		let l:number -= 1
	endwhile
endfunc

" This functions shows us to what HL/syntax group an express belongs
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"			}}}

" Commands{{{
command! -nargs=1 Search call setqflist([]) | silent! bufdo vimgrepadd! <args> %
" }}}

"{{{ Syntax
syntax keyword TODO contained NOTE
"}}}
