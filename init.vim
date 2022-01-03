" Vim-Plug
call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-clang'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdtree'                   " NerdTree
Plug 'vim-airline/vim-airline'              " Status bar
Plug 'preservim/tagbar'                     " Tagbar for code navigation
Plug 'sainnhe/sonokai'                      " Color Scheme
Plug 'jiangmiao/auto-pairs'               " Auto-close braces and scopes

call plug#end()

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

set termguicolors
set background=dark
colorscheme sonokai
let g:sonokai_style='andromeda'
syntax on

" Map the leader key to SPACE
let mapleader="\<SPACE>"

set nocompatible                      " disable compatibility to old-time vi
set showmatch                         " show matching 
set ignorecase                        " case insensitive 
set hlsearch                          " highlight search 
set incsearch                         " incremental search
set tabstop=2                         " number of columns occupied by a tab 
set softtabstop=2                     " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                         " converts tabs to white space
set shiftwidth=2                      " width for autoindents
set autoindent                        " indent a new line the same amount as the line just typed
set number                            " add line numbers
set relativenumber                    " shows relative numbers to current line
set wildmode=longest,list             " get bash-like tab completions
" set cc=80                           " set an 80 column border for good coding style
filetype plugin indent on             "allow auto-indenting depending on file type
syntax on                             " syntax highlighting
set mouse=a                           " enable mouse click
set clipboard=unnamedplus             " using system clipboard
filetype plugin on
set cursorline                        " highlight current cursorline
set ttyfast                           " Speed up scrolling in Vim
" set spell                           " enable spell check (may need to download language package)
set backupdir=~/.cache/vim            " Directory to store backup files.

" Set deoplete jedi to use python3
let g:deoplete#sources#jedi#python_path = 'python3'

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Buffer and around source of deoplete is of little use for auto-complete
call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})

" Maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Linters
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
    \ }


" Neoformat Settings
"
" Neoformat only messages on error
let g:neoformat_only_msg_on_error = 1

" Increase verbosity of the messages
"let g:neoformat_verbose = 1


" C/C++ clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"'],
    \ }
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']




"                       ********* REMAPS **********
nmap <F8> :TagbarToggle<CR>     " For Tagbar Plug

" instead of constantly writing :Neoformat
nnoremap <leader>f :Neoformat<CR>

" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" For deoplete autocomplete on tab or shift tab
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
