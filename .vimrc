" .vimrc baseado em rwxrob
let skip_defaults_vim=1
set nocompatible


" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" active line numbers
set number

" turn col and row position on in bottom right
set ruler

" show command in insert mode
set showmode

set tabstop=2

" don't go too far
set colorcolumn=80
set cc=+1
hi ColorColumn ctermbg=darkgrey guibg=darkgrey

" give some space
set scrolloff=8

" Better command-line completion
set wildmenu

set softtabstop=2

" Mostly use with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
	" stop vim from silently messing with files that it shouldn't
	set nofixendofline

	" better ascii friendly listchars
	set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

	" i hate automatic filding
	set foldmethod=manual
	set nofoldenable
endif

" Mark trailing spaces as erros
match ErrorMsg '\s\+$'

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

" enough for line numbers + gutter within 80 standard
set textwidth=72

" replace tabs with spaces automatically
set expandtab

" desable relative line numbers, remove no to sample it
set norelativenumber

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'hit enter ....' messages
set shortmess=aoOtTI

" prevent truncated yanks, deletes, etc
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
let g:loaded_matchparen=1
set noshowmatch

" wrap around when searching
set wrapscan

" Just the defaults, these are changed per filetype by plugins.
" Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

" stop complains about switching buffer with changes
set hidden

" command history
set history=100

" here because somo plugins need it
syntax enable

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" high contrast
set background=dark

" base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=darkgrey ctermbg=NONE
hi StatusLineNC ctermfg=darkgrey ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=darkgrey ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi ModeMsg ctermfg=NONE cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred

" color overrides
au FileType * hi StatusLine ctermfg=darkgrey ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=darkgrey ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=darkgrey ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=NONE cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE

" Edit/Reload vimr configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>

set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

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

" only load plugins if plug is detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'cespare/vim-toml'
  Plug 'pangloss/vim-javascript'
  Plug 'vim-go/vim-go'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } " Python Mode
  Plug 'vim-scripts/indentpython.vim'
  Plug 'valloric/youcompleteme'
  Plug 'nvie/vim-flake8'
  Plug 'jmcantrell/vim-virtualenv'
  call plug#end()

   " golang
  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  "let g:go_auto_type_info = 1 " forces 'Press ENTER' too much
  let g:go_auto_sameids = 0
  "let g:go_metalinter_command='golangci-lint'
  "let g:go_metalinter_command='golint'
  "let g:go_metalinter_autosave=1
  set updatetime=100
  "let g:go_gopls_analyses = { 'composites' : v:false }
  au FileType go nmap <leader>t :GoTest!<CR>
  au FileType go nmap <leader>v :GoVet!<CR>
  au FileType go nmap <leader>b :GoBuild!<CR>
  au FileType go nmap <leader>c :GoCoverageToggle<CR>
  au FileType go nmap <leader>i :GoInfo<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>
else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

