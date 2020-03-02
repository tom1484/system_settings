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
" Vim 的預設暫存器和系統剪貼簿共享
set clipboard =unnamed
" 設定 alt 鍵不對映到選單欄
set winaltkeys=no
set formatoptions-=cro
" }}}

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}

" GUI {{{
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set cursorline
highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold

set hlsearch
:noh
set relativenumber

hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

set background=dark
colorscheme gruvbox
" colorscheme solarized8

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
nmap <C-J> <C-F>
imap <C-J> <Esc><C-F>a
nmap <C-K> <C-B>
imap <C-K> <Esc><C-B>a

imap <C-S> <Esc>:w<CR>
nmap <C-S> :w<CR>

nmap <C-R> :Replace 
imap <C-R> <Esc>:Replace 

nnoremap <C-Z> u
inoremap <C-Z> <Esc>ua
nnoremap <C-Y> <C-R>
inoremap <C-Y> <Esc><C-R>a

imap <C-W> <Esc><C-W>
imap <C-W>c <Esc>:tabc<CR>
nmap <C-W>c :tabc<CR>

imap <C-N> <Esc>:tabn<CR>
nmap <C-N> :tabn<CR>
imap <C-P> <Esc>:tabp<CR>
nmap <C-P> :tabp<CR>

nmap <C-_> gcc<CR>
imap <C-_> <Esc>gcc<CR>a
vmap <C-_> gc<CR>

nmap <F3> :noh<CR>

nmap <C-T> :!
imap <C-T> <Esc>:!
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
"let g:airline_theme='simple'
"let g:airline_statusline_ontop=1
" }}}

" vim-go {{{
let g:go_fmt_command = "goimports"
" }}}

" NERDTree {{{
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=32
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
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}

