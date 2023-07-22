" Vim config file
" Nicolas Williams. December 19th, 2017

" ============================= Plugins ==============================
" Better Vim
set nocompatible
" For plugin manager
filetype off
" TODO: 

" Plugins
" If Vim.plug is not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'cespare/vim-toml'
Plug 'micha/vim-colors-solarized'
" Plug 'romainl/flattened'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/Rainbow-Parenthesis'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Glench/Vim-Jinja2-Syntax'
" python linter
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax'
" Plug 'psf/black'
Plug 'vim-test/vim-test'

call plug#end()

"TODO: Add the Plugin manager/plugins

filetype plugin indent on

" ============================= Plugin Configs =========================

" flattened theme
" colorscheme flattened_dark
" account for terminal colorscheme
colorscheme solarized
set background=dark


" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 0


" Neomake
" call neomake#configure#automake('rw', 1000)
" C++ syntax
let g:neomake_cpp_enable_markers=['g++']
let g:neomake_cpp_clang_args = ["-std=c++11"]

" ale python syntax checker
let g:ale_virtualenv_dir_names = ["env"]
let g:ale_linters = { 'python': ['flake8'] }
let g:ale_python_flake8_options = '--max-line-length=88'


let g:ale_fixers = { 'python': ['black', 'trim_whitespace', 'remove_trailing_lines', 'isort'] }

let g:ale_fix_on_save = 1

function Py3()
  let g:syntastic_python_python_exec = '/usr/local/bin/python3.6'
endfunction

" TODO: Add python syntax highlighting for f-strings
call Py3() " Default to Py3

" ============================= Interface ==============================
syntax enable
set autoindent
set backspace=indent,eol,start
set colorcolumn=88
" set expandtab
set incsearch
set matchpairs+=<:>
set number
set pastetoggle=<f5>
set ruler
set shiftwidth=2
set smartcase
set smarttab
set smartindent
set tabstop=2
set ttyfast
set wrap
set clipboard=unnamed
" Allow a large global buffer
set viminfo+=<1000
set visualbell "Disable Windows terminal bell

" Language specific shift/tab widths
" au FileType python setl shiftwidth=2 tabstop=2
au FileType rust setl shiftwidth=4 tabstop=4
au FileType atlas setl shiftwidth=8 tabstop=8
au FileType cs setl shiftwidth=4 tabstop=4

" FORMATTERS (REQUIRES PRETTIER via 'npm install -g prettier')
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" Jump to where you left off when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

highlight Comment cterm=italic

"#############################################################################
"############################ SYNTAX HIGHLIGHTING ############################
"#############################################################################
let g:python_highlight_all = 1

" ============================== Keymappings ==============================
" nmap means 'map a key sequence when in normal mode' (see vim's docs).
" <silent> tells vim to show no message when this key sequence is used.
" <leader> means the key sequence starts with the character assigned to
" variable mapleader -- a backslash, if no let mapleader = statement has
" executed yet at the point nmap executes.
vnoremap <C-y> :w! ~/.vbuf<CR>
nnoremap <C-p> :r ~/.vbuf<CR>
" Easier exiting insert mode
:imap jk <Esc>
:imap JK <Esc>
" Better mark jumping
:nnoremap ` ;
:nnoremap ; `
" Space is easier than ':'
:noremap <Space> :
"Enter to insert a new line w/o entering insert mode
:nmap <Enter> o<Esc>
" Smart paste when pasting
nmap <silent> ,p :SmartPaste<cr>
" Copy and paste to system keyboard
vmap <C-c> :w! ~/.vbuf<CR>
nmap <C-v> :r ~/.vbuf<CR>
map <C-n> :NERDTreeToggle<CR>
" Control + Backspace deletes word-by-word
imap <C-BS> <C-W> 
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" vim-test shortcuts
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>



" =========================== Custom Functions ============================
" Create comment headers (triple lined comment surrounded by # symbol
function CommentHeader(title)
	let commentString = '##############################################################################'
	let currLine = line(".")
	" string lengths
	let comStrLen = strlen(commentString)
	let titleStrLen = strlen(a:title)
	let numHashes = comStrLen - (titleStrLen + 2)
	" if even number of hashes
	let evenOddEqualizer = (numHashes % 2) == 0 ? 0 : 1
	let leftHash = commentString[0:float2nr(numHashes / 2 + evenOddEqualizer - 1)]
	let rightHash = commentString[0:float2nr(numHashes / 2 - 1)]
	let middleLine = join([leftHash, toupper(a:title), rightHash])
	call append(currLine, [commentString, middleLine, commentString])
endfunction
