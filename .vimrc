" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" search down into subfolders
set path+=.,**

" ================ General Config ===================
set exrc
set guicursor=
set guifont=*
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autowrite
set smartindent
set nowrap
set noswapfile
set nowb
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set background=dark
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Give more space for displaying messages
set cmdheight=2

" Shorter updatetime
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

syntax enable
filetype plugin on

" Display all matching files when we tab complete
set wildmenu

" set path tho python
" let g:python3_host_prog='/home/bruno/.pyenv/shims/python'

" create the 'tags' file
command! MakeTags !ctags -R .

" Trin whitespace after save the file
fun! TrinWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup BRUNO_ALVIM
    autocmd!
    autocmd BufWritePre * :call TrinWhitespace()
augroup END

" Set config depending on the tipe of file open
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Split navigation
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } " Python Mode
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'valloric/youcompleteme'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'morhetz/gruvbox'

call plug#end()

"colorscheme dracula
colorscheme gruvbox

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

