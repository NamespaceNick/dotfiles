" Vim config file
" Nicolas Williams. December 19th, 2017

" ============================= Plugins ==============================
" Better Vim
set nocompatible
" For plugin manager
filetype off

" Plugins
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'rust-lang/rust.vim'
Plug 'rust-lang/cargo'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'mhinz/vim-startify'
Plug 'cespare/vim-toml'

call plug#end()

"TODO: Add the Plugin manager/plugins

filetype plugin indent on

" ============================= Plugin Configs =========================

" Solarized
set background=dark
let g:solarized_termcolors=16
let g:solarized_italic=1
colorscheme solarized

let g:livepreview_previewer = 'open -a Preview'
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
" Cplusplus
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wconversion -Wall -Werror -Wextra -pedantic'
" Rust
let g:syntastic_rust_checkers = ['cargo', 'rustc']

" Vim-commentary
"let g:airline_theme='deus'
"let g:Powerline_symbols='unicode'

" Vim-Markdown
let vim_markdown_preview_browser='Firefox'
let g:markdown_syntax_conceal = 0

" Vim-Markdown preview
let vim_markdown_preview_github=1

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
" Change cursor to line when in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
