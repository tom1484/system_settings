""" FILETYPES

autocmd filetype c source ~/.vim/filetype/c.vim
autocmd filetype cpp source ~/.vim/filetype/cpp.vim
autocmd filetype python source ~/.vim/filetype/python.vim
autocmd filetype go source ~/.vim/filetype/go.vim

""" SYNTAX

syntax on
filetype plugin indent on

set foldlevel=99
set formatoptions-=cro

""" BEHAVIOR

set mouse=a
" set whichwrap=b,s,<,>,[,]
set whichwrap+=<,>,[,]

""" SYSTEM

silent !stty -ixon

set nocompatible
set nobackup
set nobomb
set noswapfile
set noshowcmd

set nolazyredraw
set ttyfast

set autoread
autocmd CursorHold * checktime

set history=1024
set clipboard=unnamed

set ttimeoutlen=0
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

""" LANGUAGE

let &t_TI=""
let &t_TE=""

""" GUI

set background=dark

set cursorline
highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold
highlight Folded term=NONE cterm=NONE

set number norelativenumber

""" INDENT

let tab_filetype=['go']

if index(tab_filetype, &filetype)
    set tabstop=8
    set softtabstop=0
    set expandtab
    set shiftwidth=4
    set smarttab
else
    set autoindent
    set smartindent
    set tabstop=4
    set noexpandtab
    set shiftwidth=4
    set softtabstop=4
    set list lcs=tab:\|\-
endif
