" Vim config file
" Nicolas Williams. December 19th, 2017

" ============================= Plugins ==============================
" Better Vim
set nocompatible
" For plugin manager
filetype off

" Plugins
" If Vim.plug is not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Plug 'altercation/vim-colors-solarized'
Plug 'rust-lang/rust.vim'
Plug 'rust-lang/cargo'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'mhinz/vim-startify'
Plug 'cespare/vim-toml'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'romainl/flattened'
Plug 'majutsushi/tagbar'

call plug#end()

"TODO: Add the Plugin manager/plugins

filetype plugin indent on

" ============================= Plugin Configs =========================

" Solarized
" set background=dark
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized

" flattened
colorscheme flattened_dark


"vim-cpp-enhanced-highlight
" let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1


" Neomake
" call neomake#configure#automake('rw', 1000)
" C++ syntax
let g:neomake_cpp_enable_markers=['g++']
let g:neomake_cpp_clang_args = ["-std=c++14"]

" Syntastic
" General settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs=1
highlight SyntasticErrorLine guibg=#550000
highlight SyntasticWarningLine guibg=#331d1e
" Cplusplus
let g:syntastic_cpp_compiler_options = '-std=c++17 -Wconversion -Wall -Wextra -pedantic'
" Rust
let g:syntastic_rust_checkers = ['cargo', 'rustc']

" ============================= Interface ==============================
syntax enable
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set expandtab
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
"Marks remembered for last 100 edited files, 1000 line limit register save
set viminfo='100,<1000,s100,h
" Python shift/tab widths = 2
au FileType python setl shiftwidth=2 tabstop=2
" Rust shift/tab widths = 4
au FileType rust setl shiftwidth=4 tabstop=4
" Assembly tab widths = 8
au FileType atlas setl shiftwidth=8 tabstop=8

" Jump to where you left off when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" ============================== Keymappings ==============================
" :nore --> not recursive, the second argument will not be expanded
" :map & :noremap map for all modes
" :imap & :inoremap for insert mode, etc
" tagbar mapping
vnoremap Y :w! ~/.vbuf<CR>
nnoremap P :r ~/.vbuf<CR>
nmap ,b :TagbarToggle<CR>
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
" vmap <S-c> :'<,'>w! ~/.vbuf<CR>      "copy the current visual selection to ~/.vbuf
vmap <C-y> :w! ~/.vbuf<CR>      "copy the current visual selection to ~/.vbuf
nmap <C-p> :r ~/.vbuf<CR>       "paste the contents of the buffer file
" Change cursor to line when in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
