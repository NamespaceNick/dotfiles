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

Plug 'rust-lang/rust.vim'
Plug 'rust-lang/cargo'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'cespare/vim-toml'
Plug 'romainl/flattened'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/Rainbow-Parenthesis'

call plug#end()

"TODO: Add the Plugin manager/plugins

filetype plugin indent on

" ============================= Plugin Configs =========================

" flattened theme
colorscheme flattened_dark


" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 0


" Neomake
" call neomake#configure#automake('rw', 1000)
" C++ syntax
let g:neomake_cpp_enable_markers=['g++']
let g:neomake_cpp_clang_args = ["-std=c++11"]

" Syntastic
" General settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=0
let g:syntastic_enable_signs=1
highlight SyntasticErrorLine guibg=#550000
highlight SyntasticWarningLine guibg=#331d1e
" Checkers
let g:syntastic_cpp_compiler_options = '-std=c++17 -Wall -Wno-int-to-void-pointer-cast'
let g:syntastic_rust_checkers = ['cargo', 'rustc']
"let g:syntastic_lua_checkers = ['syntastic-checkers-lua', 'luac']
" Python2.7/3.6
function Py2()
  let g:syntastic_python_python_exec = '/usr/local/bin/python2.7'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/usr/local/bin/python3.6'
endfunction

call Py3() " Default to Py3

" ============================= Interface ==============================
syntax enable
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
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

" Language specific shift/tab widths
au FileType python setl shiftwidth=2 tabstop=2
au FileType rust setl shiftwidth=4 tabstop=4
au FileType atlas setl shiftwidth=8 tabstop=8
au FileType cs setl shiftwidth=4 tabstop=4
au FileType python setl background=light
au FileType python colorscheme solarized

" Jump to where you left off when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

let HOMEE=$HOME
" Finding files in spellbound repository
highlight Comment cterm=italic

" ============================== Keymappings ==============================
vnoremap Y :w! ~/.vbuf<CR>
nnoremap P :r ~/.vbuf<CR>
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
" Pane switching
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
" Copy and paste to system keyboard
vmap <C-c> :w! ~/.vbuf<CR>
nmap <C-v> :r ~/.vbuf<CR>
