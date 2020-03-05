" Startup {{{

set nofoldenable
set autoread
"autocmd BufWritePost ~/.vimrc source ~/.vimrc

" }}}

" General {{{

set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap =<,>,[,]
set clipboard=unnamed
set winaltkeys=no
set formatoptions-=croql

" }}}

" Lang & Encoding {{{

set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8

" }}}

" GUI {{{

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set cursorline
highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold

set hlsearch
noh
set relativenumber

hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

set background=dark
colorscheme gruvbox

" }}}

" Format {{{

set autoindent
set smartindent
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4
syntax on

" }}}

" Keymap {{{

" page-down/up
nnoremap <C-J> <C-F>
inoremap <C-J> <Esc><C-F>a
nnoremap <C-K> <C-B>
inoremap <C-K> <Esc><C-B>a

" saving
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>

" close pane
nnoremap <leader>q :q
inoremap <leader>q <Esc>:q

" replace
nnoremap <C-R> :Replace 
inoremap <C-R> <Esc>:Replace 

" undo/redo
nnoremap <C-Z> u
inoremap <C-Z> <Esc>ua
nnoremap <C-Y> <C-R>
inoremap <C-Y> <Esc><C-R>a

" copy/cut/paste
nnoremap <C-C> yy
inoremap <C-C> <Esc>yya
vnoremap <C-C> y

nnoremap <C-X> dd
inoremap <C-X> <Esc>dda
vnoremap <C-X> d

nnoremap <C-V> p
inoremap <C-V> <Esc>pa

" remove line
nnoremap <C-D> "_dd
inoremap <C-D> <Esc>"_dda

" tab manipulation
nnoremap <C-Q> :tabc<CR>
inoremap <C-Q> <Esc>:tabc<CR>

nnoremap <C-N> :tabn<CR>
inoremap <C-N> <Esc>:tabn<CR>

nnoremap <C-P> :tabp<CR>
inoremap <C-P> <Esc>:tabp<CR>

" auto comment
nmap <C-_> gcc<CR>
imap <C-_> <Esc>gcc<CR>a
vmap <C-_> gc<CR>

" remove highlight
nnoremap <F3> :noh<CR>

" use bash command
nnoremap <C-T> :!
inoremap <C-T> <Esc>:!
vnoremap <C-T> <Esc>:!

" }}}

" Plugin {{{

call plug#begin('~/.vim/bundle/')
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'dkprice/vim-easygrep'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
call plug#end()

" COC.nvim {{{

let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-prettier', 
	\ 'coc-json', 
\ ]

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_snippet_next = '<C-N>'

" }}}

" CtrlP {{{

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" }}}

" Airline {{{

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" }}}

" vim-go {{{

let g:go_fmt_command = "goimports"

" }}}

" NERDTree {{{

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=28
let NERDTreeChDirMode=1
nmap <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" }}}

" NERDTree-git {{{

let g:NERDTreeIndicatorMapCustom = {
	\ "Modified" :"✹",
	\ "Staged" :"✚",
	\ "Untracked" :"✭",
	\ "Renamed" :"➜",
	\ "Unmerged" :"═",
	\ "Deleted" :"✖",
	\ "Dirty" :"✗",
	\ "Clean" :"✔︎",
	\ "Ignored" : '☒',
	\ "Unknown" :"?"
\ }

" }}}

" Tagbar {{{

nmap <F4> :TagbarToggle<CR>
let g:tagbar_width=28
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" }}}

" }}}

" Function {{{

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
	if &ft != "diff"
		let b:curcol = col(".")
		let b:curline = line(".")
		silent! %s/\s\ $//
		silent! %s/\(\s*\n\)\ \%$//
		call cursor(b:curline, b:curcol)
	endif
endfunction
" autocmd BufWritePre * call RemoveTrailingWhitespace()

" }}}
