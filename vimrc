"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"vundle
set nocompatible " required by vundle
filetype off " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ----- Plugins -----
Plugin 'VundleVim/Vundle.vim'
" filesystem
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Syntax for EBNF
Plugin 'ebnf.vim'

" Syntax for python
Plugin 'vim-python/python-syntax'

" Scheme
Plugin 'morhetz/gruvbox'
Plugin 'Solarized'
Plugin 'peaksea'

" statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Collection of ex mappings
Plugin 'unimpaired.vim'

" Python IDE Goodies
Plugin 'davidhalter/jedi-vim'
Plugin 'SuperTab'

" Linting
Plugin 'vim-syntastic/syntastic'
" Plugin 'w0rp/ale' " available on vim8



" ---- End Plugins ---
call vundle#end()
filetype plugin indent on  " enables filetype detection
" To ignore plugin indent changes, instead use:
"filetype plugin on

" End Vundle Settup



" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
set hidden " Allows switching of buffers without writes

" NERDTree
" Close NerdTree if it is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open nerdtree
"autocmd vimenter * NERDTree
" Go to previous (last accessed) window
autocmd VimEnter * wincmd p
" Mapping NERDTree
nnoremap <F5> :NERDTreeToggle<CR>

" Statusbar
set laststatus=2
set ttimeoutlen=50 "fix the pause when leaving insert mode
let g:airline#extensions#tabline#enabled = 1  "display tab buffer


" Syntastic settings
"
let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1 " only shows first by default
let g:syntastic_enable_highlighting = 0 " annoying underscore 
"let g:syntastic_auto_jump = 0
"let g:syntastic_auto_loc_list = 0

" Ignore tab-indents, block-comments, lines at eof
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=W191,E265,W391,E266 --max-line-length=120'

let g:jbowen7_syntastic_toggle = 0
function! ToggleSyntastic()
	let g:jbowen7_syntastic_toggle = !g:jbowen7_syntastic_toggle
	if g:jbowen7_syntastic_toggle
		let g:syntastic_python_checkers = ['flake8', 'pylint']
		:SyntasticCheck
	else
		let g:syntastic_python_checkers = ['flake8']
		:SyntasticReset
	endif
endfunction
nnoremap <F4> :call ToggleSyntastic()<CR>


"split settings
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make backspaces more powerful
set backspace=indent,eol,start

" Set default file encoding to UTF-8
set encoding=utf-8

" colorscheme
set background=dark
colo gruvbox


" syntax
syntax on
let python_highlight_all=1
autocmd BufNewFile,BufRead *.lark set syntax=ebnf

" other options
" the ftplugin will force pep8 indentation
let g:python_recommended_style=0
set nu
set ai
set ts=4
set sw=4

" annoying Q! I should type slower
cmap Q! q! 

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Enable mouse support
"set mouse=a

" Jedi Settings
" Don't let docstring window popup during completion
autocmd FileType python setlocal completeopt-=preview
"let g:jedi#auto_close_doc = 1  " close preview window after completion
"let g:jedi#popup_on_dot = 0 " don't autocomplete
"let g:jedi#popup_select_first = 0


" Keep all .swp/.xswp in one place, avoids additions to .gitignore 
set directory=~/.vim/swapfiles/
